import 'dart:convert';

List<Movie> movieFromJson(String str) => List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? synopsis;
  int32? note;
  DateTime? dateDeSortie

  Movie({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.synopsis,
    required this.note,
    required this.dateDeSortie
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    synopsis: json["synopsis"],
    note: json["note"],
    dateDeSortie: json["date_de_sortie"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "synopsis": synopsis,
    "note": note,
    "dateDeSortie": dateDeSortie,
  };
}
