import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:pdf_app/api/pdf_api.dart';
import 'package:pdf_app/model/customer.dart';
import 'package:pdf_app/model/invoice.dart';
import 'package:pdf_app/model/supplier.dart';
import 'package:pdf_app/utils.dart';
import 'package:pdf_app/widget/button_widget.dart';

class PdfInvoiceApi {

  static Future<File> generate(Invoice invoice, ) async {
    final netTotal = invoice.items
        .map((item) => item.unitPrice! * item.quantity!.toInt())
        .reduce((item1, item2) => item1 + item2);
    final total = netTotal;
    final pdf = Document();
 var img =  pw.MemoryImage((await rootBundle.load("assets/log.png")).buffer.asUint8List());
 var footerImg =  pw.MemoryImage((await rootBundle.load("assets/footer.png")).buffer.asUint8List());
    pdf.addPage(MultiPage(
      footer: (final context)=>  pw.Center(
        child: pw.Image(
            alignment: pw.Alignment.center,footerImg,fit: pw.BoxFit.cover,height: 90,width:600

        ),
      ),
      build: (context) => [
       Align(
       alignment:pw.Alignment.centerRight
         ,child:  pw.Image(
             alignment: pw.Alignment.centerRight,img,fit: pw.BoxFit.cover,height: 100,width: 100

         ),
       ),
        buildHeader(invoice),
        SizedBox(height: 20),

        buildInvoice(invoice),
   /*     Table.fromTextArray(
          headers: ["Our budget price to carry out the above works, including labour and travelling expenses will be ${ Utils.formatPrice(total)} excluding VAT ",],
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

        buildTotal(invoice),
        pw.Container(
          padding: pw.EdgeInsets.symmetric(vertical: 13),
          child: Text("Our budget price to carry out the above works, including labour and travelling expenses will be ${ Utils.formatPrice(total)} excluding VAT. ",style: pw.TextStyle(color:  PdfColors.black,fontWeight: FontWeight.bold,fontSize: 16)),
       alignment: Alignment.center ),
        build2ndPage(invoice),
        //buildFooter( ),
      ],
    ));

    return PdfApi.saveDocument(name:'${invoice.quotation!.fileName}.pdf', pdf: pdf);
  }

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(children: [
              pw.Text(
                "Quotation",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              pw.Container(height: 3, width: 200, child: pw.Divider())
            ]),
          ),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children:   <TextSpan>[
                    TextSpan(text: 'Quotation Number :',   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14), ),
                    TextSpan(text: ' ${invoice.quotation!.quotationNumber}'),
                  ],
                ),
              ),
              Text("Revision No : 1",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pw.Expanded(
                flex: 6,
                child: Column(
                    mainAxisSize: pw.MainAxisSize.max,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children:   <TextSpan>[
                            TextSpan(text: 'Client:',   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14), ),
                            TextSpan(text: ' ${invoice.quotation!.client}'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children:   <TextSpan>[
                            TextSpan(text: 'Attention of: ',   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14), ),
                            TextSpan(text: ' ${invoice.quotation!.attentionOf}'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children:   <TextSpan>[
                            TextSpan(text: 'Corresponding Address:',   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14), ),

                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children:   <TextSpan>[

                            TextSpan(text: ' ${invoice.quotation!.correspondingAddress ?? ""}'),
                          ],
                        ),
                      ),



                    ]),
              ),
              pw.Expanded(
                  child: Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            children:   <TextSpan>[
                              TextSpan(text: 'Site Name/ Address:',   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14), ),

                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children:   <TextSpan>[

                              TextSpan(text: ' ${invoice.quotation!.siteName ?? ""}'),
                            ],
                          ),
                        ),

                      ]),
                  flex: 3)
            ],
          ),
          pw.Divider(height: 20,color: PdfColors.grey),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Quote Date :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                TextSpan(text: ' ${invoice.quotation!.quoteDate}'),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Quote Number :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                TextSpan(text: ' ${invoice.quotation!.quoteNumber}'),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Job Description :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                TextSpan(text: ' ${invoice.quotation!.jobDescription}'),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Job Location :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                TextSpan(text: '${invoice.quotation!.jobLocation}'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text('${invoice.quotation!.quotationDetails}')

          ,   SizedBox(height:20),
          Center(
            child:Text("Thank you for the opportunity to provide a quotation for the above works.")
          )

        ],
      );

  static Widget build2ndPage(Invoice invoice ) {


    return Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        Text("Exclusions",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        Text("Please note the following:" ),
        Text("  1. The supply of any other item not specifically listed in our quotation.",style: pw.TextStyle(fontSize: 10)),
        Text("  2. Any other works necessary to enable the plant to operate correctly.",style: pw.TextStyle(fontSize: 10)),

    pw.SizedBox(height: 20),
        Text("Exclusions",style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        Text("  1. This quote will expire in 30 days from the date of issue" ,style: pw.TextStyle(fontSize: 10)),
        Text("  2. Unless otherwise specified, all works are to be carried out during normal working hours. Mon-Fri 08:00 to \n      17:00" ,style: pw.TextStyle(fontSize: 10)),
        Text("  3. Payment terms are 30 days from date of invoice" ,style: pw.TextStyle(fontSize: 10)),
        Text("  4. Our standard Terms & Conditions are available on request" ,style: pw.TextStyle(fontSize: 10)),
        pw.SizedBox(height: 20),
        Text("We trust our proposal meets with your satisfaction. To proceed with the works simply complete the work authorization section below and email back to admin@citymanagedservices.com" ),
        pw.SizedBox(height: 20),
        Text("Service Quotations"),

        Text("City Managed Service",style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontStyle: pw.FontStyle.italic,fontSize: 18)),

        pw.SizedBox(height: 20), Center(
          child: Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
            Text("Please send all Purchase Orders to"),
                pw.UrlLink(
                    destination: "  admin@citymanagedservices.com   ",
                    child: pw.Text(
                        "    admin@citymanagedservices.com"
                        ,style: pw.TextStyle(fontSize: 14,color: PdfColors.blue)
                    )
                ),
                pw.SizedBox(height: 16),
                Text("Customer Authorization",style: pw.TextStyle(fontSize: 22,fontWeight: pw.FontWeight.bold))
          ])
        ),
        pw.SizedBox(height: 20),
        pw.Row(

          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [

            Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [

                Text(
                  'Name : ${invoice.quotation!.customerName}',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                pw.SizedBox(height: 16),
                Text(
                  'Signed : ${invoice.quotation!.customerName}',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),pw.SizedBox(height: 16),

                Text(
                  'Purchase Order Number : ${invoice.quotation!.purchedOrderNumber}',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ]
            ),

            Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  Text(
                    'Position : ${invoice.quotation!.position}',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),pw.SizedBox(height: 16),
                  Text(
                    'Date : ${invoice.quotation!.date}',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
              ]
            ),

          ]
        ),




      ]
    );
  }


  TableColumnWidth defaultColumnWidth =   IntrinsicColumnWidth();

  static Widget buildInvoice(Invoice invoice) {

    //final headers = [ 'Item','Part No', 'Description', 'Quantity', 'Unit Price' ,'Net Price'];
    final headers = [  'Description'   ,'Net Price'];
    final data = invoice.items.map((item) {
      final total = item.unitPrice! * item.quantity!.toInt() * (1);

      return [
      // item.itemNo,
       // item.partNo,
        item.description,
        //'${item.quantity}',
      //  '£ ${item.unitPrice}',
        '£${total.toStringAsFixed(1)}',
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(10),
        1: FlexColumnWidth(3),
      },
   // defaultColumnWidth:IntrinsicColumnWidth(flex: 2) ,
      data: data,border: TableBorder.all(color: PdfColors.black,width: 1),
      cellAlignment: Alignment.center,

      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,

      cellAlignments: {
        0: Alignment.centerLeft ,
        1: Alignment.centerLeft,
        2: Alignment.center,
        3: Alignment.center,
        4: Alignment.center,
      },
    );
  }

  static Widget buildTotal(Invoice invoice) {
    final netTotal = invoice.items
        .map((item) => item.unitPrice! * item.quantity!.toInt())
        .reduce((item1, item2) => item1 + item2);
    final total = netTotal;
  return Table.fromTextArray(
    headers: ["Total : ",  "${Utils.formatPrice(netTotal)}"],
    headerAlignment:Alignment.centerLeft  ,
    data: [ ],
    border: TableBorder.all(color: PdfColors.black,width: 1),
    headerStyle: TextStyle(fontWeight: FontWeight.bold),
    cellHeight: 20,
    columnWidths: const <int, TableColumnWidth>{
      0: FlexColumnWidth(10),
      1: FlexColumnWidth(3),
    },
    cellAlignments: {
      0: Alignment.centerLeft,
      1: Alignment.centerLeft,
      2: Alignment.center,
      3: Alignment.center,
      4: Alignment.center,
    },
  );
    /* return Container(margin: pw.EdgeInsets.only(top: 12),
      alignment: Alignment.centerRight,
      child: Row(
        children: [

          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                *//*buildText(
                  title: 'Net total',
                  value: Utils.formatPrice(netTotal),
                  unite: true,
                ),
                Divider(),*//*
                buildText(
                  title: 'Total amount  ',
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  value: Utils.formatPrice(total),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),*//*
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),*//*
              ],
            ),
          ),
        ],
      ),
    );*/
  }



  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
