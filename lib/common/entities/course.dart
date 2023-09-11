// ignore_for_file: non_constant_identifier_names

/// A class representing a request for course data.
class CourseRequestEntity {
  int? id;

  CourseRequestEntity({
    this.id,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

/// A class representing a search request.
class SearchRequestEntity {
  String? search;

  SearchRequestEntity({
    this.search,
  });

  Map<String, dynamic> toJson() => {
        "search": search,
      };
}

/// A class representing the response entity for a list of courses.
class CourseListResponseEntity {
  int? code; // The response code indicating success or failure.
  String? msg; // A message associated with the response.
  List<CourseItem>? data; // A list of course items.

  CourseListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  /// Maping and return to object. `json['data]` has maps internally.
  /// so we need to go through fromJson method.
  factory CourseListResponseEntity.fromJson(Map<String, dynamic> json) =>
      CourseListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<CourseItem>.from(
                json["data"].map((x) => CourseItem.fromJson(x)),
              ),
      );
}

/// A class representing the response entity for course details.
class CourseDetailResponseEntity {
  int? code; // The response code indicating success or failure.
  String? msg; // A message associated with the response.
  CourseItem? data; // Course item data.

  CourseDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  /// Creates a [CourseDetailResponseEntity] from a JSON map.
  factory CourseDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      CourseDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: CourseItem.fromJson(json["data"]),
      );
}

/// A class representing a request for author data.
class AuthorRequestEntity {
  String? token;

  AuthorRequestEntity({
    this.token,
  });

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

/// A class representing the response entity for author details.
class AuthorResponseEntity {
  int? code; // The response code indicating success or failure.
  String? msg; // A message associated with the response.
  AuthorItem? data; // Author item data.

  AuthorResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  /// Creates an [AuthorResponseEntity] from a JSON map.
  factory AuthorResponseEntity.fromJson(Map<String, dynamic> json) =>
      AuthorResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: AuthorItem.fromJson(json["data"]),
      );
}

/// A class representing an author item.
class AuthorItem {
  String? token;
  String? name;
  String? description;
  String? avatar;
  String? job;
  int? follow;
  int? score;
  int? download;
  int? online;

  AuthorItem({
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.job,
    this.follow,
    this.score,
    this.download,
    this.online,
  });

  /// Creates an [AuthorItem] from a JSON map.
  factory AuthorItem.fromJson(Map<String, dynamic> json) => AuthorItem(
        token: json["token"],
        name: json["name"],
        description: json["description"],
        avatar: json["avatar"],
        job: json["job"],
        follow: json["follow"],
        score: json["score"],
        download: json["download"],
        online: json["online"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "description": description,
        "avatar": avatar,
        "job": job,
        "follow": follow,
        "score": score,
        "download": download,
        "online": online,
      };
}

/// A class representing a course item.
class CourseItem {
  String? user_token;
  String? name;
  String? description;
  String? thumbnail;
  String? video;
  String? price;
  String? amount_total;
  int? lesson_num;
  int? video_len;
  int? down_num;
  // int? follow;
  // int? score;
  int? id;

  CourseItem({
    this.user_token,
    this.name,
    this.description,
    this.thumbnail,
    this.video,
    this.price,
    this.amount_total,
    this.lesson_num,
    this.video_len,
    this.down_num,
    // this.follow,
    // this.score,
    this.id,
  });

  /// Creates a [CourseItem] from a JSON map.
  factory CourseItem.fromJson(Map<String, dynamic> json) => CourseItem(
        user_token: json["user_token"],
        name: json["name"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        video: json["video"],
        price: json["price"].toString(),
        amount_total: json["amount_total"],
        lesson_num: json["lesson_num"],
        video_len: json["video_length"],
        down_num: json["downloadable_res"],
        // follow: json["follow"],
        // score: json["score"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_token": user_token,
        "name": name,
        "description": description,
        "thumbnail": thumbnail,
        "video": video,
        "price": price,
        "amount_total": amount_total,
        "lesson_num": lesson_num,
        "video_len": video_len,
        "downloadable_res": down_num,
        // "follow": follow,
        // "score": score,
        "id": id,
      };
}
