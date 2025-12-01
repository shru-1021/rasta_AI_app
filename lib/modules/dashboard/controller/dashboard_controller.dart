import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasta_ai_app/modules/dashboard/model/courses_model.dart';
import 'package:rasta_ai_app/modules/dashboard/repository/dashboard_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/cetegories_model.dart';

// keys
const _kCoursesKey = 'cached_courses';
const _kCategoriesKey = 'cached_categories';

class DashBoardController extends GetxController {
  var isLoading = false.obs;
  var categories = <CetegoriesModel>[].obs;
  List<Map<String, dynamic>> courses = [];
  var isOnline = false.obs;
  var searchQuery = "".obs;
  RxString? selectedCategory = "MOBILE DEVELOPMENT".obs;
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final lesson = TextEditingController();
  var courseModel = <CoursesModel>[].obs;
  DashboardRepository repository = DashboardRepository();
  var filteredCourses = <CoursesModel>[].obs;

  void setLoading({value}) {
    isLoading.value = value;
    update();
  }


  @override
  void onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData() async {
    fetchCourses();
    fetchCetegories();
  }

  Future<void> _saveCoursesToLocal(List<CoursesModel> list) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = list.map((c) => c.toJson()).toList();
    await prefs.setString(_kCoursesKey, jsonEncode(jsonList));
  }

  Future<List<CoursesModel>> _getCoursesFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_kCoursesKey);
    if (data == null) return [];
    final List decoded = jsonDecode(data);
    return decoded.map((e) => CoursesModel.fromJson(e)).toList();
  }

  Future<void> _saveCategoriesToLocal(List<CetegoriesModel> list) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = list.map((c) => c.toJson()).toList();
    await prefs.setString(_kCategoriesKey, jsonEncode(jsonList));
  }

  Future<List<CetegoriesModel>> _getCategoriesFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_kCategoriesKey);
    if (data == null) return [];
    final List decoded = jsonDecode(data);
    return decoded.map((e) => CetegoriesModel.fromJson(e)).toList();
  }

  Future<void> fetchCourses() async {
    try {
      setLoading(value: true);
      courseModel.value = await repository.getAllCourses();

      isOnline.value = true;

      filteredCourses.value = List.from(courseModel);

      await _saveCoursesToLocal(courseModel);
      update();
    } catch (e) {
      // Load from local storage instead
      final localData = await _getCoursesFromLocal();
      courseModel.value = localData;
      filteredCourses.value = List.from(localData);
      update();
    } finally {
      setLoading(value: false);
    }
  }

  Future<void> createCourses({model}) async {
    try {
      setLoading(value: true);
      await repository.createCourse(model);
      update();
      await _saveCoursesToLocal(courseModel);
    } catch (e) {
      courseModel.add(model);
      _saveCoursesToLocal(courseModel);
      update();
    } finally {
      setLoading(value: false);
    }
  }

  Future<void> updateCourse({id, model}) async {
    try {
      setLoading(value: true);
      await repository.updateCourse(id, model);
      update();
      await _saveCoursesToLocal(courseModel);
    } catch (e) {
      var index = courseModel.indexWhere((element) => element.id == id);
      courseModel[index] = model;
      _saveCoursesToLocal(courseModel);
      update();
    } finally {
      setLoading(value: false);
    }
  }

  void onSearchChanged(String value) {
    searchQuery.value = value.toLowerCase();

    if (searchQuery.isEmpty) {
      filteredCourses.value = RxList.from(courseModel);
    } else {
      filteredCourses.value = courseModel.where((c) {
        final title = (c.title ?? '').toLowerCase();
        final desc = (c.description ?? '').toLowerCase();
        final category = (c.category ?? '').toLowerCase();

        return title.contains(searchQuery) ||
            desc.contains(searchQuery) ||
            category.contains(searchQuery);
      }).toList();
    }

    update();
  }

  void fetchCetegories() async {
    try {
      setLoading(value: true);
      categories.value = await repository.getAllCategories();
      await _saveCategoriesToLocal(categories);
      log("categories ${jsonEncode(categories)}");
      update();
    } catch (_) {
      final localCategories = await _getCategoriesFromLocal();
      if (localCategories.isNotEmpty) {
        categories.value = localCategories;
        update();
      }
    } finally {
      setLoading(value: false);
    }
  }

  void deleteCourse({String? id, int? index}) async {
    try {
      setLoading(value: true);
      if (id != null) {
        await repository.deleteCourse(id);
        await fetchCourses();
        update();
      }
    } catch (_) {
      filteredCourses.removeAt(index ?? 0);
      _saveCoursesToLocal(filteredCourses);
      update();
    } finally {
      setLoading(value: false);
    }
  }
}
