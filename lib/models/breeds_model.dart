// To parse this JSON data, do
//
//     final breedsModel = breedsModelFromJson(jsonString);

import 'dart:convert';

BreedsModel breedsModelFromJson(String str) => BreedsModel.fromJson(json.decode(str));

String breedsModelToJson(BreedsModel data) => json.encode(data.toJson());

class BreedsModel {
    BreedsModel({
        this.message,
        this.status,
    });

    Map<String, List<String>>? message;
    String? status;

    factory BreedsModel.fromJson(Map<String, dynamic> json) => BreedsModel(
        message: Map.from(json["message"]).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": Map.from(message!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
    };
}
