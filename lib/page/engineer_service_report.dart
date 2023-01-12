import 'package:flutter/material.dart';
import 'package:pdf_app/api/pdf_api.dart';
import 'package:pdf_app/api/pdf_report_api.dart';
import 'package:pdf_app/model/report_model.dart';
import 'package:pdf_app/widget/button_widget.dart';

class EngineerServiceReport extends StatefulWidget {
  const EngineerServiceReport({Key? key}) : super(key: key);

  @override
  _EngineerServiceReportState createState() => _EngineerServiceReportState();
}

class _EngineerServiceReportState extends State<EngineerServiceReport> {
  TextEditingController cityJobRefController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController clientJobController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController siteContactController = TextEditingController();
  TextEditingController siteAddressController = TextEditingController();
  TextEditingController telNoController = TextEditingController();
  TextEditingController travelStartTimeController = TextEditingController();
  TextEditingController travelEndTimeController = TextEditingController();
  TextEditingController travelTotalTimeController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController engineerReportController = TextEditingController();
  TextEditingController partsUsedController = TextEditingController();
  TextEditingController customerCommentsController = TextEditingController();
  TextEditingController engineerNameController = TextEditingController();
  TextEditingController extraCommentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.85),
        appBar: AppBar(
          title: Text("ENGINEER SERVICE REPORT"),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "City Job Ref";
                    }
                  },
                  controller: cityJobRefController,
                  hintText: "City Job Ref",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "name";
                    }
                  },
                  controller: nameController,
                  hintText: "Enter Name",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "Date";
                    }
                  },
                  controller: dateController,
                  hintText: "Enter Date",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "Client Job";
                    }
                  },
                  controller: clientJobController,
                  hintText: "Client Job",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "Client Name";
                    }
                  },
                  controller: clientNameController,
                  hintText: "Client Name",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "Site Contact";
                    }
                  },
                  controller: siteContactController,
                  hintText: "Site Contact",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "Site Address";
                    }
                  },
                  controller: siteAddressController,
                  hintText: "Site Address",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "Tel No";
                    }
                  },
                  controller: telNoController,
                  hintText: "Tel No  ",
                ),
                SizedBox(
                  height: 12,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    child: Material(
                      child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: Text(
                          'Repair (Call Out)',
                          style: myStyle(16, Colors.black54),
                        ),
                        value: isRepair,
                        onChanged: (bool? value) {
                          setState(() {
                            isRepair = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    child: Material(
                      child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: Text(
                          'Repair (NON Call Out)',
                          style: myStyle(16, Colors.black54),
                        ),
                        value: isRepair2,
                        onChanged: (bool? value) {
                          setState(() {
                            isRepair2 = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    child: Material(
                      child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: Text(
                          'Service',
                          style: myStyle(16, Colors.black54),
                        ),
                        value: isService,
                        onChanged: (bool? value) {
                          setState(() {
                            isService = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    child: Material(
                      child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: Text(
                          'Installation',
                          style: myStyle(16, Colors.black54),
                        ),
                        value: isInstallation,
                        onChanged: (bool? value) {
                          setState(() {
                            isInstallation = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    child: Material(
                      child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: Text(
                          'Warranty',
                          style: myStyle(16, Colors.black54),
                        ),
                        value: isWarrenty,
                        onChanged: (bool? value) {
                          setState(() {
                            isWarrenty = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "Start Time(Site Time/Travel)";
                    }
                  },
                  controller: travelStartTimeController,
                  hintText: "Start Time(Site Time/Travel)",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "Finish Time(Site Time/Travel)";
                    }
                  },
                  controller: travelEndTimeController,
                  hintText: "Finish Time(Site Time/Travel)",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null) {
                      return "Total Time(Site Time/Travel)";
                    }
                  },
                  controller: travelTotalTimeController,
                  hintText: "Total Time(Site Time/Travel)",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.newline,
                  validator: (value) {
                    if (value == null) {
                      return "Job Description";
                    }
                  },
                  controller: jobDescriptionController,
                  hintText: "Job Description",
                ),
                SizedBox(
                  height: 12,
                ),
               CustomeTextField(
                 textInputAction: TextInputAction.newline,
                  validator: (value) {
                    if (value == null) {
                      return "Engineer Report";
                    }
                  },
                  controller: engineerReportController,
                  hintText: "Engineer Report",
                ),

                SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {

                  },
                  controller: partsUsedController,
                  hintText: "Parts Used If Applicable",
                ),
                 SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {

                  },
                  controller: customerCommentsController,
                  hintText: "Customer Comments",
                ),

                 SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {

                  },
                  controller: engineerNameController,
                  hintText: "Engineer Name",
                ),
   SizedBox(
                  height: 12,
                ),




                ButtonWidget(
                  text: 'Create PDF',
                  onClicked: () async {
                    var reportModel = ReportModel(
                      date: dateController.text.toString(),
                      name: nameController.text.toString(),
                      jobDescription: jobDescriptionController.text.toString(),
                      cityJobRef: cityJobRefController.text.toString(),
                      clientJob: clientJobController.text.toString(),
                      clientName: clientNameController.text.toString(),
                      engineerReport: engineerReportController.text.toString(),
                      siteAddress: siteAddressController.text.toString(),
                      siteContact: siteContactController.text.toString(),
                      telNo: telNoController.text.toString(),
                      travelFinishTime: travelEndTimeController.text.toString(),
                      travelStartTime:
                          travelStartTimeController.text.toString(),
                      travelTotalTime:
                          travelTotalTimeController.text.toString(),
                      isInstallation: isInstallation,
                      isRepairCallOut: isRepair,
                      isService: isService,
                      isWarrenty: isWarrenty,
                      isRepair2: isRepair2,

                      partsUsedIfApplicable: partsUsedController.text.toString(),
                      customerComments: customerCommentsController.text.toString(),
                      engineerName: engineerNameController.text.toString(),
                      extraText: extraCommentsController.text.toString(),

                    );
                    final pdfFile = await PdfReportApi.generate(reportModel);

                    PdfApi.openFile(pdfFile);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  bool isRepair = false;
  bool isRepair2 = false;
  bool isService = false;
  bool isInstallation = false;
  bool isWarrenty = false;
}
