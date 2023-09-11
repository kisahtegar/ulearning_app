// ignore_for_file: non_constant_identifier_names

/// A class representing a request entity for synchronizing messages.
class SyncMessageRequestEntity {
  int? msgid;

  SyncMessageRequestEntity({
    this.msgid,
  });

  /// Converts the [SyncMessageRequestEntity] to a JSON map.
  Map<String, dynamic> toJson() => {
        "msgid": msgid,
      };
}

/// A class representing a request entity for making a call.
class CallRequestEntity {
  String? call_type; // 1. voice 2. video
  String? to_token;
  String? to_name;
  String? to_avatar;
  String? doc_id;

  CallRequestEntity({
    this.call_type,
    this.to_token,
    this.to_name,
    this.to_avatar,
    this.doc_id,
  });

  /// Converts the [CallRequestEntity] to a JSON map.
  Map<String, dynamic> toJson() => {
        "call_type": call_type,
        "to_token": to_token,
        "to_name": to_name,
        "to_avatar": to_avatar,
        "doc_id": doc_id,
      };
}

/// A class representing a request entity for sending a call token.
class CallTokenRequestEntity {
  String? call_token;
  String? to_token;

  CallTokenRequestEntity({
    this.call_token,
    this.to_token,
  });

  /// Converts the [CallTokenRequestEntity] to a JSON map.
  Map<String, dynamic> toJson() => {
        "call_token": call_token,
        "to_token": to_token,
      };
}

/// A class representing a request entity for sending a chat message.
class ChatRequestEntity {
  String? content;
  String? type;
  String? to_token;

  ChatRequestEntity({
    this.content,
    this.type,
    this.to_token,
  });

  /// Converts the [ChatRequestEntity] to a JSON map.
  Map<String, dynamic> toJson() => {
        "content": content,
        "type": type,
        "to_token": to_token,
      };
}

/// A class representing a chat message.
class Chat {
  String? from_token;
  String? to_token;
  int? msgid;
  String? content;
  String? type;
  int? status;
  String? created_at;

  Chat({
    this.from_token,
    this.to_token,
    this.msgid,
    this.content,
    this.type,
    this.status,
    this.created_at,
  });

  /// Creates a [Chat] object from a JSON map.
  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        from_token: json["from_token"],
        to_token: json["to_token"],
        msgid: json["msgid"],
        content: json["content"],
        type: json["type"],
        status: json["status"],
        created_at: json["created_at"],
      );

  /// Converts the [Chat] object to a JSON map.
  Map<String, dynamic> toJson() => {
        "from_token": from_token,
        "to_token": to_token,
        "msgid": msgid,
        "content": content,
        "type": type,
        "status": status,
        "created_at": created_at,
      };
}

/// A class representing a list of chat messages.
class MsgListcontent {
  int? msgid;
  String? from_token;
  String? from_name;
  String? from_avatar;
  String? to_token;
  String? content;
  String? type;
  int? status;
  String? created_at;

  MsgListcontent({
    this.msgid,
    this.from_token,
    this.from_name,
    this.from_avatar,
    this.to_token,
    this.content,
    this.type,
    this.status,
    this.created_at,
  });

  /// Creates a [MsgListcontent] object from a JSON map.
  factory MsgListcontent.fromJson(Map<String, dynamic> json) => MsgListcontent(
        from_token: json["from_token"],
        from_avatar: json["from_avatar"],
        from_name: json["from_name"],
        to_token: json["to_token"],
        msgid: json["msgid"],
        content: json["content"],
        type: json["type"],
        status: json["status"],
        created_at: json["created_at"],
      );

  /// Converts the [MsgListcontent] object to a JSON map.
  Map<String, dynamic> toJson() => {
        "from_token": from_token,
        "from_name": from_name,
        "from_avatar": from_avatar,
        "to_token": to_token,
        "msgid": msgid,
        "content": content,
        "type": type,
        "status": status,
        "created_at": created_at,
      };
}

/// A class representing the response entity for synchronizing messages.
class SyncMessageResponseEntity {
  int? code;
  String? msg;
  List<MsgListcontent>? data;

  SyncMessageResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  /// Creates a [SyncMessageResponseEntity] object from a JSON map.
  factory SyncMessageResponseEntity.fromJson(Map<String, dynamic> json) =>
      SyncMessageResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<MsgListcontent>.from(
                json["data"].map((x) => MsgListcontent.fromJson(x))),
      );

  /// Converts the [SyncMessageResponseEntity] object to a JSON map.
  Map<String, dynamic> toJson() => {
        "counts": code,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
