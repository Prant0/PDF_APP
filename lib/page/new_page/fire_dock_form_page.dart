import 'package:flutter/material.dart';
import 'package:pdf_app/api/pdf_api.dart';
import 'package:pdf_app/new_api/fire_dock_api.dart';
import 'package:pdf_app/widget/button_widget.dart';

class FireDocFormPage extends StatefulWidget {
  const FireDocFormPage({super.key});

  @override
  State<FireDocFormPage> createState() => _FireDocFormPageState();
}

class _FireDocFormPageState extends State<FireDocFormPage> {
  bool? isLogbookComplete;

  TextEditingController customerName = TextEditingController();
  TextEditingController siteAddress = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController dischargeHoseQty = TextEditingController();
  TextEditingController cartridgeQty = TextEditingController();
  TextEditingController c02HornQty = TextEditingController();
  TextEditingController c02HoseQty = TextEditingController();
  TextEditingController wallBracketQty = TextEditingController();
  TextEditingController backboardQty = TextEditingController();
  TextEditingController idSignQty = TextEditingController();
  TextEditingController fireActionSignQty = TextEditingController();
  TextEditingController directionalSignQty = TextEditingController();
  TextEditingController fireLogBookQty = TextEditingController();
  TextEditingController signleStandQty = TextEditingController();
  TextEditingController doubleStandQty = TextEditingController();
  TextEditingController extraQty1 = TextEditingController();
  TextEditingController extraPartsName1 = TextEditingController();
  TextEditingController extraPartsName2 = TextEditingController();
  TextEditingController extraPartsName3 = TextEditingController();
  TextEditingController extraQty2 = TextEditingController();
  TextEditingController extraQty3 = TextEditingController();
  TextEditingController otherEquipmentServiced1 = TextEditingController();
  TextEditingController otherEquipmentServiced2 = TextEditingController();
  TextEditingController otherEquipmentServiced3 = TextEditingController();
  TextEditingController otherEquipmentServiced4 = TextEditingController();
  TextEditingController otherEquipmentServiced5 = TextEditingController();
  TextEditingController otherEquipmentServiced6 = TextEditingController();
  TextEditingController otherEquipmentServiced7 = TextEditingController();
  TextEditingController otherEquipmentServiced8 = TextEditingController();
  TextEditingController otherEquipmentServiced9 = TextEditingController();
  TextEditingController otherEquipmentServiced10 = TextEditingController();
  TextEditingController otherEquipmentServiced11 = TextEditingController();
  TextEditingController otherEquipmentServiced12 = TextEditingController();
  TextEditingController otherEquipmentServiced13 = TextEditingController();
  TextEditingController additionalComments = TextEditingController();
  TextEditingController technicalSign = TextEditingController();
  TextEditingController signDate = TextEditingController();
  TextEditingController customerSign = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController printName = TextEditingController();
  TextEditingController pleaseWriteName = TextEditingController();
  bool isService = false;
  bool isLogBookComplete = false;
  bool isCallOut = false;
  bool isDelivery = false;
  bool isPartsSupplied = false;
  bool isOtherEquipmentServiced = false;
  bool isWorkCarriedOut = false;

  bool isFoam = false;
  bool isFoam2L = false;
  bool isFoam6L = false;
  bool isFoam9L = false;

  bool isCarbonDioxide = false;
  bool isCarbonDioxide2kg = false;
  bool isCarbonDioxide5kg = false;

  bool isWetChemical = false;
  bool isWetChemical6Ltr = false;
  bool isWetChemical9Ltr = false;

  bool isWaterAdditive = false;
  bool isWaterAdditive6L = false;
  bool isWaterAdditive9L = false;

  bool isWater = false;
  bool isWater9L = false;

  bool isFireBlanket = false;

  bool isHoseReel = false;
  bool isExtraWorkedOut1 = false;
  bool isExtraWorkedOut2 = false;
  bool isExtraWorkedOut3 = false;

