// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

/// A class representing the login request entity.
class LoginRequestEntity {
  int? type; // The type of login.
  String? name; // The user's name.
  String? description; // A description associated with the user.
  String? email; // The user's email.
  String? phone; // The user's phone number.
  String? avatar; // The user's avatar.
  String? open_id; // The user's open ID.
  int? online; // The user's online status.

  LoginRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.open_id,
    this.online,
  });

  /// Converts the `LoginRequestEntity` object to a JSON Map.
  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "description": description,
        "email": email,
        "phone": phone,
        "avatar": avatar,
        "open_id": open_id,
        "online": online,
      };
}

/// API post response message.
class UserLoginResponseEntity {
  int? code; // The response code.
  String? msg; // The response message.
  UserItem? data; // User item data.

  UserLoginResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  /// Factory method to create a `UserLoginResponseEntity` object from JSON data.
  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: UserItem.fromJson(json["data"]),
      );
}

/// A class representing user item information.
class UserItem {
  String? access_token; // The user's access token.
  String? token; // The user's token.
  String? name; // The user's name.
  String? description; // A description associated with the user.
  String? avatar; // The user's avatar.
  int? online; // The user's online status.
  int? type; // The user's type.

  UserItem({
    this.access_token,
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
  });

  /// Factory method to create a `UserItem` object from JSON data.
  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        access_token: json["access_token"],
        token: json["token"],
        name: json["name"],
        description: json["description"],
        avatar: json["avatar"],
        online: json["online"],
        type: json["type"],
      );

  /// Converts the `UserItem` object to a JSON Map.
  Map<String, dynamic> toJson() => {
        "access_token": access_token,
        "token": token,
        "name": name,
        "description": description,
        "avatar": avatar,
        "online": online,
        "type": type,
      };
}

/// A class representing user data.
class UserData {
  final String? token; // The user's token.
  final String? name; // The user's name.
  final String? avatar; // The user's avatar.
  final String? description; // A description associated with the user.
  final int? online; // The user's online status.

  UserData({
    this.token,
    this.name,
    this.avatar,
    this.description,
    this.online,
  });

  /// Factory method to create a `UserData` object from Firestore data.
  factory UserData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserData(
      token: data?['token'],
      name: data?['name'],
      avatar: data?['avatar'],
      description: data?['description'],
      online: data?['online'],
    );
  }

  /// Converts the `UserData` object to a Firestore-compatible Map.
  Map<String, dynamic> toFirestore() {
    return {
      if (token != null) "token": token,
      if (name != null) "name": name,
      if (avatar != null) "avatar": avatar,
      if (description != null) "description": description,
      if (online != null) "online": online,
    };
  }
}
