import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:pdf_app/api/pdf_api.dart';
import 'package:pdf_app/page/new_page/fire_dock_form_page.dart';

class FireDocApi {
  static Future<File> generate(FireDockModel fireDockModel) async {
    final pdf = pw.Document();
    final pdsf = pw.Document(
      // Set default margins for the entire document
       compress: true,
    );
    var img = pw.MemoryImage(
        (await rootBundle.load("assets/fia2.jpg")).buffer.asUint8List());
    var footerImg = pw.MemoryImage(
        (await rootBundle.load("assets/log3.jpg")).buffer.asUint8List());
    pdf.addPage(MultiPage(
    margin: pw.EdgeInsets.all(20.0),

       /*footer: (final context) => pw.Center(
        child: pw.Image(
            alignment: pw.Alignment.center,
            footerImg,
            fit: pw.BoxFit.cover,
            height: 70,
            width: 200),
      ),*/
      build: (context) => [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            pw.Text("Extinguishers",
                style:
                    pw.TextStyle(fontSize: 17, fontWeight: pw.FontWeight.bold)),
            pw.Text("Fire Alarms",
                style:
                    pw.TextStyle(fontSize: 17, fontWeight: pw.FontWeight.bold)),
            pw.Text("Emergency Lighting",
                style:
                    pw.TextStyle(fontSize: 17, fontWeight: pw.FontWeight.bold)),
            pw.Text("Fire Hose Reels",
                style:
                    pw.TextStyle(fontSize: 17, fontWeight: pw.FontWeight.bold)),
            pw.Text("Signs",
                style:
                    pw.TextStyle(fontSize: 17, fontWeight: pw.FontWeight.bold)),
          ]),
          pw.Image(
              alignment: pw.Alignment.centerRight,
              footerImg,
              fit: pw.BoxFit.fill,
              height: 100,
              width: 150),
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            pw.Text("Rees Fire",
                style:
                    pw.TextStyle(fontSize: 16)),
            pw.Text("65b London road",
                style:
                    pw.TextStyle(fontSize: 16)),
            pw.Text("ROMFORD, RM7 9QA",
                style:
                    pw.TextStyle(fontSize: 16)),
            pw.Text("United Kingdom",
                style:
                    pw.TextStyle(fontSize: 16)),
            pw.Text("Phone number: 07837583047",
                style:
                    pw.TextStyle(fontSize: 16)),
                 
                
                pw.Text("Email: hello@Reesfire.co.uk",
                style:
                    pw.TextStyle(fontSize: 16)),
                pw.Text("http://www.reesfire.co.uk",
                style:
                    pw.TextStyle(fontSize: 16)),
          ]),
        ]),

       Divider(
         thickness: 2
       ),


       Padding(padding: EdgeInsets.symmetric(vertical: 16)
       ,child: Center(
             child:   Expanded(
               child: Text(
                 'CERTIFICATE OF INSPECTION',
                 textAlign: TextAlign.center,
                 style: TextStyle(fontSize: 35.0,color: PdfColors.red,fontWeight: FontWeight.bold,height: 18),
               ),
             ),

           )
       ),


        Row(
          children: [
            Expanded(child: Table.fromTextArray(
              headers: ["Customer Name: ${fireDockModel.customerName}"],
              data: [

              ],
              border: TableBorder.all(color: PdfColors.black, width: 1),
              headerStyle: TextStyle(),

              cellHeight: 20,
              cellAlignments: {
                0: Alignment.centerLeft,
                1: Alignment.centerLeft,
                2: Alignment.center,
                3: Alignment.center,
                4: Alignment.center,
              },
            ),flex: 7),
            Expanded(child: Table.fromTextArray(
              headers: ["DATE: ${fireDockModel.date}"],
              data: [

              ],
              border: TableBorder.all(color: PdfColors.black, width: 1),
              headerStyle: TextStyle(),

              cellHeight: 20,
              cellAlignments: {
                0: Alignment.centerLeft,
                1: Alignment.centerLeft,
                2: Alignment.center,
                3: Alignment.center,
                4: Alignment.center,
              },
            ),flex: 3),
          ]
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Table.fromTextArray(
              headers: ["Site Address: ${fireDockModel.siteAddress}"],
              headerAlignment:Alignment.centerLeft  ,
              cellHeight: 92,
              data: [],
              border: TableBorder.all(color: PdfColors.black,width: 1),
              cellAlignments: {
                0: Alignment.topLeft,
              },
            ),
            flex: 7
            ),
            Expanded(child: Column(
                children: [
                  Table.fromTextArray(
                    headers: ["Service","  ${fireDockModel.isService==true?"Yes":"No"}   "],
                    headerAlignment:Alignment.centerLeft  ,
                    data: [],
                    border: TableBorder.all(color: PdfColors.black,width: 1),
                    cellHeight: 20,
                    defaultColumnWidth:IntrinsicColumnWidth(flex: 400) ,

                    cellAlignments: {
                      0: Alignment.centerLeft,
                    },
                  ),Table.fromTextArray(
                    headers: ["Call Out","  ${fireDockModel.isCallOut==true?"Yes":"No"}"],
                    headerAlignment:Alignment.centerLeft  ,
                    data: [],
                    border: TableBorder.all(color: PdfColors.black,width: 1),
                    cellHeight: 20,
                    defaultColumnWidth:IntrinsicColumnWidth(flex: 400) ,

                    cellAlignments: {
                      0: Alignment.centerLeft,
                    },
                  ),Table.fromTextArray(
                    headers: ["Delivery"," ${fireDockModel.isDelivery==true?"Yes":"No"}"],
                    headerAlignment:Alignment.centerLeft  ,
                    data: [],
                    border: TableBorder.all(color: PdfColors.black,width: 1),
                    cellHeight: 20,
                    defaultColumnWidth:IntrinsicColumnWidth(flex: 400) ,

                    cellAlignments: {
                      0: Alignment.centerLeft,
                    },
                  ),Table.fromTextArray(
                    headers: [" ","     "],
                    headerAlignment:Alignment.centerLeft  ,
                    data: [],
                    border: TableBorder.all(color: PdfColors.black,width: 1),
                    cellHeight: 20,
                    defaultColumnWidth:IntrinsicColumnWidth(flex: 400) ,

                    cellAlignments: {
                      0: Alignment.centerLeft,
                    },
                  ),
                ]
            ),flex: 3)
          ]
        ),

        SizedBox(height: 10),
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 11,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children:[
                  Table.fromTextArray(
                    headers: ["Work Carried Out"],
                    data: [

                    ],
                    border: TableBorder.all(color: PdfColors.black, width: 1),
                    headerStyle: TextStyle(),

                    cellHeight: 20,
                    cellAlignments: {
                      0: Alignment.centerLeft,
                    },
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child: Table.fromTextArray(
                        headers: ["Equipment",],
                        data: [

                        ],
                        border: TableBorder.all(color: PdfColors.black, width: 1),
                        headerStyle: TextStyle(fontSize: 9),

                        cellHeight: 32,
                        cellAlignments: {
                          0: Alignment.centerLeft,
                        },
                      ),flex: 6),
                      Expanded(child: Table.fromTextArray(
                        headers: ["Size\n",],
                        data: [

                        ],
                        border: TableBorder.all(color: PdfColors.black, width: 1),
                        headerStyle: TextStyle(fontSize: 8),

                        cellHeight: 32,
                        cellAlignments: {
                          0: Alignment.centerLeft,
                        },
                      ),flex: 3),  Expanded(child: Table.fromTextArray(
                        headers: ["Total\n  ",],
                        data: [

                        ],
                        border: TableBorder.all(color: PdfColors.black, width: 1),
                        headerStyle: TextStyle(fontSize: 9),

                        cellHeight: 32,
                        cellAlignments: {
                          0: Alignment.centerLeft,
                        },
                      ),flex: 3), Expanded(child: Table.fromTextArray(
                        headers: ["Basic\nService",],
                        data: [

                        ],
                        border: TableBorder.all(color: PdfColors.black, width: 1),
                        headerStyle: TextStyle(fontSize: 9),

                        cellHeight: 32,
                        cellAlignments: {
                          0: Alignment.centerLeft,
                        },
                      ),flex: 4),
                      Expanded(child: Table.fromTextArray(
                        headers: ["Extended\nService",],
                        data: [

                        ],
                        border: TableBorder.all(color: PdfColors.black, width: 1),
                        headerStyle: TextStyle(fontSize: 9),

                        cellHeight: 32,
                        cellAlignments: {
                          0: Alignment.centerLeft,
                        },
                      ),flex: 5),Expanded(child: Table.fromTextArray(
                        headers: ["Re\nCharge",],
                        data: [

                        ],
                        border: TableBorder.all(color: PdfColors.black, width: 1),
                        headerStyle: TextStyle(fontSize: 9,),

                        cellHeight: 32,
                        cellAlignments: {
                          0: Alignment.center,
                        },
                      ),flex: 4),Expanded(child: Table.fromTextArray(
                        headers: ["Service\nExchange",],
                        data: [

                        ],
                        border: TableBorder.all(color: PdfColors.black, width: 1),
                        headerStyle: TextStyle(fontSize: 9),

                        cellHeight: 32,
                        cellAlignments: {
                          0: Alignment.centerLeft,
                        },
                      ),flex: 5),Expanded(child: Table.fromTextArray(
                        headers: ["Supply\nNow",],
                        data: [

                        ],
                        border: TableBorder.all(color: PdfColors.black, width: 1),
                        headerStyle: TextStyle(fontSize: 9),

                        cellHeight: 32,
                        cellAlignments: {
                          0: Alignment.centerLeft,
                        },
                      ),flex: 4),Expanded(child: Table.fromTextArray(
                        headers: ["Disposal",],
                        data: [

                        ],
                        border: TableBorder.all(color: PdfColors.black, width: 1),
                        headerStyle: TextStyle(fontSize: 9),

                        cellHeight: 32,
                        cellAlignments: {
                          0: Alignment.centerLeft,
                        },
                      ),flex: 5),
                    ]
                  ),
                  //       'Water  ',
                  Container(
                      height: 15,
                      child: Row(
                          children: [
                            Expanded(child: Container(
                              height: 15,
                              decoration: BoxDecoration(
                                border: Border.all(color: PdfColors.black, width: 1.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Water  ',
                                  textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                ),
                              ),
                            ),flex: 6),

                            Expanded(child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [

                                  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '9 ltr',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3), 
                                  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.totalWater9}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3), Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.basicServiceWater9}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),
                                  Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.extendedServiceWater9}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.reChargeWater9}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.serviceExchangeWater9}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.supplyNewWater9}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.disposalWater9}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),
                                ]
                            ),  flex: 33)
                          ]
                      )
                  ),
                  //            'Water Additive',
                  Container(
                    height: 30,
                    child: Row(
                        children: [
                          Expanded(child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child: Center(
                              child: Text(
                                'Water Additive',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),
                            ),
                          ),flex: 6),

                          Expanded(child: Column(
                              children: [


                                Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [

                                      Expanded(child:Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '6 ltr',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 3), 
                                      Expanded(child:Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.totalWaterAdditive6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 3), Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.basicServiceWaterAdditive6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),
                                      Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.extendedServiceWaterAdditive6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.reChargeWaterAdditive6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.serviceExchangeWaterAdditive6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.supplyNewWaterAdditive6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.disposalWaterAdditive6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),
                                    ]
                                ),            Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [

                                      Expanded(child:Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '9 ltr',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 3),  Expanded(child:Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.totalWaterAdditive9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 3), Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.basicServiceWaterAdditive9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),
                                      Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.extendedServiceWaterAdditive9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),Expanded(child:  Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.reChargeWaterAdditive9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.serviceExchangeWaterAdditive9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.supplyNewWaterAdditive9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.disposalWaterAdditive9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),
                                    ]
                                ),




                              ]
                          ),flex: 33)
                        ]
                    )
                  ),
                  //        Foam........................
                  Container(
                    height: 45,
                    child: Row(
                        children: [
                          Expanded(child: Container(
                            height: 45,//alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),

                              child: Text(
                                ' Foam',
                                style:  TextStyle(fontSize: 9),

                              ),

                          ),flex: 6),

                          Expanded(child: Column(
                              children: [


                                Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [

                                      Expanded(child:Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '2 ltr',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 3),  Expanded(child:Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.totalFoam2}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 3), Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.basicServiceFoam2}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),
                                      Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.extendedServiceFoam2}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.reChargeFoam2}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.serviceExchangeFoam2}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.supplyNewFoam2}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.disposalFoam2}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),
                                    ]
                                ),
                                Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [

                                      Expanded(child:Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '6 ltr',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 3),  Expanded(child:Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.totalFoam6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 3), Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.basicServiceFoam6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),
                                      Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.extendedServiceFoam6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),Expanded(child:  Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.reChargeFoam6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.serviceExchangeFoam6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.supplyNewFoam6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.disposalFoam6}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),
                                    ]
                                ),
                                Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [

                                      Expanded(child:Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '9 ltr',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 3),  Expanded(child:Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.totalFoam9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 3), Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.basicServiceFoam9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),
                                      Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.extendedServiceFoam9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.reChargeFoam9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.serviceExchangeFoam9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.supplyNewFoam9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 4),Expanded(child: Container(
                                        height: 15,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: PdfColors.black, width: 1.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${fireDockModel.disposalFoam9}',
                                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),flex: 5),
                                    ]
                                ),




                              ]
                          ),flex: 33)
                        ]
                    )
                  ),


                  //         'Carbon Dioxide\n(C02)',........................
                  Container(
                      height: 30,
                      child: Row(
                          children: [
                            Expanded(child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: PdfColors.black, width: 1.0),
                              ),
                              alignment: Alignment.centerLeft,
                                child: Text(
                                    'Carbon Dioxide (C02)',
                                    textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                  ),


                            ),flex: 6),

                            Expanded(child: Column(
                                children: [


                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [

                                        Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '2 kg',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3),  Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.totalCarbonDioxide2k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3), Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.basicServiceCarbonDioxide2k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),
                                        Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.extendedServiceCarbonDioxide2k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child:  Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.reChargeCarbonDioxide2k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.serviceExchangeCarbonDioxide2k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.supplyNewCarbonDioxide2k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.disposalCarbonDioxide2k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),
                                      ]
                                  ),            Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [

                                        Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '5 kg',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3),  Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.totalCarbonDioxide5k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3), Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.basicServiceCarbonDioxide5k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),
                                        Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.extendedServiceCarbonDioxide5k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child:  Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.reChargeCarbonDioxide5k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.serviceExchangeCarbonDioxide5k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.supplyNewCarbonDioxide5k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.disposalCarbonDioxide5k}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),
                                      ]
                                  ),




                                ]
                            ),flex: 33)
                          ]
                      )
                  ),


                  //             Wet Chemical......................................................
                  Container(
                      height: 30,
                      child: Row(
                          children: [
                            Expanded(child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: PdfColors.black, width: 1.0),
                              ),
                              alignment: Alignment.centerLeft,
                                child: Text(
                                    ' Wet Chemical',
                                    textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                  ),


                            ),flex: 6),

                            Expanded(child: Column(
                                children: [


                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [

                                        Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '6 ltr',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3),  Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.totalWetChemical6}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3), Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.basicServiceWetChemical6}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),
                                        Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.extendedServiceWetChemical6}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child:  Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.reChargeWetChemical6}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.serviceExchangeWetChemical6}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.supplyNewWetChemical6}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.disposalWetChemical6}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),
                                      ]
                                  ),            Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [

                                        Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '9 ltr',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3),  Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.totalWetChemical9}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3), Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.basicServiceWetChemical9}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),
                                        Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.extendedServiceWetChemical9}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.reChargeWetChemical9}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.serviceExchangeWetChemical9}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.supplyNewWetChemical9}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.disposalWetChemical9}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),
                                      ]
                                  ),




                                ]
                            ),flex: 33)
                          ]
                      )
                  ),
                  //     Powder
                  Container(
                      height: 45,
                      child: Row(
                          children: [
                            Expanded(child: Container(
                              height: 45,
                              //alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                border: Border.all(color: PdfColors.black, width: 1.0),
                              ),

                              child: Text(
                                'Powder',
                                style:  TextStyle(fontSize: 9),

                              ),

                            ),flex: 6),

                            Expanded(child: Column(
                                children: [


                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [

                                        Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '4 Kg',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3),  Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.totalPowder4K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3), Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.basicServicePowder4K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),
                                        Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.extendedServicePowder4K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.reChargePowder4K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.serviceExchangePowder4K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.supplyNewPowder4K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.disposalPowder4K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),
                                      ]
                                  ),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [

                                        Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '6 kg',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3),  Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.totalPowder6K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3), Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.basicServicePowder6K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),
                                        Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.extendedServicePowder6K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child:  Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.reChargePowder6K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.serviceExchangePowder6K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.supplyNewPowder6K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.disposalPowder6K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),
                                      ]
                                  ),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [

                                        Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '9 kg',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3),  Expanded(child:Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.totalPowder9K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 3), Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.basicServicePowder9K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),
                                        Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.extendedServicePowder9K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child:  Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.reChargePowder9K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.serviceExchangePowder9K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.supplyNewPowder9K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 4),Expanded(child: Container(
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: PdfColors.black, width: 1.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${fireDockModel.disposalPowder9K}',
                                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ),flex: 5),
                                      ]
                                  ),




                                ]
                            ),flex: 33)
                          ]
                      )
                  ),


                  //Fire Blanket
                  Container(
                      height: 15,
                      child: Row(
                          children: [
                            Expanded(child: Container(
                              height: 15,
                              decoration: BoxDecoration(
                                border: Border.all(color: PdfColors.black, width: 1.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Fire Blanket',
                                  textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                ),
                              ),
                            ),flex: 6),

                            Expanded(child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [

                                  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        ' ',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3),  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.totalFireBlanke}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3), Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.basicServiceFireBlanke}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),
                                  Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.extendedServiceFireBlanke}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.reChargeFireBlanke}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.basicServiceFireBlanke}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.supplyNewFireBlanke}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.disposalFireBlanke}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),
                                ]
                            ),  flex: 33)
                          ]
                      )
                  ),

                  //     Hose Reel
                  Container(
                      height: 15,
                      child: Row(
                          children: [
                            Expanded(child: Container(
                              height: 15,
                              decoration: BoxDecoration(
                                border: Border.all(color: PdfColors.black, width: 1.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Hose Reel',
                                  textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                ),
                              ),
                            ),flex: 6),

                            Expanded(child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [

                                  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        ' ',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3),  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.totalHoseRee}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3), Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.basicServiceHoseRee}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),
                                  Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.extendedServiceHoseRee}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.reChargeHoseRee}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.serviceExchangeHoseRee}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.supplyNewHoseRee}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.disposalHoseRee}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),
                                ]
                            ),  flex: 33)
                          ]
                      )
                  ),


                  //Extra 1..........
                  Container(
                      height: 15,
                      child: Row(
                          children: [
                            Expanded(child: Container(
                              height: 15,
                              decoration: BoxDecoration(
                                border: Border.all(color: PdfColors.black, width: 1.0),
                              ),
                              child: Center(
                                child: Text(
                                  '${fireDockModel.extraWorkedOut1Titl}',
                                  textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                ),
                              ),
                            ),flex: 6),

                            Expanded(child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [

                                  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        ' ',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3),  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.totalExtraWorkedOut1}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3), Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.basicServiceExtraWorkedOut1}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),
                                  Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.extendedServiceExtraWorkedOut1}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child:  Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.reChargeExtraWorkedOut1}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.serviceExchangeExtraWorkedOut1}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.supplyNewExtraWorkedOut1}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.disposalExtraWorkedOut1}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),
                                ]
                            ),  flex: 33)
                          ]
                      )
                  ),

                  //Extra 2..........
                  Container(
                      height: 15,
                      child: Row(
                          children: [
                            Expanded(child: Container(
                              height: 15,
                              decoration: BoxDecoration(
                                border: Border.all(color: PdfColors.black, width: 1.0),
                              ),
                              child: Center(
                                child: Text(
                                  '${fireDockModel.extraWorkedOut2Titl}',
                                  textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                ),
                              ),
                            ),flex: 6),

                            Expanded(child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [

                                  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.sizeExtraWorkedOut2Titl}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3),  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.totalExtraWorkedOut2}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3), Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.basicServiceExtraWorkedOut2}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),
                                  Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.extendedServiceExtraWorkedOut2}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.reChargeExtraWorkedOut2}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.serviceExchangeExtraWorkedOut2}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.supplyNewExtraWorkedOut2}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.disposalExtraWorkedOut2}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),
                                ]
                            ),  flex: 33)
                          ]
                      )
                  ),
                  //Extra 3..........
                  Container(
                      height: 15,
                      child: Row(
                          children: [
                            Expanded(child: Container(
                              height: 15,
                              decoration: BoxDecoration(
                                border: Border.all(color: PdfColors.black, width: 1.0),
                              ),
                              child: Center(
                                child: Text(
                                  '${fireDockModel.extraWorkedOut3Titl}',
                                  textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                ),
                              ),
                            ),flex: 6),

                            Expanded(child:  Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [

                                  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.sizeExtraWorkedOut3Titl}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3),  Expanded(child:Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.totalExtraWorkedOut3}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 3), Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.basicServiceExtraWorkedOut3}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),
                                  Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.extendedServiceExtraWorkedOut3}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child:  Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.reChargeExtraWorkedOut3}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.serviceExchangeExtraWorkedOut3}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.supplyNewExtraWorkedOut3}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 4),Expanded(child: Container(
                                    height: 15,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: PdfColors.black, width: 1.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${fireDockModel.disposalExtraWorkedOut3}',
                                        textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                                      ),
                                    ),
                                  ),flex: 5),
                                ]
                            ),  flex: 33)
                          ]
                      )
                  ),
                  Container(
                      height: 128,
                      child: Container(
                        height: 15,alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          border: Border.all(color: PdfColors.black, width: 1.0),
                        ),
                        child: Text(
                          ' Additional Comments\n${fireDockModel.additionalComments}',
                          textAlign: TextAlign.left,style:  TextStyle(fontSize: 9),
                        ),
                      ),
                  ),
                ]
              )

            ),
            SizedBox(width: 6),
            Expanded(
              flex: 4,
              child: Column(
                children:[
                  Table.fromTextArray(
                    headers: ["Parts/equipment supplied"],
                    data: [

                    ],
                    border: TableBorder.all(color: PdfColors.black, width: 1),
                    headerStyle: TextStyle(),

                    cellHeight: 20,
                    cellAlignments: {
                      0: Alignment.centerLeft,
                    },
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Table.fromTextArray(
                          headers: ["Item",],
                          data: [

                          ],
                          border: TableBorder.all(color: PdfColors.black, width: 1),
                          headerStyle: TextStyle(fontSize: 9),

                          cellHeight: 32,
                          cellAlignments: {
                            0: Alignment.centerLeft,
                          },
                        ),flex: 6),
                        Expanded(child:  Table.fromTextArray(
                          headers: ["Qty",],
                          data: [

                          ],
                          border: TableBorder.all(color: PdfColors.black, width: 1),
                          headerStyle: TextStyle(fontSize: 9),

                          cellHeight: 32,
                          cellAlignments: {
                            0: Alignment.centerLeft,
                          },
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:  Align(
                            alignment: Alignment.centerLeft,
                              child:Text(
                            '  Cartridge',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),
                          )

                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:  Text(
                              '${fireDockModel.cartridgeQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' Discharge Hose',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.dischargeHoseQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' C02 Horn',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.c02HornQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' C02 Hose/Horn',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.c02HoseQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' Wall Bracket',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.wallBracketQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' Backboard',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.backboardQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' ID Sign',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.idSignQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' Fire Action Sign',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.fireActionSignQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' Directional Sign',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.directionalSignQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' Fire Log Book',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.fireLogBookQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' Single Stand',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.signleStandQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' Double Stand',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.doubleStandQty}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' ${fireDockModel.extraPartsName1}',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.extraQty1}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' ${fireDockModel.extraPartsName2}',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.extraQty2}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                            ' ${fireDockModel.extraPartsName3}',
                            textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                          ),)
                        ),flex: 6),
                        Expanded(child:  Container(
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(color: PdfColors.black, width: 1.0),
                          ),

                            child: Text(
                              '${fireDockModel.extraQty3}',
                              textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),

                          ),
                        ),flex: 3),
                      ]
                  ),
                  SizedBox(height: 8)
