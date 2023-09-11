// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

/// A class representing a chat or call entity in Firestore.
class ChatCall {
  final String? doc_id; // The unique identifier for the chat or call document.
  final String? from_token; // The token of the sender.
  final String? to_token; // The token of the recipient.
  final String? from_name; // The name of the sender.
  final String? to_name; // The name of the recipient.
  final String? from_avatar; // The avatar of the sender.
  final String? to_avatar; // The avatar of the recipient.
  final String? call_time; // The timestamp when the call was made.
  final String?
      type; // The type of the chat or call (e.g., chat, voice call, video call).
  final Timestamp? last_time; // The timestamp of the last activity.

  ChatCall({
    this.doc_id,
    this.from_token,
    this.to_token,
    this.from_name,
    this.to_name,
    this.from_avatar,
    this.to_avatar,
    this.call_time,
    this.type,
    this.last_time,
  });

  /// Creates a [ChatCall] object from Firestore data.
  factory ChatCall.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ChatCall(
      from_token: data?['from_token'],
      to_token: data?['to_token'],
      from_name: data?['from_name'],
      to_name: data?['to_name'],
      from_avatar: data?['from_avatar'],
      to_avatar: data?['to_avatar'],
      last_time: data?['last_time'],
      type: data?['type'],
      call_time: data?['call_time'],
    );
  }

  /// Converts the [ChatCall] object to Firestore data.
  Map<String, dynamic> toFirestore() {
    return {
      if (from_token != null) "from_token": from_token,
      if (to_token != null) "to_token": to_token,
      if (from_name != null) "from_name": from_name,
      if (to_name != null) "to_name": to_name,
      if (from_avatar != null) "from_avatar": from_avatar,
      if (to_avatar != null) "to_avatar": to_avatar,
      if (call_time != null) "call_time": call_time,
      if (type != null) "type": type,
      if (last_time != null) "last_time": last_time,
    };
  }
}
