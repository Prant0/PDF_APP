import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_app/api/lighting_service_api.dart';
import 'package:pdf_app/api/pdf_api.dart';
import 'package:pdf_app/page/new_page/fire_dock_form_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Invoice';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
      // home: EngineerServiceReport(),
       // home:HomePage(),
       // home:FireDocFormPage(),
     home:HomePage(),
     // home:HomePage(),
      );
}





class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                // Action for the first button
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FireDocFormPage()));
              },
              child: Text('Extinguisher Service Certificate'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            SizedBox(height: 20), // Add spacing between buttons
            MaterialButton(
              onPressed: () async{
                final pdfFile = await EmergencyLightingServiceAPI.generate(
                     );

                PdfApi.openFile(pdfFile);
                // Action for the second button
              },
              child: Text('Emergency Lighting Servicing'),
              color: Colors.green,
              textColor: Colors.white,
            ),
            SizedBox(height: 20), // Add spacing between buttons
            MaterialButton(
              onPressed: () {
                // Action for the third button
              },
              child: Text('Fire Alarm Service Certificate'),
              color: Colors.red,
              textColor: Colors.white,
            ),

            SizedBox(height: 20), // Add spacing between buttons
            MaterialButton(
              onPressed: () {
                // Action for the third button
              },
              child: Text('My Report City Managed'),
              color: Colors.orangeAccent,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
