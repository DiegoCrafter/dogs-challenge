// To parse this JSON data, do
//
//     final imageBreedModel = imageBreedModelFromJson(jsonString);

import 'dart:convert';

ImageBreedModel imageBreedModelFromJson(String str) => ImageBreedModel.fromJson(json.decode(str));

String imageBreedModelToJson(ImageBreedModel data) => json.encode(data.toJson());

class ImageBreedModel {
    ImageBreedModel({
        this.message,
        this.status,
    });

    String? message;
    String? status;

    factory ImageBreedModel.fromJson(Map<String, dynamic> json) => ImageBreedModel(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}
