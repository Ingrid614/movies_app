// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  Client({
    required this.adresseKin,
    required this.numeroWhatsapp,
    required this.emailClient,
    required this.nomClient,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String? adresseKin;
  String? numeroWhatsapp;
  String? emailClient;
  String? nomClient;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    adresseKin: json["adresse_kin"],
    numeroWhatsapp: json["numero_whatsapp"],
    emailClient: json["email_client"],
    nomClient: json["nom_client"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "adresse_kin": adresseKin,
    "numero_whatsapp": numeroWhatsapp,
    "email_client": emailClient,
    "nom_client": nomClient,
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "id": id,
  };
}
