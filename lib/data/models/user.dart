// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
     this.name,
     this.email,
     this.password,
     this.numeroCni,
     this.dateDeNaissance,
     this.numeroCommercial,
     this.localisation,
     this.userCode,
     this.parentCode,
     this.updatedAt,
     this.createdAt,
     this.id,
  });

  final String? name;
  final String? email;
  final String? password;
  final String? numeroCni;
  final String? dateDeNaissance;
  final String? numeroCommercial;
  final String? localisation;
  final String? userCode;
  final String? parentCode;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    numeroCni: json["numero_CNI"],
    dateDeNaissance: json["date_de_naissance"],
    numeroCommercial: json["numero_commercial"],
    localisation: json["localisation"],
    userCode: json["user_code"],
    parentCode: json["parent_code"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "numero_CNI": numeroCni,
    "date_de_naissance": dateDeNaissance,
    "numero_commercial": numeroCommercial,
    "localisation": localisation,
    "user_code": userCode,
    "parent_code": parentCode,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);
