// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

/// A class representing a message.
class Message {
  String? doc_id; // The unique identifier of the message document.
  String? token; // The user's token associated with the message.
  String? name; // The name of the user who sent the message.
  String? avatar; // The avatar image URL of the user.
  String? last_msg; // The content of the last message.
  Timestamp? last_time; // The timestamp of the last message.
  int? msg_num; // The number of messages.
  int? online; // The user's online status.

  Message({
    this.doc_id,
    this.token,
    this.name,
    this.avatar,
    this.last_msg,
    this.last_time,
    this.msg_num,
    this.online,
  });
}

/// A class representing a call message.
class CallMessage {
  String? doc_id; // The unique identifier of the call message document.
  String? token; // The user's token associated with the call.
  String? name; // The name of the user who initiated the call.
  String? avatar; // The avatar image URL of the user.
  String? call_time; // The timestamp of the call.
  String? type; // The type of call (e.g., voice or video).
  Timestamp? last_time; // The timestamp of the last call.

  CallMessage({
    this.doc_id,
    this.token,
    this.name,
    this.avatar,
    this.call_time,
    this.type,
    this.last_time,
  });
}
