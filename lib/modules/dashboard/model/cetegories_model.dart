// To parse this JSON data, do
//
//     final cetegoriesModel = cetegoriesModelFromJson(jsonString);

import 'dart:convert';

List<CetegoriesModel> cetegoriesModelFromJson(String str) => List<CetegoriesModel>.from(json.decode(str).map((x) => CetegoriesModel.fromJson(x)));

String cetegoriesModelToJson(List<CetegoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CetegoriesModel {
    final String? id;
    final String? category;

    CetegoriesModel({
        this.id,
        this.category,
    });

    factory CetegoriesModel.fromJson(Map<String, dynamic> json) => CetegoriesModel(
        id: json["id"],
        category: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": category,
    };
}
