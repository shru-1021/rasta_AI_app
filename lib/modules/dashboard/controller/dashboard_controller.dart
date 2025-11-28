
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DashBoardController extends GetxController {

 @override
 void onInit() {
  super.onInit();
 }
 // Notifiers (used instead of StatefulWidget)
 final ValueNotifier<String> searchQuery = ValueNotifier("");
 final ValueNotifier<String> selectedCategory = ValueNotifier("All");

 // Category List
 final List<String> categories = [
  "All",
  "Mobile",
  "Programming",
  "Design",
  "Computer Science"
 ];
 }
