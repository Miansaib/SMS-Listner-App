import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sms_listrning_app/Services/SMS_Services.dart';
import 'package:sms_listrning_app/firebase_options.dart';

import '../Models/Message_Model.dart';

void uploadNewProductData(Message_Model obj) async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.collection("Messages Data").doc().set({
    'address': obj.address,
    'message content': obj.msgContent,
    'time': obj.time,
  }).then((value) {
    print("Data uploaded successfully");
  }).catchError((error) {
    print("Failed to upload data: $error");
    
  });
}


Future<bool> getFieldData(String docID, String fieldName) async {
  final DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('Kill Switch').doc(docID).get();
  if (snapshot.exists) {
    final data = snapshot.get(fieldName);
    return data;
  } else {
    throw Exception('Document does not exist!');
  }
}