,
                // Uther Equipment service
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' Other Equipment Service ',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),)
                        ),flex: 6),
                        Expanded(child:SizedBox(width: 0),flex: 0),
                      ]
                  ),   //
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' ${fireDockModel.otherEquipmentServiced1}',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),)
                        ),flex: 6),
                        Expanded(child:SizedBox(width: 0),flex: 0),
                      ]
                  ),   //
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' ${fireDockModel.otherEquipmentServiced2}',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),)
                        ),flex: 6),
                        Expanded(child:SizedBox(width: 0),flex: 0),
                      ]
                  ),  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' ${fireDockModel.otherEquipmentServiced3}',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),)
                        ),flex: 6),
                        Expanded(child:SizedBox(width: 0),flex: 0),
                      ]
                  ),   //
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' ${fireDockModel.otherEquipmentServiced4}',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),)
                        ),flex: 6),
                        Expanded(child:SizedBox(width: 0),flex: 0),
                      ]
                  ),   //
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' ${fireDockModel.otherEquipmentServiced5}',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),)
                        ),flex: 6),
                        Expanded(child:SizedBox(width: 0),flex: 0),
                      ]
                  ),   //
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' ${fireDockModel.otherEquipmentServiced6}',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),)
                        ),flex: 6),
                        Expanded(child:SizedBox(width: 0),flex: 0),
                      ]
                  ),   //
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' ${fireDockModel.otherEquipmentServiced7}',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),)
                        ),flex: 6),
                        Expanded(child:SizedBox(width: 0),flex: 0),
                      ]
                  ),   //
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' ${fireDockModel.otherEquipmentServiced8}',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),)
                        ),flex: 6),
                        Expanded(child:SizedBox(width: 0),flex: 0),
                      ]
                  ),   //
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' ${fireDockModel.otherEquipmentServiced9}',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),)
                        ),flex: 6),
                        Expanded(child:SizedBox(width: 0),flex: 0),
                      ]
                  ),   //
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:  Container(
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' ${fireDockModel.otherEquipmentServiced10}',
                                textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
                              ),)
                        ),flex: 6),
                        Expanded(child:SizedBox(width: 0),flex: 0),
                      ]
                  ),   //
                  //


                ]
              )

            ),
          ]
        ),
        /*Container(
            margin:EdgeInsets.only(bottom: 10),
          height: 60,alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: PdfColors.black, width: 1.0),
          ),
          child:Center(
         
         
          child: RichText(
            text: TextSpan(
              children:   <TextSpan>[
                TextSpan(text: 'Aspire FIre and Security:',   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14), ),
                TextSpan(text: ' have serviced the portable and other fire protection equipement within the above permises in accordance with the requirements and frequencies indicated by BS5306 part 3 and refilled when required in accordance with BS6643 part 1'),
               ],
            ),
          ),

    )
          
        ),*/

        Row(
            children: [
              Expanded(child:  Container(
                height: 60,alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  border: Border.all(color: PdfColors.black, width: 1.0),
                ),
                child: Text(
                  ' Technical\n \n${fireDockModel.technicalSign}',
                  textAlign: TextAlign.left,style:  TextStyle(fontSize: 9),
                ),
              ),flex: 5,),
              Expanded(child:  Column(
                children: [
                  Container(
                    height: 25,alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      border: Border.all(color: PdfColors.black, width: 1.0),
                    ),
                    child: Text(
                      ' Date: ${fireDockModel.date}',
                      textAlign: TextAlign.left,style:  TextStyle(fontSize: 9),
                    ),
                  ),
                  Container(
                    height: 35,alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      border: Border.all(color: PdfColors.black, width: 1.0),
                    ),
                    child: Text(
                      ' Log book complete\n\n${fireDockModel.isLogBookComplete==true?"  Yes":"  No"}',
                      textAlign: TextAlign.left,style:  TextStyle(fontSize: 10,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),flex: 5,),
              Expanded(child:  Column(
                children: [
                  Container(
                    height: 60,alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      border: Border.all(color: PdfColors.black, width: 1.0),
                    ),
                    child:Column(
                        children: [
                          Container(
                            height: 20,alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child: Text(
                              ' Customer Signatere: ${fireDockModel.customerSign}',
                              textAlign: TextAlign.left,style:  TextStyle(fontSize: 9),
                            ),
                          ),Container(
                            height: 20,alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child: Text(
                              ' Position: ${fireDockModel.position}',
                              textAlign: TextAlign.left,style:  TextStyle(fontSize: 9),
                            ),
                          ),Container(
                            height: 20,alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              border: Border.all(color: PdfColors.black, width: 1.0),
                            ),
                            child: Text(
                              ' Please Print name: ${fireDockModel.printName}',
                              textAlign: TextAlign.left,style:  TextStyle(fontSize: 9),
                            ),
                          ),
                        ]                      )
                  ),
                  
                ],
              ),flex: 10,),

            ]
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
            child:Text("Registered in England \$ Wales No:7352940")
        ),
        Row(
          children: [ 
            pw.Image(
                alignment: pw.Alignment.center,
                img,
                fit: pw.BoxFit.fill,
                height: 50,
                width: 60),
          ]
        )

      ],
    ));

    return PdfApi.saveDocument(name: '${fireDockModel.fileNameControlle}', pdf: pdf);
  }

/*  static Widget buildHeader(Invoice invoice) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [],
  );*/


}
