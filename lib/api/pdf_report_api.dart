import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:pdf_app/api/pdf_api.dart';
import 'package:pdf_app/model/invoice.dart';
import 'package:pdf_app/model/report_model.dart';

class PdfReportApi {
  static Future<File> generate(ReportModel reportModel) async {
    final pdf = Document();

    var img = pw.MemoryImage(
        (await rootBundle.load("assets/log.png")).buffer.asUint8List());
    var footerImg = pw.MemoryImage(
        (await rootBundle.load("assets/footer.png")).buffer.asUint8List());
    pdf.addPage(MultiPage(
      footer: (final context) => pw.Center(
        child: pw.Image(
            alignment: pw.Alignment.center,
            footerImg,
            fit: pw.BoxFit.cover,
            height: 90,
            width: 600),
      ),
      build: (context) => [
        Row(children: [
          Text("ENGINEER SERVICE REPORT",
              style:
                  pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold)),
          pw.Image(
              alignment: pw.Alignment.centerRight,
              img,
              fit: pw.BoxFit.cover,
              height: 100,
              width: 100),
        ], mainAxisAlignment: pw.MainAxisAlignment.spaceBetween),


        Table.fromTextArray(
          headers: ["CITY JOB REF:","NAME:","DATE:"],
          data: [ ["${reportModel.cityJobRef}","${reportModel.name}","${reportModel.date}"], ],
          border: TableBorder.all(color: PdfColors.black,width: 1),
          headerStyle: TextStyle(fontWeight: FontWeight.bold),
          headerDecoration: BoxDecoration(color: PdfColors.grey300),
          cellHeight: 20,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.center,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ),
        Table.fromTextArray(
          headers: ["CLIENT JOB : ${reportModel.clientJob} ","WARRANTY : ${reportModel.isWarrenty==true? "YES":"No"}"],
          headerAlignment:Alignment.centerLeft  ,
          data: [],
          border: TableBorder.all(color: PdfColors.black,width: 1),

          cellHeight: 20,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ),
        Table.fromTextArray(
          headers: ["CLIENT NAME : ${reportModel.clientName} ",],
          headerAlignment:Alignment.centerLeft  ,
          data: [],
          border: TableBorder.all(color: PdfColors.black,width: 1),

          cellHeight: 20,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ),  Table.fromTextArray(
          headers: ["SITE CONTACT : ${reportModel.siteContact} ","TEL NO : ${reportModel.telNo} "],
          headerAlignment:Alignment.centerLeft  ,
          data: [],
          border: TableBorder.all(color: PdfColors.black,width: 1),

          cellHeight: 20,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ),Table.fromTextArray(
          headers: ["SITE ADDRESS : ${reportModel.siteAddress} ",],
          headerAlignment:Alignment.centerLeft  ,
          data: [],
          border: TableBorder.all(color: PdfColors.black,width: 1),

          cellHeight: 20,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ),
        pw.SizedBox(height: 20),


        Table.fromTextArray(

          headers: ["REPAIR(CALL OUT)","REPAIR(NON CALL OUT)","SERVICE","INSTALLATION",],
          data: [ [reportModel.isRepairCallOut==true? "YES":"No",reportModel.isRepair2==true? "YES":"No",reportModel.isService==true? "YES":"No",
            reportModel.isInstallation==true? "YES":"No",
          ], ],
          border: TableBorder.all(color: PdfColors.black,width: 1),
          headerStyle: TextStyle(fontWeight: FontWeight.bold),
          headerDecoration: BoxDecoration(color: PdfColors.grey300),
          cellHeight: 20,
          cellAlignments: {
            0: Alignment.center,
            1: Alignment.center,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ),

        pw.SizedBox(height: 20),


        Table.fromTextArray(


          headers: ["STATISTICS","START TIME","FINISH TIME","TOTAL",],
          data: [ ["SITE TIME/TRAVEL","${reportModel.travelStartTime}","${reportModel.travelFinishTime}","${reportModel.travelTotalTime}"
          ], ],
          border: TableBorder.all(color: PdfColors.black,width: 1),
          headerStyle: TextStyle(fontWeight: FontWeight.bold),
          headerDecoration: BoxDecoration(color: PdfColors.grey300),
          cellHeight: 20,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.center,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ),
        Table.fromTextArray(
          headers: ["JOB DESCRIPTION : ${reportModel.jobDescription} ",],
          headerAlignment:Alignment.centerLeft  ,
          data: [],
          border: TableBorder.all(color: PdfColors.black,width: 1),

          cellHeight: 20,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ), /* Table.fromTextArray(
          headers: ["ENGINEER REPORT : ${reportModel.engineerReport} ",],
          headerAlignment:Alignment.centerLeft  ,
          data: [],
          border: TableBorder.all(color: PdfColors.black,width: 1),

          cellHeight: 20,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ),*/
        pw.SizedBox(height: 20),
        Table.fromTextArray(
          headers: ["ENGINEER REPORT : ${reportModel.engineerReport??""} ",],
          headerAlignment:Alignment.topLeft  ,
          data: [],
          border: TableBorder.all(color: PdfColors.black,width: 1),

          cellHeight: 50,
          cellAlignments: {
          },
        ),
        pw.SizedBox(height: 20),
        Table.fromTextArray(
          headers: ["PARTS USED IF APPLICABLE : ${reportModel.partsUsedIfApplicable} ",],
          headerAlignment:Alignment.centerLeft  ,
          data: [],
          border: TableBorder.all(color: PdfColors.black,width: 1),

          cellHeight: 20,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ),   Table.fromTextArray(
          headers: ["CUSTOMER COMMENTS : ${reportModel.customerComments} ",],
          headerAlignment:Alignment.centerLeft  ,
          data: [],
          border: TableBorder.all(color: PdfColors.black,width: 1),

          cellHeight: 20,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ), Table.fromTextArray(
          headers: ["CUSTOMER SIGNATURE ","${reportModel.clientName??"    "}","FULL NAME","${reportModel.clientName??"    "}"],
          headerAlignment:Alignment.centerLeft  ,
          data: [],
          border: TableBorder.all(color: PdfColors.black,width: 1),

          defaultColumnWidth:IntrinsicColumnWidth(flex: 400) ,

          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ),Table.fromTextArray(
          headers: ["ENGINEER SIGNATURE ","${reportModel.engineerName??"    "}","FULL NAME","${reportModel.engineerName??"    "}"],
          headerAlignment:Alignment.centerLeft  ,
          data: [],
          border: TableBorder.all(color: PdfColors.black,width: 1),

          defaultColumnWidth:IntrinsicColumnWidth(flex: 100) ,

          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
          },
        ),


        //buildFooter( ),
      ],
    ));

    return PdfApi.saveDocument(name: '${reportModel.clientName}.pdf', pdf: pdf);
  }

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      );
}
