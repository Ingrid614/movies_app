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

  Command({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.clientId,
    required this.adresseKin,
    required this.montant,
    required this.taux,
    required this.cout,
    required this.statutId,
    required this.client,
  });

  factory Command.fromJson(Map<String, dynamic> json) => Command(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    clientId: json["client_id"],
    adresseKin: json["adresse_kin"],
    montant: double.parse(json["montant"]),
    taux: json["taux"],
    cout: double.parse(json["cout"]),
    statutId: json["statut_id"],
    client: Client.fromJson(json["client"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "user_id": userId,
    "client_id": clientId,
    "adresse_kin": adresseKin,
    "montant": montant,
    "taux": taux,
    "cout": cout,
    "statut_id": statutId,
    "client": client!.toJson()
  };
}
