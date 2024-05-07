import 'package:flutter/material.dart';
import 'package:pdf_app/page/engineer_service_report.dart';
import 'package:pdf_app/page/pdf_page.dart';
import 'package:pdf_app/widget/button_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 150,),
            Image.asset("assets/log.png",height: 120,width: 120,),
            Text("City Managed",style: myStyle(30,Colors.black,FontWeight.w700),),
            SizedBox(height: 100,),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PdfPage()));
                },
              child: Text("Quotation",style: myStyle(16,Colors.white),),
              elevation: 0,
              color: Colors.deepOrange,
              minWidth: 150,
            ) , SizedBox(height: 0,),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EngineerServiceReport()));},
              child: Text("SERVICE REPORT",style: myStyle(16,Colors.white),),
              elevation: 0,
              color: Colors.deepOrange,
              minWidth: 150,
            ) ,
            Spacer(),
          Text('Design and Developed by "Houssam" ',style: myStyle(14,Colors.black54),),

          ],
        ),
      ),
    );
  }
}


class MyContainer extends StatelessWidget {
  String? text;
    MyContainer({super.key,this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Center(
        child: Text(
          text!,
          textAlign: TextAlign.center,style:  TextStyle(fontSize: 9),
        ),
      ),
    );
  }
}
