import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Telephony telephony = Telephony.instance;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();
  final TextEditingController _valueSms = TextEditingController();


  @override
  void initState() {
    super.initState();
    _phoneController.text = '+16824336813';
    _msgController.text = 'Hi Whats Upp:)';
    _valueSms.text = '1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите номер для отправки';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Номер телефона',
                        labelText: 'Номер'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _msgController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите сообщение';
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Текст сообщения',
                      labelText: 'Сообщение',
                    ),
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _valueSms,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите количество СМС';
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Количество сообщений',
                      labelText: 'Количество',
                    ),
                  ),
                ),*/
                ElevatedButton(
                    onPressed: () { _sendSMS();}, child: const Text('SEND SMS')),
               // ElevatedButton(onPressed: () => _getSMS(), child: const Text('Прочитать СМС')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendSMS() async {
    int _sms = 0;
    while (_sms < int.parse(_valueSms.text)) {
      telephony.sendSms(to: _phoneController.text, message: _msgController.text);
      _sms ++;
    }
    showDialog(context: context, builder:(context){return AlertDialog(
      content:Container(
        height: 300,
        child:  Text("Sms send successfull",),
      )
    );});
  }

  _getSMS() async {
    List<SmsMessage> _messages = await telephony.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
        filter: SmsFilter.where(SmsColumn.ADDRESS).equals(_phoneController.text)
    );

    for(var msg in _messages) {
      print(msg.body);
    }
  }
}
