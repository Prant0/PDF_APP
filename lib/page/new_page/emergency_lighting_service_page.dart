import 'package:flutter/material.dart';


class EmergencyLightingServicePage extends StatefulWidget {
  const EmergencyLightingServicePage({super.key});

  @override
  State<EmergencyLightingServicePage> createState() => _EmergencyLightingServicePageState();
}

class _EmergencyLightingServicePageState extends State<EmergencyLightingServicePage> {

  TextEditingController jobNumber=TextEditingController();
  TextEditingController clientName=TextEditingController();
  TextEditingController serviceDate=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Color(0xffF3E5F5),
      appBar: AppBar(
        backgroundColor: Color(0xffF3E5F5),
        title: Text(
          " Emergency Lighting Service ",
          style: TextStyle(
              fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}



