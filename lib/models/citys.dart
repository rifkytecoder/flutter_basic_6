// To parse this JSON data, do
//
//     final citys = citysFromJson(jsonString);

import 'dart:convert';

Citys citysFromJson(String str) => Citys.fromJson(json.decode(str));

String citysToJson(Citys data) => json.encode(data.toJson());

class Citys {
  Citys({
    required this.id,
    required this.idProvinsi,
    required this.name,
  });

  String id;
  String idProvinsi;
  String name;

  factory Citys.fromJson(Map<String, dynamic> json) => Citys(
        id: json["id"],
        idProvinsi: json["id_provinsi"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_provinsi": idProvinsi,
        "name": name,
      };

  @override
  String toString() => name;
}
