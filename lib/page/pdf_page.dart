import 'package:flutter/material.dart';
import 'package:pdf_app/api/pdf_api.dart';
import 'package:pdf_app/api/pdf_invoice_api.dart';
import 'package:pdf_app/model/customer.dart';
import 'package:pdf_app/model/invoice.dart';
import 'package:pdf_app/model/supplier.dart';
import 'package:pdf_app/widget/button_widget.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  TextEditingController quotationNumberController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController attentionOfController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController siteNameController = TextEditingController();
  TextEditingController quoteDateController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController quoteNumberController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController jobLocationController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController clientSignedController = TextEditingController();
  TextEditingController purchaseOrderNumberController = TextEditingController();
  TextEditingController partNoController = TextEditingController();
  TextEditingController partDescriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode positionFocusNode = FocusNode();
  int count = 1;
  List<InvoiceItem> itemList = [];

  _showMyDialog() async {
    return showDialog(
      context: context,

      //  barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white70,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.80,
                width: double.maxFinite,
                child: ListView(
                  children: [
                    CustomeTextField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null) {
                          return "Part No required";
                        }
                      },
                      controller: partNoController,
                      hintText: "Part No",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomeTextField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null) {
                          return "Part Description required";
                        }
                      },
                      controller: partDescriptionController,
                      hintText: "Description",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomeTextField(
                      keyType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null) {
                          return "Part Quantity required";
                        }
                      },
                      controller: quantityController,
                      hintText: "Quantity",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomeTextField(
                      keyType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null) {
                          return "Unit Price required";
                        }
                      },
                      controller: unitPriceController,
                      hintText: "Unit Price",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        itemList.add(InvoiceItem(
                            description:
                                partDescriptionController.text.toString(),
                            itemNo: itemList.length + 1,
                            partNo: partNoController.text.toString(),
                            quantity:
                                int.parse(quantityController.text.toString()),
                            unitPrice: double.parse(
                                unitPriceController.text.toString())));
                        partNoController.clear();
                        partDescriptionController.clear();
                        quantityController.clear();
                        unitPriceController.clear();
                        setState(() {});
                        // Navigator.pop(context);
                      },
                      child: Text("Submit",style: myStyle(18,Colors.white),),
                      elevation: 0,
                      color: Colors.deepOrange,
                      minWidth: 150,
                    ),
                    SizedBox(height: 20,),
                    Text("Total Item : ${itemList.length}",style: myStyle(18,Colors.deepOrange),),
                    SizedBox(height: 20,),

                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: itemList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(

                                children: [
                                  Text("${itemList[index].partNo}"),
                                  SizedBox(width: 20,),
                                  Text(
                                      "${itemList[index].quantity} * ${itemList[index].unitPrice!.toStringAsFixed(0)}"),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      itemList.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete,color:  Colors.red,))
                            ],
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        onPressed: () {
            Navigator.pop(context);},
                        child: Text("Go Back",style: myStyle(18,Colors.white),),
                        elevation: 0,
                        color: Colors.deepOrange,
                        minWidth: 150,
                      ) ,
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    ).then((value) => setState(() {}));
  }
  final ScrollController _controller = ScrollController();
  final double _height = 100.0;

  void _animateToIndex(int index) {
    _controller.animateTo(
      index * _height,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white.withOpacity(0.85),
        appBar: AppBar(
          title: Text("Quotation"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  focusNode: firstNameFocusNode,
                  validator: (value) {
                    if (value == null) {
                      return "Quotation Number required";
                    }
                    if (value.length < 3) {
                      return "Quotation Number too short";
                    }
                  },
                  controller: quotationNumberController,
                  hintText: "Quotation Number",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  focusNode: lastNameFocusNode,
                  validator: (value) {
                    if (value == null) {
                      return "Client Name required";
                    }
                    if (value.length < 3) {
                      return "Client Name too short";
                    }
                  },
                  controller: clientNameController,
                  hintText: "Client Name",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  //   focusNode:lastNameFocusNode,
                  validator: (value) {
                    if (value == null) {
                      return "Attention Of required";
                    }
                    if (value.length < 3) {
                      return "Attention Of short";
                    }
                  },
                  controller: attentionOfController,
                  hintText: "Attention Of",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  //   focusNode:lastNameFocusNode,
                  validator: (value) {
                    if (value == null) {
                      return "Correspondence Address required";
                    }
                    if (value.length < 3) {
                      return "Correspondence Address short";
                    }
                  },
                  controller: addressController,
                  hintText: "Correspondence Address",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  //   focusNode:lastNameFocusNode,
                  validator: (value) {
                    if (value == null) {
                      return "Site Name/Address required";
                    }
                  },
                  controller: siteNameController,
                  hintText: "Site Name/Address",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  //   focusNode:lastNameFocusNode,
                  validator: (value) {
                    if (value == null) {
                      return "Quote Date";
                    }
                  },
                  controller: quoteDateController,
                  hintText: "Quote Date",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomeTextField(
                  keyType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  //   focusNode:lastNameFocusNode,
                  validator: (value) {
                    if (value == null) {
                      return "Quote Number";
                    }
                  },
                  controller: quoteNumberController,
                  hintText: "Quote Number",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomeTextField(
                  maxLine: 5,
                  textInputAction: TextInputAction.next,
                  //   focusNode:lastNameFocusNode,
                  validator: (value) {
                    if (value == null) {
                      return "Job Description";
                    }
                  },
                  controller: jobDescriptionController,
                  hintText: "Job Description",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  //   focusNode:lastNameFocusNode,
                  validator: (value) {
                    if (value == null) {
                      return "Job Location";
                    }
                  },
                  controller: jobLocationController,
                  hintText: "Job Location",
                ),

                /*TitleWidget(
                  icon: Icons.picture_as_pdf,
                  text: 'Generate Invoice',
                ),*/
                SizedBox(
                  height: 20,
                ),

                InkWell(
                  onTap: () {
                    _showMyDialog();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Items ( Total Items :  ${itemList.length} )",
                        style: myStyle(18, Colors.deepOrange),
                      ),
                      Icon(
                        Icons.add_box_rounded,
                        size: 25,
                        color: Colors.deepOrange,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ButtonWidget(
                    text: 'Add Client Info',
                    onClicked: () {

                      _animateToIndex(10);
                      setState(() {
                        x = true;
                      });
                    }),
                Visibility(
                    visible: x,
                    child: Column(
                      children: [
                        /*     SizedBox(
                      height: 20,
                    ),
                    CustomeTextField(
                      textInputAction: TextInputAction.next,
                      //   focusNode:lastNameFocusNode,
                      validator: (value) {
                        if (value == null) {
                          return "Customer Name";
                        }
                      },
                      controller: clientNameController,
                      hintText: "Customer Name",
                    ),*/

                        SizedBox(
                          height: 20,
                        ),
                        CustomeTextField(
                          textInputAction: TextInputAction.next,
                           focusNode:positionFocusNode,
                          validator: (value) {
                            if (value == null) {
                              return "Customer Position";
                            }
                          },
                          controller: positionController,
                          hintText: "Position",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomeTextField(
                          textInputAction: TextInputAction.next,
                          //   focusNode:lastNameFocusNode,
                          validator: (value) {
                            if (value == null) {
                              return "Date";
                            }
                          },
                          controller: dateController,
                          hintText: "Date",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomeTextField(
                          textInputAction: TextInputAction.next,
                          //   focusNode:lastNameFocusNode,
                          validator: (value) {
                            if (value == null) {
                              return "Purchase Order Number";
                            }
                          },
                          controller: purchaseOrderNumberController,
                          hintText: "Purchase Order Number",
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),

                Visibility(
                  visible: x,
                  child: ButtonWidget(
                    text: 'Invoice PDF',
                    onClicked: () async {
                      final date = DateTime.now();
                      final dueDate = date.add(Duration(days: 7));

                      final invoice = Invoice(
                          quotation: Quotation(
                              quotationNumber:
                                  quotationNumberController.text.toString(),
                              client: clientNameController.text.toString(),
                              attentionOf:
                                  attentionOfController.text.toString(),
                              correspondingAddress:
                                  addressController.text.toString(),
                              siteName: siteNameController.text.toString(),
                              quoteDate: quoteDateController.text.toString(),
                              quoteNumber:
                                  quoteNumberController.text.toString(),
                              jobDescription:
                                  jobDescriptionController.text.toString(),
                              jobLocation:
                                  jobLocationController.text.toString(),
                              name: clientNameController.text.toString(),
                              date: dateController.text.toString(),
                              signed: clientNameController.text.toString(),
                              position: positionController.text.toString(),
                              purchedOrderNumber: purchaseOrderNumberController
                                  .text
                                  .toString()),
                          supplier: Supplier(
                            name: 'Sarah Field',
                            address: 'Sarah Street 9, Beijing, China',
                            paymentInfo: 'https://paypal.me/sarahfieldzz',
                          ),
                          customer: Customer(
                            name: 'Apple Inc.',
                            address: 'Apple Street, Cupertino, CA 95014',
                          ),
                          info: InvoiceInfo(
                            date: date,
                            dueDate: dueDate,
                            description: 'My description...',
                            number: '${DateTime.now().year}-9999',
                          ),
                          items: itemList);

                      final pdfFile = await PdfInvoiceApi.generate(
                        invoice,
                      );

                      PdfApi.openFile(pdfFile);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  bool x = false;
}
