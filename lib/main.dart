import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sms_listrning_app/firebase_options.dart';
import 'package:telephony/telephony.dart';
import 'Screens/HomeScreen.dart';
import 'Services/SMS_Services.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  Telephony telephony = Telephony.instance;
      telephony.listenIncomingSms(
      onBackgroundMessage: handleBackgroundMessage,
      onNewMessage: foregoundServices,
      listenInBackground: true,
    );
  status=await Permission.sms.isGranted;
  print('Permission : ${status}');
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
