/// A class representing the response entity for contacts.
class ContactResponseEntity {
  int? code; // The response code indicating success or failure.
  String? msg; // A message associated with the response.
  List<ContactItem>? data; // A list of contact items.

  ContactResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  /// Creates a [ContactResponseEntity] from a JSON map.
  factory ContactResponseEntity.fromJson(Map<String, dynamic> json) =>
      ContactResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<ContactItem>.from(
                json["data"].map((x) => ContactItem.fromJson(x))),
      );

  /// Converts the [ContactResponseEntity] to a JSON map.
  Map<String, dynamic> toJson() => {
        "counts": code,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

/// A class representing a contact item.
class ContactItem {
  String? token; // The unique token associated with the contact.
  String? name; // The name of the contact.
  String?
      description; // A description or additional information about the contact.
  String? avatar; // The avatar image URL of the contact.
  int? online; // Indicates whether the contact is online (1) or offline (0).

  ContactItem({
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
  });

  /// Creates a [ContactItem] from a JSON map.
  factory ContactItem.fromJson(Map<String, dynamic> json) => ContactItem(
        token: json["token"],
        name: json["name"],
        description: json["description"],
        avatar: json["avatar"],
        online: json["online"],
      );

  /// Converts the [ContactItem] to a JSON map.
  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "description": description,
        "avatar": avatar,
        "online": online,
      };
}
