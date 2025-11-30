import 'package:rasta_ai_app/modules/dashboard/model/courses_model.dart';
import 'package:rasta_ai_app/network/api_client.dart';

import '../model/cetegories_model.dart';

class DashboardRepository {
  final ApiClient _apiClient = ApiClient();

  Future<dynamic> getAllCourses() async {
    var res = await _apiClient.get("Courses");
    print("ressssssssss ${res}");
    return (res as List).map((json) => CoursesModel.fromJson(json)).toList();
  }

  Future<dynamic> getAllCategories() async {
    var res = await _apiClient.get("categories");
    return (res as List).map((json) => CetegoriesModel.fromJson(json)).toList();
  }

  Future<CoursesModel> createCourse(CoursesModel course) async {
    final body = course.toJson();
    final res = await _apiClient.post("/Courses", data: body);
    return CoursesModel.fromJson(res);
  }

  Future<CoursesModel> updateCourse(String id, CoursesModel course) async {
    final body = course.toJson();
    final res = await _apiClient.put("/Courses/$id", data: body);
    return CoursesModel.fromJson(res);
  }

  Future<void> deleteCourse(String id) async {
    await _apiClient.delete("/Courses/$id");
  }
}
