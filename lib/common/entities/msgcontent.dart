import 'package:cloud_firestore/cloud_firestore.dart';

/// A class representing message content.
class Msgcontent {
  final String? token; // The sender's token.
  final String? content; // The content of the message.
  final String? type; // The type of the message.
  final Timestamp? addtime; // The timestamp when the message was added.

  Msgcontent({
    this.token,
    this.content,
    this.type,
    this.addtime,
  });

  /// Factory method to create a `Msgcontent` object from Firestore data.
  factory Msgcontent.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Msgcontent(
      token: data?['token'],
      content: data?['content'],
      type: data?['type'],
      addtime: data?['addtime'],
    );
  }

  /// Converts the `Msgcontent` object to a Firestore-compatible Map.
  Map<String, dynamic> toFirestore() {
    return {
      if (token != null) "token": token,
      if (content != null) "content": content,
      if (type != null) "type": type,
      if (addtime != null) "addtime": addtime,
    };
  }
}
