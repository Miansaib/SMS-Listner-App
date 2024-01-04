import 'package:cloud_firestore/cloud_firestore.dart';

class Message_Model {
  String? address;
  String? msgContent;
  String? time;
  // late final List<Movie>? search;
  Message_Model(
      {
         required this.address,
         required this.msgContent,
         required this.time,
        });

 static Message_Model fromJSON(Map<String, dynamic> map) {
    return Message_Model(
        address: map['address'],
        msgContent: map['message content'],
        time: map['time']);
  }

}
