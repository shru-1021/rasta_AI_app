// To parse this JSON data, do
//
//     final coursesModel = coursesModelFromJson(jsonString);

import 'dart:convert';

List<CoursesModel> coursesModelFromJson(String str) {
  return List<CoursesModel>.from(json.decode(str).map((x) => CoursesModel.fromJson(x)));
}

String coursesModelToJson(List<CoursesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoursesModel {
    final String? id;
    final String? title;
    final String? description;
    final String? category;
    final int? lessons;
    final int? score;

    CoursesModel({
        this.id,
        this.title,
        this.description,
        this.category,
        this.lessons,
        this.score,
    });

    factory CoursesModel.fromJson(Map<String, dynamic> json) => CoursesModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        lessons: json["lessons"],
        score: json["score"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "lessons": lessons,
        "score": score,
    };
}
