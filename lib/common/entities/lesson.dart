/// A class representing a request for lesson data.
class LessonRequestEntity {
  int? id;

  LessonRequestEntity({
    this.id,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

/// A class representing the response entity for a list of lessons.
class LessonListResponseEntity {
  int? code; // The response code indicating success or failure.
  String? msg; // A message associated with the response.
  List<LessonItem>? data; // A list of lesson items.

  LessonListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  /// Creates a [LessonListResponseEntity] from a JSON map.
  factory LessonListResponseEntity.fromJson(Map<String, dynamic> json) =>
      LessonListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<LessonItem>.from(
                json["data"].map((x) => LessonItem.fromJson(x))),
      );
}

/// A class representing the response entity for lesson details.
class LessonDetailResponseEntity {
  int? code; // The response code indicating success or failure.
  String? msg; // A message associated with the response.
  List<LessonVideoItem>? data; // A list of lesson video items.

  LessonDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  /// Creates a [LessonDetailResponseEntity] from a JSON map.
  factory LessonDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      LessonDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<LessonVideoItem>.from(
                json["data"].map((x) => LessonVideoItem.fromJson(x))),
      );
}

/// A class representing a lesson item.
class LessonItem {
  String? name; // The name of the lesson.
  String? description; // The description of the lesson.
  String? thumbnail; // The thumbnail image URL of the lesson.
  int? id; // The unique identifier of the lesson.

  LessonItem({
    this.name,
    this.description,
    this.thumbnail,
    this.id,
  });

  /// Creates a [LessonItem] from a JSON map.
  factory LessonItem.fromJson(Map<String, dynamic> json) => LessonItem(
        name: json["name"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "thumbnail": thumbnail,
        "id": id,
      };
}

/// A class representing a lesson video item.
class LessonVideoItem {
  String? name; // The name of the video.
  String? url; // The URL of the video.
  String? thumbnail; // The thumbnail image URL of the video.

  LessonVideoItem({
    this.name,
    this.url,
    this.thumbnail,
  });

  /// Creates a [LessonVideoItem] from a JSON map.
  factory LessonVideoItem.fromJson(Map<String, dynamic> json) =>
      LessonVideoItem(
        name: json["name"],
        url: json["url"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "thumbnail": thumbnail,
      };
}
