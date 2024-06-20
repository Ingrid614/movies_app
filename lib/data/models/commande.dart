// To parse this JSON data, do
//
//     final command = commandFromJson(jsonString);

import 'dart:convert';
import 'package:ludokin_agent/data/models/client.dart';


List<Command> commandFromJson(String str) => List<Command>.from(json.decode(str).map((x) => Command.fromJson(x)));

String commandToJson(List<Command> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Command {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? clientId;
  String? adresseKin;
  double? montant;
  int? taux;
  double? cout;
  int? statutId;
  Client? client;

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
