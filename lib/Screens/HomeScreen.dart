// ignore: file_names
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telephony/telephony.dart';
import '../Services/SMS_Services.dart';

var status ;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final service=FlutterBackgroundService();

  Telephony telephony = Telephony.instance;

  @override
  
  void initState() {
    super.initState();
    
    telephony.listenIncomingSms(
      onBackgroundMessage: handleBackgroundMessage,
      onNewMessage: foregoundServices,
      listenInBackground: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cutomer e-KYC'),
          centerTitle: true,
          backgroundColor: Colors.grey.shade400,
        ),
        backgroundColor: Colors.grey.shade200,
        body: status
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'Assets/purpletick.png',
                      width: size.width * 0.4,
                    ),
                    const Text(
                      "Verification Successfull",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        width: size.width * 0.7,
                        child: Text(
                          'You have successfully verified your KYC, now you can enjoy uninterrupted wallet usage',
                          style: TextStyle(
                              fontSize: 18, color: Colors.grey.shade600),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('Assets/error.png'),
                    const Text(
                      "Verification Unsuccessfull",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          status = await Permission.sms.isGranted;
                          setState(() {});
                        },
                        child: const Text('Refresh'))
                  ],
                ),
              ));
  }
}


