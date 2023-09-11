/// A class representing the base response entity returned from an API.
class BaseResponseEntity {
  int? code; // The response code indicating success or failure.
  String? msg; // A message associated with the response.
  String? data; // The data payload of the response.

  BaseResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  /// Creates a [BaseResponseEntity] from a JSON map.
  factory BaseResponseEntity.fromJson(Map<String, dynamic> json) =>
      BaseResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"],
      );

  /// Converts the [BaseResponseEntity] to a JSON map.
  Map<String, dynamic> toJson() => {
        "counts": code,
        "msg": msg,
        "items": data,
      };
}

/// A class representing a request entity for binding an FCM token.
class BindFcmTokenRequestEntity {
  String? fcmtoken; // The FCM token to be bound.

  BindFcmTokenRequestEntity({
    this.fcmtoken,
  });

  /// Converts the [BindFcmTokenRequestEntity] to a JSON map.
  Map<String, dynamic> toJson() => {
        "fcmtoken": fcmtoken,
      };
}