  bool isPowder = false;
  bool isPowder4Kg = false;
  bool isPowder6Kg = false;
  bool isPowder9Kg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3E5F5),
      appBar: AppBar(
        backgroundColor: Color(0xffF3E5F5),
        title: Text(
          " Fire Doc ",
          style: TextStyle(
              fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomeTextField(
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null) {
                    return "Customer name";
                  }
                },
                controller: customerName,
                hintText: "Customer name",
              ),
              SizedBox(
                height: 12,
              ),
              CustomeTextField(
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null) {
                    return "Site address";
                  }
                },
                controller: siteAddress,
                hintText: "Site address",
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
                controller: date,
                hintText: "Date",
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Service done",
                    style: myStyle(18, Colors.red, FontWeight.w700),
                  ),
                  Radio(
                    value: true,
                    groupValue: isService,
                    onChanged: (value) {
                      setState(() {
                        isService = value!;
                      });
                    },
                  ),
                  Text('Yes'),
                  Radio(
                    value: false,
                    groupValue: isService,
                    onChanged: (value) {
                      setState(() {
                        isService = value!;
                      });
                    },
                  ),
                  Text('No'),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Call out",
                    style: myStyle(18, Colors.red, FontWeight.w700),
                  ),
                  Radio(
                    value: true,
                    groupValue: isCallOut,
                    onChanged: (value) {
                      setState(() {
                        isCallOut = value!;
                      });
                    },
                  ),
                  Text('Yes'),
                  Radio(
                    value: false,
                    groupValue: isCallOut,
                    onChanged: (value) {
                      setState(() {
                        isCallOut = value!;
                      });
                    },
                  ),
                  Text('No'),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Delivery",
                    style: myStyle(18, Colors.red, FontWeight.w700),
                  ),
                  Radio(
                    value: true,
                    groupValue: isDelivery,
                    onChanged: (value) {
                      setState(() {
                        isDelivery = value!;
                      });
                    },
                  ),
                  Text('Yes'),
                  Radio(
                    value: false,
                    groupValue: isDelivery,
                    onChanged: (value) {
                      setState(() {
                        isDelivery = value!;
                      });
                    },
                  ),
                  Text('No'),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Log Book Complete",
                    style: myStyle(18, Colors.red, FontWeight.w700),
                  ),
                  Radio(
                    value: true,
                    groupValue: isLogBookComplete,
                    onChanged: (value) {
                      setState(() {
                        isLogBookComplete = value!;
                      });
                    },
                  ),
                  Text('Yes'),
                  Radio(
                    value: false,
                    groupValue: isLogBookComplete,
                    onChanged: (value) {
                      setState(() {
                        isLogBookComplete = value!;
                      });
                    },
                  ),
                  Text('No'),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Parts/Equipment Supplied",
                          style: myStyle(18, Colors.purple, FontWeight.w800),
                        ),
                        Spacer(),
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                isPartsSupplied = !isPartsSupplied;
                              });
                            },
                            child: Icon(
                              isPartsSupplied == false
                                  ? Icons.arrow_downward
                                  : Icons.arrow_upward_outlined,
                              color: Colors.purple,
                            ))
                      ],
                    ),
                    Visibility(
                        visible: isPartsSupplied == true,
                        child: Column(
                          children: [
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Cartridge";
                                }
                              },
                              controller: cartridgeQty,
                              hintText: "Cartridge",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Discharge Hose";
                                }
                              },
                              controller: dischargeHoseQty,
                              hintText: "Discharge Hose",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "C02 Horn";
                                }
                              },
                              controller: c02HornQty,
                              hintText: "C02 Horn",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "C02 Hose/Horn";
                                }
                              },
                              controller: c02HoseQty,
                              hintText: "C02 Hose/Horn",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Wall Bracket";
                                }
                              },
                              controller: wallBracketQty,
                              hintText: "Wall Bracket",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Backboard";
                                }
                              },
                              controller: backboardQty,
                              hintText: "Backboard",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "ID Sign";
                                }
                              },
                              controller: idSignQty,
                              hintText: "ID Sign",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Fire Action Sign";
                                }
                              },
                              controller: fireActionSignQty,
                              hintText: "Fire Action Sign",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Directional Sign";
                                }
                              },
                              controller: directionalSignQty,
                              hintText: "Directional Sign",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Fire Log Book";
                                }
                              },
                              controller: fireLogBookQty,
                              hintText: "Fire Log Book",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Single Stand";
                                }
                              },
                              controller: signleStandQty,
                              hintText: "Single Stand",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Double Stand";
                                }
                              },
                              controller: doubleStandQty,
                              hintText: "Double Stand",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Extra Parts Name 1";
                                }
                              },
                              controller: extraPartsName1,
                              hintText: "Extra Parts Name 1",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Extra Parts QTY 1";
                                }
                              },
                              controller: extraQty1,
                              hintText: "Extra Parts QTY 1",
                            )
                            ,
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Extra Parts Name 2";
                                }
                              },
                              controller: extraPartsName2,
                              hintText: "Extra Parts Name 2",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Extra QTY 2";
                                }
                              },
                              controller: extraQty2,
                              hintText: "Extra QTY 2",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Extra Parts Name 3";
                                }
                              },
                              controller: extraPartsName3,
                              hintText: "Extra Parts Name 3",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Extra QTY 3";
                                }
                              },
                              controller: extraQty3,
                              hintText: "Extra QTY 3",
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Other Equipment Serviced",
                          style: myStyle(18, Colors.purple, FontWeight.w800),
                        ),
                        Spacer(),
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                isOtherEquipmentServiced =
                                    !isOtherEquipmentServiced;
                              });
                            },
                            child: Icon(
                              isOtherEquipmentServiced == false
                                  ? Icons.arrow_downward
                                  : Icons.arrow_upward_outlined,
                              color: Colors.purple,
                            ))
                      ],
                    ),
                    Visibility(
                        visible: isOtherEquipmentServiced == true,
                        child: Column(
                          children: [
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 1";
                                }
                              },
                              controller: otherEquipmentServiced1,
                              hintText: "Other Equipment Serviced 1",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 2";
                                }
                              },
                              controller: otherEquipmentServiced2,
                              hintText: "Other Equipment Serviced 2",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 3";
                                }
                              },
                              controller: otherEquipmentServiced3,
                              hintText: "Other Equipment Serviced 3",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 4";
                                }
                              },
                              controller: otherEquipmentServiced4,
                              hintText: "Other Equipment Serviced 4",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 5";
                                }
                              },
                              controller: otherEquipmentServiced5,
                              hintText: "Other Equipment Serviced 5",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 6";
                                }
                              },
                              controller: otherEquipmentServiced6,
                              hintText: "Other Equipment Serviced 6",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 7";
                                }
                              },
                              controller: otherEquipmentServiced7,
                              hintText: "Other Equipment Serviced 7",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 8";
                                }
                              },
                              controller: otherEquipmentServiced8,
                              hintText: "Other Equipment Serviced 8",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 9";
                                }
                              },
                              controller: otherEquipmentServiced9,
                              hintText: "Other Equipment Serviced 9",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 10";
                                }
                              },
                              controller: otherEquipmentServiced10,
                              hintText: "Other Equipment Serviced 10",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 11";
                                }
                              },
                              controller: otherEquipmentServiced11,
                              hintText: "Other Equipment Serviced 11",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 12";
                                }
                              },
                              controller: otherEquipmentServiced12,
                              hintText: "Other Equipment Serviced 12",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            CustomeTextField(
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null) {
                                  return "Other Equipment Serviced 13";
                                }
                              },
                              controller: otherEquipmentServiced13,
                              hintText: "Other Equipment Serviced 13",
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Work Carried Out",
                          style: myStyle(18, Colors.purple, FontWeight.w800),
                        ),
                        Spacer(),
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                isWorkCarriedOut = !isWorkCarriedOut;
                              });
                            },
                            child: Icon(
                              isWorkCarriedOut == false
                                  ? Icons.arrow_downward
                                  : Icons.arrow_upward_outlined,
                              color: Colors.purple,
                            ))
                      ],
                    ),
                    Visibility(
                      visible: isWorkCarriedOut == true,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Water 9 Ltr  ",
                                style: myStyle(16, Colors.red, FontWeight.w700),
                              ),
                              Spacer(),
                              MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isWater = !isWater;
                                    });
                                  },
                                  child: Icon(
                                    isWater == false
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward_outlined,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: isWater == true,
                              child: Column(
                                children: [
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Total";
                                      }
                                    },
                                    controller: totalWater9L,
                                    hintText: "Total",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Basic Service";
                                      }
                                    },
                                    controller: basicServiceWater9L,
                                    hintText: "Basic Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Extended Service";
                                      }
                                    },
                                    controller: extendedServiceWater9L,
                                    hintText: "Extended Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Re-Charge";
                                      }
                                    },
                                    controller: reChargeWater9L,
                                    hintText: "Re-Charge",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Service Exchange";
                                      }
                                    },
                                    controller: serviceExchangeWater9L,
                                    hintText: "Service Exchange",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Supply New";
                                      }
                                    },
                                    controller: supplyNewWater9L,
                                    hintText: "Supply New",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Disposal";
                                      }
                                    },
                                    controller: disposalWater9L,
                                    hintText: "Disposal",
                                  ),
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                "Water Additive ",
                                style: myStyle(16, Colors.red, FontWeight.w700),
                              ),
                              Spacer(),
                              MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isWaterAdditive = !isWaterAdditive;
                                    });
                                  },
                                  child: Icon(
                                    isWaterAdditive == false
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward_outlined,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: isWaterAdditive == true,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Water Additive 6 Ltr",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isWaterAdditive6L =
                                                  !isWaterAdditive6L;
                                            });
                                          },
                                          child: Icon(
                                            isWaterAdditive6L == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isWaterAdditive6L == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalWaterAdditive6L,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller:
                                                basicServiceWaterAdditive6L,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller:
                                                extendedServiceWaterAdditive6L,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller: reChargeWaterAdditive6L,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller:
                                                serviceExchangeWaterAdditive6L,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller:
                                                supplyNewWaterAdditive6L,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller: disposalWaterAdditive6L,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                        "Water Additive 9 Ltr",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isWaterAdditive9L =
                                                  !isWaterAdditive9L;
                                            });
                                          },
                                          child: Icon(
                                            isWaterAdditive9L == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isWaterAdditive9L == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalWaterAdditive9L,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller:
                                                basicServiceWaterAdditive9L,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller:
                                                extendedServiceWaterAdditive9L,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller: reChargeWaterAdditive9L,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller:
                                                serviceExchangeWaterAdditive9L,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller:
                                                supplyNewWaterAdditive9L,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller: disposalWaterAdditive9L,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                "Foam ",
                                style: myStyle(16, Colors.red, FontWeight.w700),
                              ),
                              Spacer(),
                              MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isFoam = !isFoam;
                                    });
                                  },
                                  child: Icon(
                                    isFoam == false
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward_outlined,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: isFoam == true,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Foam 2 Ltr",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isFoam2L = !isFoam2L;
                                            });
                                          },
                                          child: Icon(
                                            isFoam2L == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isFoam2L == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalFoam2L,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller: basicServiceFoam2L,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller: extendedServiceFoam2L,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller: reChargeFoam2L,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller: serviceExchangeFoam2L,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller: supplyNewFoam2L,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller: disposalFoam2L,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                        "Foam 6 Ltr",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isFoam6L = !isFoam6L;
                                            });
                                          },
                                          child: Icon(
                                            isFoam6L == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isFoam6L == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalFoam6L,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller: basicServiceFoam6L,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller: extendedServiceFoam6L,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller: reChargeFoam6L,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller: serviceExchangeFoam6L,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller: supplyNewFoam6L,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller: disposalFoam6L,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                        "Foam 9 Ltr",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isFoam9L = !isFoam9L;
                                            });
                                          },
                                          child: Icon(
                                            isFoam9L == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isFoam9L == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalFoam9L,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller: basicServiceFoam9L,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller: extendedServiceFoam9L,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller: reChargeFoam9L,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller: serviceExchangeFoam9L,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller: supplyNewFoam9L,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller: disposalFoam9L,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      ))
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                "Carbon Dioxide ",
                                style: myStyle(16, Colors.red, FontWeight.w700),
                              ),
                              Spacer(),
                              MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isCarbonDioxide = !isCarbonDioxide;
                                    });
                                  },
                                  child: Icon(
                                    isCarbonDioxide == false
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward_outlined,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: isCarbonDioxide == true,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Carbon Dioxide 2 Kg",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isCarbonDioxide2kg =
                                                  !isCarbonDioxide2kg;
                                            });
                                          },
                                          child: Icon(
                                            isCarbonDioxide2kg == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isCarbonDioxide2kg == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalCarbonDioxide2kg,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller:
                                                basicServiceCarbonDioxide2kg,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller:
                                                extendedServiceCarbonDioxide2kg,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller:
                                                reChargeCarbonDioxide2kg,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller:
                                                serviceExchangeCarbonDioxide2kg,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller:
                                                supplyNewCarbonDioxide2kg,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller:
                                                disposalCarbonDioxide2kg,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                        "Carbon Dioxide 5 Kg",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isCarbonDioxide5kg =
                                                  !isCarbonDioxide5kg;
                                            });
                                          },
                                          child: Icon(
                                            isCarbonDioxide5kg == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isCarbonDioxide5kg == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalCarbonDioxide5kg,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller:
                                                basicServiceCarbonDioxide5kg,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller:
                                                extendedServiceCarbonDioxide5kg,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller:
                                                reChargeCarbonDioxide5kg,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller:
                                                serviceExchangeCarbonDioxide5kg,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller:
                                                supplyNewCarbonDioxide5kg,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller:
                                                disposalCarbonDioxide5kg,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                "Wet Chemical ",
                                style: myStyle(16, Colors.red, FontWeight.w700),
                              ),
                              Spacer(),
                              MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isWetChemical = !isWetChemical;
                                    });
                                  },
                                  child: Icon(
                                    isWetChemical == false
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward_outlined,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: isWetChemical == true,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Wet Chemical 6Ltr",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isWetChemical6Ltr =
                                                  !isWetChemical6Ltr;
                                            });
                                          },
                                          child: Icon(
                                            isWetChemical6Ltr == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isWetChemical6Ltr == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalWetChemical6L,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller:
                                                basicServiceWetChemical6L,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller:
                                                extendedServiceWetChemical6L,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller: reChargeWetChemical6L,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller:
                                                serviceExchangeWetChemical6L,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller: supplyNewWetChemical6L,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller: disposalWetChemical6L,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                        "Wet Chemical 9 Ltr",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isWetChemical9Ltr =
                                                  !isWetChemical9Ltr;
                                            });
                                          },
                                          child: Icon(
                                            isWetChemical9Ltr == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isWetChemical9Ltr == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalWetChemical9L,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller:
                                                basicServiceWetChemical9L,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller:
                                                extendedServiceWetChemical9L,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller: reChargeWetChemical9L,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller:
                                                serviceExchangeWetChemical9L,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller: supplyNewWetChemical9L,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller: disposalWetChemical9L,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                "Powder ",
                                style: myStyle(16, Colors.red, FontWeight.w700),
                              ),
                              Spacer(),
                              MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isPowder = !isPowder;
                                    });
                                  },
                                  child: Icon(
                                    isPowder == false
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward_outlined,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: isPowder == true,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Powder 4 Kg",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isPowder4Kg = !isPowder4Kg;
                                            });
                                          },
                                          child: Icon(
                                            isPowder4Kg == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isPowder4Kg == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalPowder4Kg,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller: basicServicePowder4Kg,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller:
                                                extendedServicePowder4Kg,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller: reChargePowder4Kg,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller:
                                                serviceExchangePowder4Kg,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller: supplyNewPowder4Kg,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller: disposalPowder4Kg,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                        "Powder 6 Kg",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isPowder6Kg = !isPowder6Kg;
                                            });
                                          },
                                          child: Icon(
                                            isPowder6Kg == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isPowder6Kg == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalPowder6Kg,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller: basicServicePowder6Kg,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller:
                                                extendedServicePowder6Kg,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller: reChargePowder6Kg,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller:
                                                serviceExchangePowder6Kg,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller: supplyNewPowder6Kg,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller: disposalPowder6Kg,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                        "Powder 9 Kg",
                                        style: myStyle(16, Colors.black87,
                                            FontWeight.w700),
                                      ),
                                      Spacer(),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              isPowder9Kg = !isPowder9Kg;
                                            });
                                          },
                                          child: Icon(
                                            isPowder9Kg == false
                                                ? Icons.arrow_downward
                                                : Icons.arrow_upward_outlined,
                                            color: Colors.purple,
                                          ))
                                    ],
                                  ),
                                  Visibility(
                                      visible: isPowder9Kg == true,
                                      child: Column(
                                        children: [
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Total";
                                              }
                                            },
                                            controller: totalPowder9Kg,
                                            hintText: "Total",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Basic Service";
                                              }
                                            },
                                            controller: basicServicePowder9Kg,
                                            hintText: "Basic Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Extended Service";
                                              }
                                            },
                                            controller:
                                                extendedServicePowder9Kg,
                                            hintText: "Extended Service",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Re-Charge";
                                              }
                                            },
                                            controller: reChargePowder9Kg,
                                            hintText: "Re-Charge",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Service Exchange";
                                              }
                                            },
                                            controller:
                                                serviceExchangePowder9Kg,
                                            hintText: "Service Exchange",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Supply New";
                                              }
                                            },
                                            controller: supplyNewPowder9Kg,
                                            hintText: "Supply New",
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          CustomeTextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Disposal";
                                              }
                                            },
                                            controller: disposalPowder9Kg,
                                            hintText: "Disposal",
                                          ),
                                        ],
                                      ))
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                "Fire Blanket  ",
                                style: myStyle(16, Colors.red, FontWeight.w700),
                              ),
                              Spacer(),
                              MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isFireBlanket = !isFireBlanket;
                                    });
                                  },
                                  child: Icon(
                                    isFireBlanket == false
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward_outlined,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: isFireBlanket == true,
                              child: Column(
                                children: [
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Total";
                                      }
                                    },
                                    controller: totalFireBlanket,
                                    hintText: "Total",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Basic Service";
                                      }
                                    },
                                    controller: basicServiceFireBlanket,
                                    hintText: "Basic Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Extended Service";
                                      }
                                    },
                                    controller: extendedServiceFireBlanket,
                                    hintText: "Extended Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Re-Charge";
                                      }
                                    },
                                    controller: reChargeFireBlanket,
                                    hintText: "Re-Charge",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Service Exchange";
                                      }
                                    },
                                    controller: serviceExchangeFireBlanket,
                                    hintText: "Service Exchange",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Supply New";
                                      }
                                    },
                                    controller: supplyNewFireBlanket,
                                    hintText: "Supply New",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Disposal";
                                      }
                                    },
                                    controller: disposalFireBlanket,
                                    hintText: "Disposal",
                                  ),
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                "Hose Reel  ",
                                style: myStyle(16, Colors.red, FontWeight.w700),
                              ),
                              Spacer(),
                              MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isHoseReel = !isHoseReel;
                                    });
                                  },
                                  child: Icon(
                                    isHoseReel == false
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward_outlined,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: isHoseReel == true,
                              child: Column(
                                children: [
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Total";
                                      }
                                    },
                                    controller: totalHoseReel,
                                    hintText: "Total",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Basic Service";
                                      }
                                    },
                                    controller: basicServiceHoseReel,
                                    hintText: "Basic Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Extended Service";
                                      }
                                    },
                                    controller: extendedServiceHoseReel,
                                    hintText: "Extended Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Re-Charge";
                                      }
                                    },
                                    controller: reChargeHoseReel,
                                    hintText: "Re-Charge",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Service Exchange";
                                      }
                                    },
                                    controller: serviceExchangeHoseReel,
                                    hintText: "Service Exchange",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Supply New";
                                      }
                                    },
                                    controller: supplyNewHoseReel,
                                    hintText: "Supply New",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Disposal";
                                      }
                                    },
                                    controller: disposalHoseReel,
                                    hintText: "Disposal",
                                  ),
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                "Extra Worked Carried Out 1  ",
                                style: myStyle(16, Colors.red, FontWeight.w700),
                              ),
                              Spacer(),
                              MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isExtraWorkedOut1 = !isExtraWorkedOut1;
                                    });
                                  },
                                  child: Icon(
                                    isExtraWorkedOut1 == false
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward_outlined,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: isExtraWorkedOut1 == true,
                              child: Column(
                                children: [
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Extra Work 1";
                                      }
                                    },
                                    controller: extraWorkedOut1Title,
                                    hintText: "Extra Work 1 Title",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Size";
                                      }
                                    },
                                    controller: sizeExtraWorkedOut1Title,
                                    hintText: "Size",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Total";
                                      }
                                    },
                                    controller: totalExtraWorkedOut1,
                                    hintText: "Total",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Basic Service";
                                      }
                                    },
                                    controller: basicServiceExtraWorkedOut1,
                                    hintText: "Basic Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Extended Service";
                                      }
                                    },
                                    controller: extendedServiceExtraWorkedOut1,
                                    hintText: "Extended Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Re-Charge";
                                      }
                                    },
                                    controller: reChargeExtraWorkedOut1,
                                    hintText: "Re-Charge",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Service Exchange";
                                      }
                                    },
                                    controller: serviceExchangeExtraWorkedOut1,
                                    hintText: "Service Exchange",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Supply New";
                                      }
                                    },
                                    controller: supplyNewExtraWorkedOut1,
                                    hintText: "Supply New",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Disposal";
                                      }
                                    },
                                    controller: disposalExtraWorkedOut1,
                                    hintText: "Disposal",
                                  ),
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                "Extra Worked Carried Out 2  ",
                                style: myStyle(16, Colors.red, FontWeight.w700),
                              ),
                              Spacer(),
                              MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isExtraWorkedOut2 = !isExtraWorkedOut2;
                                    });
                                  },
                                  child: Icon(
                                    isExtraWorkedOut2 == false
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward_outlined,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: isExtraWorkedOut2 == true,
                              child: Column(
                                children: [
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Extra Work 2 Title";
                                      }
                                    },
                                    controller: extraWorkedOut2Title,
                                    hintText: "Extra Work 2 Title",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Extra Work 2 Size";
                                      }
                                    },
                                    controller: sizeExtraWorkedOut2Title,
                                    hintText: "Extra Work 2 Size",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Total";
                                      }
                                    },
                                    controller: totalExtraWorkedOut2,
                                    hintText: "Total",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Basic Service";
                                      }
                                    },
                                    controller: basicServiceExtraWorkedOut2,
                                    hintText: "Basic Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Extended Service";
                                      }
                                    },
                                    controller: extendedServiceExtraWorkedOut2,
                                    hintText: "Extended Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Re-Charge";
                                      }
                                    },
                                    controller: reChargeExtraWorkedOut2,
                                    hintText: "Re-Charge",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Service Exchange";
                                      }
                                    },
                                    controller: serviceExchangeExtraWorkedOut2,
                                    hintText: "Service Exchange",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Supply New";
                                      }
                                    },
                                    controller: supplyNewExtraWorkedOut2,
                                    hintText: "Supply New",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Disposal";
                                      }
                                    },
                                    controller: disposalExtraWorkedOut2,
                                    hintText: "Disposal",
                                  ),
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                "Extra Worked Carried Out 3  ",
                                style: myStyle(16, Colors.red, FontWeight.w700),
                              ),
                              Spacer(),
                              MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isExtraWorkedOut3 = !isExtraWorkedOut3;
                                    });
                                  },
                                  child: Icon(
                                    isExtraWorkedOut3 == false
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward_outlined,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: isExtraWorkedOut3 == true,
                              child: Column(
                                children: [
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Extra Work 1Title";
                                      }
                                    },
                                    controller: extraWorkedOut3Title,
                                    hintText: "Extra Work 1 Title",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Extra Work 1 Size";
                                      }
                                    },
                                    controller: sizeExtraWorkedOut3Title,
                                    hintText: "Extra Work 1 Size",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Total";
                                      }
                                    },
                                    controller: totalExtraWorkedOut3,
                                    hintText: "Total",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Basic Service";
                                      }
                                    },
                                    controller: basicServiceExtraWorkedOut3,
                                    hintText: "Basic Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Extended Service";
                                      }
                                    },
                                    controller: extendedServiceExtraWorkedOut3,
                                    hintText: "Extended Service",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Re-Charge";
                                      }
                                    },
                                    controller: reChargeExtraWorkedOut3,
                                    hintText: "Re-Charge",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Service Exchange";
                                      }
                                    },
                                    controller: serviceExchangeExtraWorkedOut3,
                                    hintText: "Service Exchange",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Supply New";
                                      }
                                    },
                                    controller: supplyNewExtraWorkedOut3,
                                    hintText: "Supply New",
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CustomeTextField(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null) {
                                        return "Disposal";
                                      }
                                    },
                                    controller: disposalExtraWorkedOut3,
                                    hintText: "Disposal",
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              CustomeTextField(
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null) {
                    return "Additional Comments";
                  }
                },
                controller: additionalComments,
                hintText: "Additional Comments",
              ),
              SizedBox(
                height: 12,
              ),
              CustomeTextField(
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null) {
                    return "Customer Signature";
                  }
                },
                controller: customerSign,
                hintText: "Customer Signature",
              ),
              SizedBox(
                height: 12,
              ),
              CustomeTextField(
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null) {
                    return "Position";
                  }
                },
                controller: position,
                hintText: "Position",
              ),
              SizedBox(
                height: 12,
              ),
              CustomeTextField(
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null) {
                    return "Please Write Name";
                  }
                },
                controller: pleaseWriteName,
                hintText: "Please Write Name",
              ),
              SizedBox(
                height: 25,
              ),
              ButtonWidget(
                text: 'Invoice PDF',
                onClicked: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.white70,
                          title: Text("Enter File Name"),
                          content: Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            child: Column(
                              children: [
                                CustomeTextField(
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {},
                                  controller: fileNameController,
                                  hintText: "File Name",
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                ButtonWidget(
                                  text: 'Done',
                                  onClicked: () async {
                                    if (fileNameController.text.isNotEmpty) {
                                      var fireDocModel = FireDockModel(
                                        customerName:
                                            customerName.text.toString(),
                                        siteAddress:
                                            siteAddress.text.toString(),
                                        date: date.text.toString(),
                                        dischargeHoseQty:
                                            dischargeHoseQty.text.toString(),
                                        cartridgeQty:
                                            cartridgeQty.text.toString(),
                                        c02HornQty: c02HornQty.text.toString(),
                                        c02HoseQty: c02HoseQty.text.toString(),
                                        wallBracketQty:
                                            wallBracketQty.text.toString(),
                                        backboardQty:
                                            backboardQty.text.toString(),
                                        idSignQty: idSignQty.text.toString(),
                                        fireActionSignQty:
                                            fireActionSignQty.text.toString(),
                                        directionalSignQty:
                                            directionalSignQty.text.toString(),
                                        fireLogBookQty:
                                            fireLogBookQty.text.toString(),
                                        signleStandQty:
                                            signleStandQty.text.toString(),
                                        doubleStandQty:
                                            doubleStandQty.text.toString(),
                                        extraQty1: extraQty1.text.toString(),
                                        extraQty2: extraQty2.text.toString(),
                                        extraQty3: extraQty3.text.toString(),
                                        otherEquipmentServiced1:
                                            otherEquipmentServiced1.text
                                                .toString(),
                                        otherEquipmentServiced2:
                                            otherEquipmentServiced2.text
                                                .toString(),
                                        otherEquipmentServiced3:
                                            otherEquipmentServiced3.text
                                                .toString(),
                                        otherEquipmentServiced4:
                                            otherEquipmentServiced4.text
                                                .toString(),
                                        otherEquipmentServiced5:
                                            otherEquipmentServiced5.text
                                                .toString(),
                                        otherEquipmentServiced6:
                                            otherEquipmentServiced6.text
                                                .toString(),
                                        otherEquipmentServiced7:
                                            otherEquipmentServiced7.text
                                                .toString(),
                                        otherEquipmentServiced8:
                                            otherEquipmentServiced8.text
                                                .toString(),
                                        otherEquipmentServiced9:
                                            otherEquipmentServiced9.text
                                                .toString(),
                                        otherEquipmentServiced10:
                                            otherEquipmentServiced10.text
                                                .toString(),
                                        otherEquipmentServiced11:
                                            otherEquipmentServiced11.text
                                                .toString(),
                                        otherEquipmentServiced12:
                                            otherEquipmentServiced12.text
                                                .toString(),
                                        otherEquipmentServiced13:
                                            otherEquipmentServiced13.text
                                                .toString(),
                                        additionalComments:
                                            additionalComments.text.toString(),
                                        technicalSign:
                                            technicalSign.text.toString(),
                                        signDate: signDate.text.toString(),
                                        customerSign:
                                            customerSign.text.toString(),
                                        position: position.text.toString(),
                                        printName: printName.text.toString(),
                                        pleaseWriteName:
                                            pleaseWriteName.text.toString(),
                                        fileNameControlle:
                                            fileNameController.text.toString(),
                                        totalFoam2: totalFoam2L.text.toString(),
                                        basicServiceFoam2:
                                            basicServiceFoam2L.text.toString(),
                                        extendedServiceFoam2:
                                            extendedServiceFoam2L.text
                                                .toString(),
                                        reChargeFoam2:
                                            reChargeFoam2L.text.toString(),
                                        serviceExchangeFoam2:
                                            serviceExchangeFoam2L.text
                                                .toString(),
                                        supplyNewFoam2:
                                            supplyNewFoam2L.text.toString(),
                                        disposalFoam2:
                                            disposalFoam2L.text.toString(),
                                        totalFoam6: totalFoam6L.text.toString(),
                                        basicServiceFoam6:
                                            basicServiceFoam6L.text.toString(),
                                        extendedServiceFoam6:
                                            extendedServiceFoam6L.text
                                                .toString(),
                                        reChargeFoam6:
                                            reChargeFoam6L.text.toString(),
                                        serviceExchangeFoam6:
                                            serviceExchangeFoam6L.text
                                                .toString(),
                                        supplyNewFoam6:
                                            supplyNewFoam6L.text.toString(),
                                        disposalFoam6:
                                            disposalFoam6L.text.toString(),
                                        totalFoam9: totalFoam9L.text.toString(),
                                        basicServiceFoam9:
                                            basicServiceFoam9L.text.toString(),
                                        extendedServiceFoam9:
                                            extendedServiceFoam9L.text
                                                .toString(),
                                        reChargeFoam9:
                                            reChargeFoam9L.text.toString(),
                                        serviceExchangeFoam9:
                                            serviceExchangeFoam9L.text
                                                .toString(),
                                        supplyNewFoam9:
                                            supplyNewFoam9L.text.toString(),
                                        disposalFoam9:
                                            disposalFoam9L.text.toString(),
                                        totalCarbonDioxide2k:
                                            totalCarbonDioxide2kg.text
                                                .toString(),
                                        basicServiceCarbonDioxide2k:
                                            basicServiceCarbonDioxide2kg.text
                                                .toString(),
                                        extendedServiceCarbonDioxide2k:
                                            extendedServiceCarbonDioxide2kg.text
                                                .toString(),
                                        reChargeCarbonDioxide2k:
                                            reChargeCarbonDioxide2kg.text
                                                .toString(),
                                        serviceExchangeCarbonDioxide2k:
                                            serviceExchangeCarbonDioxide2kg.text
                                                .toString(),
                                        supplyNewCarbonDioxide2k:
                                            supplyNewCarbonDioxide2kg.text
                                                .toString(),
                                        disposalCarbonDioxide2k:
                                            disposalCarbonDioxide2kg.text
                                                .toString(),
                                        totalCarbonDioxide5k:
                                            totalCarbonDioxide5kg.text
                                                .toString(),
                                        basicServiceCarbonDioxide5k:
                                            basicServiceCarbonDioxide5kg.text
                                                .toString(),
                                        extendedServiceCarbonDioxide5k:
                                            extendedServiceCarbonDioxide5kg.text
                                                .toString(),
                                        reChargeCarbonDioxide5k:
                                            reChargeCarbonDioxide5kg.text
                                                .toString(),
                                        serviceExchangeCarbonDioxide5k:
                                            serviceExchangeCarbonDioxide5kg.text
                                                .toString(),
                                        supplyNewCarbonDioxide5k:
                                            supplyNewCarbonDioxide5kg.text
                                                .toString(),
                                        disposalCarbonDioxide5k:
                                            disposalCarbonDioxide5kg.text
                                                .toString(),
                                        totalWaterAdditive6:
                                            totalWaterAdditive6L.text
                                                .toString(),
                                        basicServiceWaterAdditive6:
                                            basicServiceWaterAdditive6L.text
                                                .toString(),
                                        extendedServiceWaterAdditive6:
                                            extendedServiceWaterAdditive6L.text
                                                .toString(),
                                        reChargeWaterAdditive6:
                                            reChargeWaterAdditive6L.text
                                                .toString(),
                                        serviceExchangeWaterAdditive6:
                                            serviceExchangeWaterAdditive6L.text
                                                .toString(),
                                        supplyNewWaterAdditive6:
                                            supplyNewWaterAdditive6L.text
                                                .toString(),
                                        disposalWaterAdditive6:
                                            disposalWaterAdditive6L.text
                                                .toString(),
                                        totalWaterAdditive9:
                                            totalWaterAdditive9L.text
                                                .toString(),
                                        basicServiceWaterAdditive9:
                                            basicServiceWaterAdditive9L.text
                                                .toString(),
                                        extendedServiceWaterAdditive9:
                                            extendedServiceWaterAdditive9L.text
                                                .toString(),
                                        reChargeWaterAdditive9:
                                            reChargeWaterAdditive9L.text
                                                .toString(),
                                        serviceExchangeWaterAdditive9:
                                            serviceExchangeWaterAdditive9L.text
                                                .toString(),
                                        supplyNewWaterAdditive9:
                                            supplyNewWaterAdditive9L.text
                                                .toString(),
                                        disposalWaterAdditive9:
                                            disposalWaterAdditive9L.text
                                                .toString(),
                                        totalWater9:
                                            totalWater9L.text.toString(),
                                        basicServiceWater9:
                                            basicServiceWater9L.text.toString(),
                                        extendedServiceWater9:
                                            extendedServiceWater9L.text
                                                .toString(),
                                        reChargeWater9:
                                            reChargeWater9L.text.toString(),
                                        serviceExchangeWater9:
                                            serviceExchangeWater9L.text
                                                .toString(),
                                        supplyNewWater9:
                                            supplyNewWater9L.text.toString(),
                                        disposalWater9:
                                            disposalWater9L.text.toString(),
                                        totalWetChemical6:
                                            totalWetChemical6L.text.toString(),
                                        basicServiceWetChemical6:
                                            basicServiceWetChemical6L.text
                                                .toString(),
                                        extendedServiceWetChemical6:
                                            extendedServiceWetChemical6L.text
                                                .toString(),
                                        reChargeWetChemical6:
                                            reChargeWetChemical6L.text
                                                .toString(),
                                        serviceExchangeWetChemical6:
                                            serviceExchangeWetChemical6L.text
                                                .toString(),
                                        supplyNewWetChemical6:
                                            supplyNewWetChemical6L.text
                                                .toString(),
                                        disposalWetChemical6:
                                            disposalWetChemical6L.text
                                                .toString(),
                                        totalWetChemical9:
                                            totalWetChemical9L.text.toString(),
                                        basicServiceWetChemical9:
                                            basicServiceWetChemical9L.text
                                                .toString(),
                                        extendedServiceWetChemical9:
                                            extendedServiceWetChemical9L.text
                                                .toString(),
                                        reChargeWetChemical9:
                                            reChargeWetChemical9L.text
                                                .toString(),
                                        serviceExchangeWetChemical9:
                                            serviceExchangeWetChemical9L.text
                                                .toString(),
                                        supplyNewWetChemical9:
                                            supplyNewWetChemical9L.text
                                                .toString(),
                                        disposalWetChemical9:
                                            disposalWetChemical9L.text
                                                .toString(),
                                        totalPowder4K:
                                            totalPowder4Kg.text.toString(),
                                        basicServicePowder4K:
                                            basicServicePowder4Kg.text
                                                .toString(),
                                        extendedServicePowder4K:
                                            extendedServicePowder4Kg.text
                                                .toString(),
                                        reChargePowder4K:
                                            reChargePowder4Kg.text.toString(),
                                        serviceExchangePowder4K:
                                            serviceExchangePowder4Kg.text
                                                .toString(),
                                        supplyNewPowder4K:
                                            supplyNewPowder4Kg.text.toString(),
                                        disposalPowder4K:
                                            disposalPowder4Kg.text.toString(),
                                        totalPowder6K:
                                            totalPowder6Kg.text.toString(),
                                        basicServicePowder6K:
                                            basicServicePowder6Kg.text
                                                .toString(),
                                        extendedServicePowder6K:
                                            extendedServicePowder6Kg.text
                                                .toString(),
                                        reChargePowder6K:
                                            reChargePowder6Kg.text.toString(),
                                        serviceExchangePowder6K:
                                            serviceExchangePowder6Kg.text
                                                .toString(),
                                        supplyNewPowder6K:
                                            supplyNewPowder6Kg.text.toString(),
                                        disposalPowder6K:
                                            disposalPowder6Kg.text.toString(),
                                        totalPowder9K:
                                            totalPowder9Kg.text.toString(),
                                        basicServicePowder9K:
                                            basicServicePowder9Kg.text
                                                .toString(),
                                        extendedServicePowder9K:
                                            extendedServicePowder9Kg.text
                                                .toString(),
                                        reChargePowder9K:
                                            reChargePowder9Kg.text.toString(),
                                        serviceExchangePowder9K:
                                            serviceExchangePowder9Kg.text
                                                .toString(),
                                        supplyNewPowder9K:
                                            supplyNewPowder9Kg.text.toString(),
                                        disposalPowder9K:
                                            disposalPowder9Kg.text.toString(),
                                        totalFireBlanke:
                                            totalFireBlanket.text.toString(),
                                        basicServiceFireBlanke:
                                            basicServiceFireBlanket.text
                                                .toString(),
                                        extendedServiceFireBlanke:
                                            extendedServiceFireBlanket.text
                                                .toString(),
                                        reChargeFireBlanke:
                                            reChargeFireBlanket.text.toString(),
                                        serviceExchangeFireBlanke:
                                            serviceExchangeFireBlanket.text
                                                .toString(),
                                        supplyNewFireBlanke:
                                            supplyNewFireBlanket.text
                                                .toString(),
                                        disposalFireBlanke:
                                            disposalFireBlanket.text.toString(),
                                        totalHoseRee:
                                            totalHoseReel.text.toString(),
                                        basicServiceHoseRee:
                                            basicServiceHoseReel.text
                                                .toString(),
                                        extendedServiceHoseRee:
                                            extendedServiceHoseReel.text
                                                .toString(),
                                        reChargeHoseRee:
                                            reChargeHoseReel.text.toString(),
                                        serviceExchangeHoseRee:
                                            serviceExchangeHoseReel.text
                                                .toString(),
                                        supplyNewHoseRee:
                                            supplyNewHoseReel.text.toString(),
                                        disposalHoseRee:
                                            disposalHoseReel.text.toString(),
                                        extraWorkedOut1Titl:
                                            extraWorkedOut1Title.text
                                                .toString(),
                                        sizeExtraWorkedOut1Titl:
                                            sizeExtraWorkedOut1Title.text
                                                .toString(),
                                        totalExtraWorkedOut1:
                                            totalExtraWorkedOut1.text
                                                .toString(),
                                        basicServiceExtraWorkedOut1:
                                            basicServiceExtraWorkedOut1.text
                                                .toString(),
                                        extendedServiceExtraWorkedOut1:
                                            extendedServiceExtraWorkedOut1.text
                                                .toString(),
                                        reChargeExtraWorkedOut1:
                                            reChargeExtraWorkedOut1.text
                                                .toString(),
                                        serviceExchangeExtraWorkedOut1:
                                            serviceExchangeExtraWorkedOut1.text
                                                .toString(),
                                        supplyNewExtraWorkedOut1:
                                            supplyNewExtraWorkedOut1.text
                                                .toString(),
                                        disposalExtraWorkedOut1:
                                            disposalExtraWorkedOut1.text
                                                .toString(),
                                        sizeExtraWorkedOut2Titl:
                                            sizeExtraWorkedOut2Title.text
                                                .toString(),
                                        extraWorkedOut2Titl:
                                            extraWorkedOut2Title.text
                                                .toString(),
                                        totalExtraWorkedOut2:
                                            totalExtraWorkedOut2.text
                                                .toString(),
                                        basicServiceExtraWorkedOut2:
                                            basicServiceExtraWorkedOut2.text
                                                .toString(),
                                        extendedServiceExtraWorkedOut2:
                                            extendedServiceExtraWorkedOut2.text
                                                .toString(),
                                        reChargeExtraWorkedOut2:
                                            reChargeExtraWorkedOut2.text
                                                .toString(),
                                        serviceExchangeExtraWorkedOut2:
                                            serviceExchangeExtraWorkedOut2.text
                                                .toString(),
                                        supplyNewExtraWorkedOut2:
                                            supplyNewExtraWorkedOut2.text
                                                .toString(),
                                        disposalExtraWorkedOut2:
                                            disposalExtraWorkedOut2.text
                                                .toString(),
                                        sizeExtraWorkedOut3Titl:
                                            sizeExtraWorkedOut3Title.text
                                                .toString(),
                                        extraWorkedOut3Titl:
                                            extraWorkedOut3Title.text
                                                .toString(),
                                        totalExtraWorkedOut3:
                                            totalExtraWorkedOut3.text
                                                .toString(),
                                        basicServiceExtraWorkedOut3:
                                            basicServiceExtraWorkedOut3.text
                                                .toString(),
                                        extendedServiceExtraWorkedOut3:
                                            extendedServiceExtraWorkedOut3.text
                                                .toString(),
                                        reChargeExtraWorkedOut3:
                                            reChargeExtraWorkedOut3.text
                                                .toString(),
                                        serviceExchangeExtraWorkedOut3:
                                            serviceExchangeExtraWorkedOut3.text
                                                .toString(),
                                        supplyNewExtraWorkedOut3:
                                            supplyNewExtraWorkedOut3.text
                                                .toString(),
                                        disposalExtraWorkedOut3:
                                            disposalExtraWorkedOut3.text
                                                .toString(),
                                        isCallOut: isCallOut,
                                        isDelivery: isDelivery,
                                        isLogBookComplete: isLogBookComplete,
                                        isOtherEquipmentServiced:
                                            isOtherEquipmentServiced,
                                        isPartsSupplied: isPartsSupplied,
                                        isService: isService,
                                        isWorkCarriedOut: isWorkCarriedOut,
                                          extraPartsName1:extraPartsName1.text.toString(),
                                          extraPartsName2:extraPartsName2.text.toString(),
                                          extraPartsName3:extraPartsName3.text.toString(),

                                      );
                                      final pdfFile = await FireDocApi.generate(
                                          fireDocModel);

                                      PdfApi.openFile(pdfFile);
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool x = false;

  TextEditingController fileNameController = TextEditingController();
  TextEditingController totalFoam2L = TextEditingController();
  TextEditingController basicServiceFoam2L = TextEditingController();
  TextEditingController extendedServiceFoam2L = TextEditingController();
  TextEditingController reChargeFoam2L = TextEditingController();
  TextEditingController serviceExchangeFoam2L = TextEditingController();
  TextEditingController supplyNewFoam2L = TextEditingController();
  TextEditingController disposalFoam2L = TextEditingController();
  TextEditingController totalFoam6L = TextEditingController();
  TextEditingController basicServiceFoam6L = TextEditingController();
  TextEditingController extendedServiceFoam6L = TextEditingController();
  TextEditingController reChargeFoam6L = TextEditingController();
  TextEditingController serviceExchangeFoam6L = TextEditingController();
  TextEditingController supplyNewFoam6L = TextEditingController();
  TextEditingController disposalFoam6L = TextEditingController();
  TextEditingController totalFoam9L = TextEditingController();
  TextEditingController basicServiceFoam9L = TextEditingController();
  TextEditingController extendedServiceFoam9L = TextEditingController();
  TextEditingController reChargeFoam9L = TextEditingController();
  TextEditingController serviceExchangeFoam9L = TextEditingController();
  TextEditingController supplyNewFoam9L = TextEditingController();
  TextEditingController disposalFoam9L = TextEditingController();

  TextEditingController totalCarbonDioxide2kg = TextEditingController();
  TextEditingController basicServiceCarbonDioxide2kg = TextEditingController();
  TextEditingController extendedServiceCarbonDioxide2kg =
      TextEditingController();
  TextEditingController reChargeCarbonDioxide2kg = TextEditingController();
  TextEditingController serviceExchangeCarbonDioxide2kg =
      TextEditingController();
  TextEditingController supplyNewCarbonDioxide2kg = TextEditingController();
  TextEditingController disposalCarbonDioxide2kg = TextEditingController();

  TextEditingController totalCarbonDioxide5kg = TextEditingController();
  TextEditingController basicServiceCarbonDioxide5kg = TextEditingController();
  TextEditingController extendedServiceCarbonDioxide5kg =
      TextEditingController();
  TextEditingController reChargeCarbonDioxide5kg = TextEditingController();
  TextEditingController serviceExchangeCarbonDioxide5kg =
      TextEditingController();
  TextEditingController supplyNewCarbonDioxide5kg = TextEditingController();
  TextEditingController disposalCarbonDioxide5kg = TextEditingController();

  TextEditingController totalWaterAdditive6L = TextEditingController();
  TextEditingController basicServiceWaterAdditive6L = TextEditingController();
  TextEditingController extendedServiceWaterAdditive6L =
      TextEditingController();
  TextEditingController reChargeWaterAdditive6L = TextEditingController();
  TextEditingController serviceExchangeWaterAdditive6L =
      TextEditingController();
  TextEditingController supplyNewWaterAdditive6L = TextEditingController();
  TextEditingController disposalWaterAdditive6L = TextEditingController();

  TextEditingController totalWaterAdditive9L = TextEditingController();
  TextEditingController basicServiceWaterAdditive9L = TextEditingController();
  TextEditingController extendedServiceWaterAdditive9L =
      TextEditingController();
  TextEditingController reChargeWaterAdditive9L = TextEditingController();
  TextEditingController serviceExchangeWaterAdditive9L =
      TextEditingController();
  TextEditingController supplyNewWaterAdditive9L = TextEditingController();
  TextEditingController disposalWaterAdditive9L = TextEditingController();

  TextEditingController totalWater9L = TextEditingController();
  TextEditingController basicServiceWater9L = TextEditingController();
  TextEditingController extendedServiceWater9L = TextEditingController();
  TextEditingController reChargeWater9L = TextEditingController();
  TextEditingController serviceExchangeWater9L = TextEditingController();
  TextEditingController supplyNewWater9L = TextEditingController();
  TextEditingController disposalWater9L = TextEditingController();

  TextEditingController totalWetChemical6L = TextEditingController();
  TextEditingController basicServiceWetChemical6L = TextEditingController();
  TextEditingController extendedServiceWetChemical6L = TextEditingController();
  TextEditingController reChargeWetChemical6L = TextEditingController();
  TextEditingController serviceExchangeWetChemical6L = TextEditingController();
  TextEditingController supplyNewWetChemical6L = TextEditingController();
  TextEditingController disposalWetChemical6L = TextEditingController();

  TextEditingController totalWetChemical9L = TextEditingController();
  TextEditingController basicServiceWetChemical9L = TextEditingController();
  TextEditingController extendedServiceWetChemical9L = TextEditingController();
  TextEditingController reChargeWetChemical9L = TextEditingController();
  TextEditingController serviceExchangeWetChemical9L = TextEditingController();
  TextEditingController supplyNewWetChemical9L = TextEditingController();
  TextEditingController disposalWetChemical9L = TextEditingController();

  TextEditingController totalPowder4Kg = TextEditingController();
  TextEditingController basicServicePowder4Kg = TextEditingController();
  TextEditingController extendedServicePowder4Kg = TextEditingController();
  TextEditingController reChargePowder4Kg = TextEditingController();
  TextEditingController serviceExchangePowder4Kg = TextEditingController();
  TextEditingController supplyNewPowder4Kg = TextEditingController();
  TextEditingController disposalPowder4Kg = TextEditingController();
  TextEditingController totalPowder6Kg = TextEditingController();
  TextEditingController basicServicePowder6Kg = TextEditingController();
  TextEditingController extendedServicePowder6Kg = TextEditingController();
  TextEditingController reChargePowder6Kg = TextEditingController();
  TextEditingController serviceExchangePowder6Kg = TextEditingController();
  TextEditingController supplyNewPowder6Kg = TextEditingController();
  TextEditingController disposalPowder6Kg = TextEditingController();
  TextEditingController totalPowder9Kg = TextEditingController();
  TextEditingController basicServicePowder9Kg = TextEditingController();
  TextEditingController extendedServicePowder9Kg = TextEditingController();
  TextEditingController reChargePowder9Kg = TextEditingController();
  TextEditingController serviceExchangePowder9Kg = TextEditingController();
  TextEditingController supplyNewPowder9Kg = TextEditingController();
  TextEditingController disposalPowder9Kg = TextEditingController();

  TextEditingController totalFireBlanket = TextEditingController();
  TextEditingController basicServiceFireBlanket = TextEditingController();
  TextEditingController extendedServiceFireBlanket = TextEditingController();
  TextEditingController reChargeFireBlanket = TextEditingController();
  TextEditingController serviceExchangeFireBlanket = TextEditingController();
  TextEditingController supplyNewFireBlanket = TextEditingController();
  TextEditingController disposalFireBlanket = TextEditingController();

  TextEditingController totalHoseReel = TextEditingController();
  TextEditingController basicServiceHoseReel = TextEditingController();
  TextEditingController extendedServiceHoseReel = TextEditingController();
  TextEditingController reChargeHoseReel = TextEditingController();
  TextEditingController serviceExchangeHoseReel = TextEditingController();
  TextEditingController supplyNewHoseReel = TextEditingController();
  TextEditingController disposalHoseReel = TextEditingController();

  TextEditingController extraWorkedOut1Title = TextEditingController();
  TextEditingController sizeExtraWorkedOut1Title = TextEditingController();
  TextEditingController totalExtraWorkedOut1 = TextEditingController();
  TextEditingController basicServiceExtraWorkedOut1 = TextEditingController();
  TextEditingController extendedServiceExtraWorkedOut1 =
      TextEditingController();
  TextEditingController reChargeExtraWorkedOut1 = TextEditingController();
  TextEditingController serviceExchangeExtraWorkedOut1 =
      TextEditingController();
  TextEditingController supplyNewExtraWorkedOut1 = TextEditingController();
  TextEditingController disposalExtraWorkedOut1 = TextEditingController();

  String? extraWorkedOut2;

  TextEditingController sizeExtraWorkedOut2Title = TextEditingController();
  TextEditingController extraWorkedOut2Title = TextEditingController();
  TextEditingController totalExtraWorkedOut2 = TextEditingController();
  TextEditingController basicServiceExtraWorkedOut2 = TextEditingController();
  TextEditingController extendedServiceExtraWorkedOut2 =
      TextEditingController();
  TextEditingController reChargeExtraWorkedOut2 = TextEditingController();
  TextEditingController serviceExchangeExtraWorkedOut2 =
      TextEditingController();
  TextEditingController supplyNewExtraWorkedOut2 = TextEditingController();
  TextEditingController disposalExtraWorkedOut2 = TextEditingController();

  TextEditingController sizeExtraWorkedOut3Title = TextEditingController();
  TextEditingController extraWorkedOut3Title = TextEditingController();
  TextEditingController totalExtraWorkedOut3 = TextEditingController();
  TextEditingController basicServiceExtraWorkedOut3 = TextEditingController();
  TextEditingController extendedServiceExtraWorkedOut3 =
      TextEditingController();
  TextEditingController reChargeExtraWorkedOut3 = TextEditingController();
  TextEditingController serviceExchangeExtraWorkedOut3 =
      TextEditingController();
  TextEditingController supplyNewExtraWorkedOut3 = TextEditingController();
  TextEditingController disposalExtraWorkedOut3 = TextEditingController();
}

class FireDockModel {
  String? customerName,
      siteAddress,
      date,
      dischargeHoseQty,
      cartridgeQty,
      c02HornQty,
      c02HoseQty,
      wallBracketQty,
      backboardQty,
      idSignQty,
      fireActionSignQty,
      directionalSignQty,
      fireLogBookQty,
      signleStandQty,
      doubleStandQty,
      extraQty1,
      extraQty2,
      extraQty3,
      otherEquipmentServiced1,
      otherEquipmentServiced2,
      otherEquipmentServiced3,
      otherEquipmentServiced4,
      otherEquipmentServiced5,
      otherEquipmentServiced6,
      otherEquipmentServiced7,
      otherEquipmentServiced8,
      otherEquipmentServiced9,
      otherEquipmentServiced10,
      otherEquipmentServiced11,
      otherEquipmentServiced12,
      otherEquipmentServiced13,
      additionalComments,
      technicalSign,
      signDate,
      customerSign,
      position,
      printName,
      pleaseWriteName,
      fileNameControlle,
      totalFoam2,
      basicServiceFoam2,
      extendedServiceFoam2,
      reChargeFoam2,
      serviceExchangeFoam2,
      supplyNewFoam2,
      disposalFoam2,
      totalFoam6,
      basicServiceFoam6,
      extendedServiceFoam6,
      reChargeFoam6,
      serviceExchangeFoam6,
      supplyNewFoam6,
      disposalFoam6,
      totalFoam9,
      basicServiceFoam9,
      extendedServiceFoam9,
      reChargeFoam9,
      serviceExchangeFoam9,
      supplyNewFoam9,
      disposalFoam9,
      totalCarbonDioxide2k,
      basicServiceCarbonDioxide2k,
      extendedServiceCarbonDioxide2k,
      reChargeCarbonDioxide2k,
      serviceExchangeCarbonDioxide2k,
      supplyNewCarbonDioxide2k,
      disposalCarbonDioxide2k,
      totalCarbonDioxide5k,
      basicServiceCarbonDioxide5k,
      extendedServiceCarbonDioxide5k,
      reChargeCarbonDioxide5k,
      serviceExchangeCarbonDioxide5k,
      supplyNewCarbonDioxide5k,
      disposalCarbonDioxide5k,
      totalWaterAdditive6,
      basicServiceWaterAdditive6,
      extendedServiceWaterAdditive6,
      reChargeWaterAdditive6,
      serviceExchangeWaterAdditive6,
      supplyNewWaterAdditive6,
      disposalWaterAdditive6,
      totalWaterAdditive9,
      basicServiceWaterAdditive9,
      extendedServiceWaterAdditive9,
      reChargeWaterAdditive9,
      serviceExchangeWaterAdditive9,
      supplyNewWaterAdditive9,
      disposalWaterAdditive9,
      totalWater9,
      basicServiceWater9,
      extendedServiceWater9,
      reChargeWater9,
      serviceExchangeWater9,
      supplyNewWater9,
      disposalWater9,
      totalWetChemical6,
      basicServiceWetChemical6,
      extendedServiceWetChemical6,
      reChargeWetChemical6,
      serviceExchangeWetChemical6,
      supplyNewWetChemical6,
      disposalWetChemical6,
      totalWetChemical9,
      basicServiceWetChemical9,
      extendedServiceWetChemical9,
      reChargeWetChemical9,
      serviceExchangeWetChemical9,
      supplyNewWetChemical9,
      disposalWetChemical9,
      totalPowder4K,
      basicServicePowder4K,
      extendedServicePowder4K,
      reChargePowder4K,
      serviceExchangePowder4K,
      supplyNewPowder4K,
      disposalPowder4K,
      totalPowder6K,
      basicServicePowder6K,
      extendedServicePowder6K,
      reChargePowder6K,
      serviceExchangePowder6K,
      supplyNewPowder6K,
      disposalPowder6K,
      totalPowder9K,
      basicServicePowder9K,
      extendedServicePowder9K,
      reChargePowder9K,
      serviceExchangePowder9K,
      supplyNewPowder9K,
      disposalPowder9K,
      totalFireBlanke,
      basicServiceFireBlanke,
      extendedServiceFireBlanke,
      reChargeFireBlanke,
      serviceExchangeFireBlanke,
      supplyNewFireBlanke,
      disposalFireBlanke,
      totalHoseRee,
      basicServiceHoseRee,
      extendedServiceHoseRee,
      reChargeHoseRee,
      serviceExchangeHoseRee,
      supplyNewHoseRee,
      disposalHoseRee,
      extraWorkedOut1Titl,
      sizeExtraWorkedOut1Titl,
      totalExtraWorkedOut1,
      basicServiceExtraWorkedOut1,
      extendedServiceExtraWorkedOut1,
      reChargeExtraWorkedOut1,
      serviceExchangeExtraWorkedOut1,
      supplyNewExtraWorkedOut1,
      disposalExtraWorkedOut1,
      sizeExtraWorkedOut2Titl,
      extraWorkedOut2Titl,
      totalExtraWorkedOut2,
      basicServiceExtraWorkedOut2,
      extendedServiceExtraWorkedOut2,
      reChargeExtraWorkedOut2,
      serviceExchangeExtraWorkedOut2,
      supplyNewExtraWorkedOut2,
      disposalExtraWorkedOut2,
      sizeExtraWorkedOut3Titl,
      extraWorkedOut3Titl,
      totalExtraWorkedOut3,
      basicServiceExtraWorkedOut3,
      extendedServiceExtraWorkedOut3,
      reChargeExtraWorkedOut3,
      serviceExchangeExtraWorkedOut3,
      supplyNewExtraWorkedOut3,extraPartsName1,extraPartsName2,extraPartsName3,
      disposalExtraWorkedOut3;

  bool? isService;
  bool? isLogBookComplete;
  bool? isCallOut;
  bool? isDelivery;
  bool? isPartsSupplied;
  bool? isOtherEquipmentServiced;
  bool? isWorkCarriedOut;

  FireDockModel({
    this.extraPartsName1,this.extraPartsName2,this.extraPartsName3,
    this.isLogBookComplete,
    this.pleaseWriteName,
    this.customerSign,
    this.additionalComments,
    this.otherEquipmentServiced1,
    this.isPartsSupplied,
    this.extraQty1,
    this.fireLogBookQty,
    this.directionalSignQty,
    this.fireActionSignQty,
    this.idSignQty,
    this.backboardQty,
    this.c02HoseQty,
    this.c02HornQty,
    this.dischargeHoseQty,
    this.cartridgeQty,
    this.isDelivery,
    this.isCallOut,
    this.customerName,
    this.date,
    this.basicServiceCarbonDioxide2k,
    this.basicServiceCarbonDioxide5k,
    this.basicServiceExtraWorkedOut1,
    this.basicServiceExtraWorkedOut2,
    this.basicServiceExtraWorkedOut3,
    this.basicServiceFireBlanke,
    this.basicServiceFoam2,
    this.basicServiceFoam6,
    this.basicServiceFoam9,
    this.basicServiceHoseRee,
    this.basicServicePowder4K,
    this.basicServicePowder6K,
    this.basicServicePowder9K,
    this.basicServiceWater9,
    this.basicServiceWaterAdditive6,
    this.basicServiceWaterAdditive9,
    this.signleStandQty,
    this.basicServiceWetChemical6,
    this.basicServiceWetChemical9,
    this.disposalCarbonDioxide2k,
    this.disposalCarbonDioxide5k,
    this.disposalExtraWorkedOut1,
    this.disposalExtraWorkedOut2,
    this.disposalExtraWorkedOut3,
    this.disposalFireBlanke,
    this.disposalFoam2,
    this.disposalFoam6,
    this.disposalFoam9,
    this.disposalHoseRee,
    this.disposalPowder4K,
    this.disposalPowder6K,
    this.disposalPowder9K,
    this.disposalWater9,
    this.disposalWaterAdditive6,
    this.disposalWaterAdditive9,
    this.disposalWetChemical6,
    this.disposalWetChemical9,
    this.doubleStandQty,
    this.extendedServiceCarbonDioxide2k,
    this.extendedServiceCarbonDioxide5k,
    this.extendedServiceExtraWorkedOut1,
    this.extendedServiceExtraWorkedOut2,
    this.extendedServiceExtraWorkedOut3,
    this.extendedServiceFireBlanke,
    this.extendedServiceFoam2,
    this.extendedServiceFoam6,
    this.extendedServiceFoam9,
    this.extendedServiceHoseRee,
    this.extendedServicePowder4K,
    this.extendedServicePowder6K,
    this.extendedServicePowder9K,
    this.extendedServiceWater9,
    this.extendedServiceWaterAdditive6,
    this.extendedServiceWaterAdditive9,
    this.extendedServiceWetChemical6,
    this.extendedServiceWetChemical9,
    this.extraQty2,
    this.extraQty3,
    this.wallBracketQty,
    this.extraWorkedOut1Titl,
    this.extraWorkedOut2Titl,
    this.otherEquipmentServiced9,
    this.extraWorkedOut3Titl,
    this.fileNameControlle,
    this.isOtherEquipmentServiced,
    this.isService,
    this.isWorkCarriedOut,
    this.otherEquipmentServiced2,
    this.otherEquipmentServiced3,
    this.otherEquipmentServiced4,
    this.otherEquipmentServiced5,
    this.otherEquipmentServiced6,
    this.otherEquipmentServiced7,
    this.otherEquipmentServiced8,
    this.otherEquipmentServiced10,
    this.otherEquipmentServiced11,
    this.otherEquipmentServiced12,
    this.otherEquipmentServiced13,
    this.position,
    this.printName,
    this.reChargeCarbonDioxide2k,
    this.reChargeCarbonDioxide5k,
    this.reChargeExtraWorkedOut1,
    this.reChargeExtraWorkedOut2,
    this.reChargeExtraWorkedOut3,
    this.reChargeFireBlanke,
    this.reChargeFoam2,
    this.reChargeFoam6,
    this.reChargeFoam9,
    this.reChargeHoseRee,
    this.reChargePowder4K,
    this.reChargePowder6K,
    this.reChargePowder9K,
    this.reChargeWater9,
    this.reChargeWaterAdditive6,
    this.reChargeWaterAdditive9,
    this.reChargeWetChemical6,
    this.reChargeWetChemical9,
    this.serviceExchangeCarbonDioxide2k,
    this.serviceExchangeCarbonDioxide5k,
    this.serviceExchangeExtraWorkedOut1,
    this.serviceExchangeExtraWorkedOut2,
    this.serviceExchangeExtraWorkedOut3,
    this.serviceExchangeFireBlanke,
    this.serviceExchangeFoam2,
    this.serviceExchangeFoam6,
    this.serviceExchangeFoam9,
    this.serviceExchangeHoseRee,
    this.serviceExchangePowder4K,
    this.serviceExchangePowder6K,
    this.serviceExchangePowder9K,
    this.serviceExchangeWater9,
    this.serviceExchangeWaterAdditive6,
    this.serviceExchangeWaterAdditive9,
    this.serviceExchangeWetChemical6,
    this.serviceExchangeWetChemical9,
    this.signDate,
    this.siteAddress,
    this.sizeExtraWorkedOut1Titl,
    this.sizeExtraWorkedOut2Titl,
    this.sizeExtraWorkedOut3Titl,
    this.supplyNewCarbonDioxide2k,
    this.supplyNewCarbonDioxide5k,
    this.supplyNewExtraWorkedOut1,
    this.supplyNewExtraWorkedOut2,
    this.supplyNewExtraWorkedOut3,
    this.supplyNewFireBlanke,
    this.supplyNewFoam2,
    this.supplyNewFoam6,
    this.supplyNewFoam9,
    this.supplyNewHoseRee,
    this.supplyNewPowder4K,
    this.supplyNewPowder6K,
    this.supplyNewPowder9K,
    this.supplyNewWater9,
    this.supplyNewWaterAdditive6,
    this.supplyNewWaterAdditive9,
    this.supplyNewWetChemical6,
    this.supplyNewWetChemical9,
    this.technicalSign,
    this.totalCarbonDioxide2k,
    this.totalCarbonDioxide5k,
    this.totalExtraWorkedOut1,
    this.totalExtraWorkedOut2,
    this.totalExtraWorkedOut3,
    this.totalFireBlanke,
    this.totalFoam2,
    this.totalFoam6,
    this.totalFoam9,
    this.totalHoseRee,
    this.totalPowder4K,
    this.totalPowder6K,
    this.totalPowder9K,
    this.totalWater9,
    this.totalWaterAdditive6,
    this.totalWaterAdditive9,
    this.totalWetChemical6,
    this.totalWetChemical9,
  });
}
