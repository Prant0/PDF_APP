import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:pdf_app/api/pdf_api.dart';
import 'package:pdf_app/page/new_page/fire_dock_form_page.dart';
import 'package:pdf_app/widget/button_widget.dart';

class EmergencyLightingServiceAPI {
  static Future<File> generate() async {
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
        Center(
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'INSPECTION & SERVICING CERTIFICATE',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                TextSpan(text: ' (Emergency Lights)'),
              ],
            ),
          ),
        ),
        Container(
            color: PdfColors.grey100,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Job Number',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      TextSpan(text: ' '),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Client Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      TextSpan(text: ' '),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Service Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      TextSpan(text: ' '),
                    ],
                  ),
                ),
              ]),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Property Address',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    TextSpan(text: '  '),
                  ],
                ),
              ),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Operative Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    TextSpan(text: '  '),
                  ],
                ),
              ),
            ])),
        Container(
            width: double.infinity,
            color: PdfColors.grey200,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Service Type: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    TextSpan(text: '  '),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Emergency lights serviced have been left in full working order: ",
                style: TextStyle(fontSize: 13),
              )
            ])),
        Container(
            width: double.infinity,
            color: PdfColors.grey100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text("Results recorded in logbook: ")),
        Container(
            width: double.infinity,
            color: PdfColors.grey200,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                  height: 50,
                  child: Text(
                      "Reason for results not being recorded in the Logbook if applicable: ",
                      style: TextStyle(
                        fontSize: 13,
                      ))),
              Text(
                  "Periodic Function Preventive Maintenance Tests (in accordance with BS 5266)",
                  style: TextStyle(fontWeight: FontWeight.bold))
            ])),
        Container(
            width: double.infinity,
            color: PdfColors.grey100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
                "Switch on in emergency mode every luminaire and internally illuminated exit sign \nby simulation of failure to the supply to ensure that each lamp illuminates: ")),
        Container(
            width: double.infinity,
            color: PdfColors.grey200,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
                "Checked all luminaries and signs are present, clean and functioning properly:")),
        Container(
            width: double.infinity,
            color: PdfColors.grey100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  "Supply restores after test, checking and indicator that normal supply has been restored: ",
                  style: TextStyle(
                    fontSize: 13,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Periodic Function Preventive Maintenance Tests (in accordance with BS 5266)",
                  style: TextStyle(fontWeight: FontWeight.bold))
            ])),
        Container(
            width: double.infinity,
            color: PdfColors.grey200,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
                "Each luminaire and internally illuminated sign tested as per the periodic tests but for its full duration (i.e. 3hrs): ")),Container(
            width: double.infinity,
            color: PdfColors.grey100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
                "The Supply has been restored and any indicator lamp or device checked to ensure normal supply has been restored:")),
     Container(
            width: double.infinity,
            color: PdfColors.grey200,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
                "Charging arrangements checked: ")),Container(
            width: double.infinity,
            color: PdfColors.grey100,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
                "Sufficient Lighting provided by Luminaires: ")),

        Container(
            width: double.infinity,
            color: PdfColors.grey200,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              children: [
                Text("Comments on results/Additional checks carried out / Remedial works Required/ Variations to BS 5266 ",style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(""),
              ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Customer Signature',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          TextSpan(text: ' '),
                        ],
                      ),
                    ),RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Customer Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          TextSpan(text: '                       '),
                        ],
                      ),
                    ),

                  ]
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Operative Signature',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          TextSpan(text: ' '),
                        ],
                      ),
                    ),Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Arrival Time',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              TextSpan(text: '                       '),
                            ],
                          ),
                        ),
                        Divider(height: 5,color: PdfColors.white),
                        SizedBox(
                          height: 20
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Departure Time',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              TextSpan(text: '                       '),
                            ],
                          ),
                        ),
                      ]
                    )

                  ]
                ),
                SizedBox(
                    height: 10
                ),
                Divider(height: 2,color: PdfColors.white),
              ]
            )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text("Head Office: 2 The Studios, The Row, New Ash Green, Longfield, Kent, DA3 8JL   Phone: 01322 686015",style: TextStyle(color:PdfColors.grey700,fontSize: 11))
        )
      ],
    ));

    return PdfApi.saveDocument(name: 'yoyo.pdf', pdf: pdf);
  }

/*  static Widget buildHeader(Invoice invoice) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [],
  );*/
}
