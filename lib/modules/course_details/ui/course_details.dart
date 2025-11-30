import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasta_ai_app/modules/course_details/controller/course_details_controller.dart';

class CourseDetails extends StatelessWidget {
  CourseDetails({super.key});

  final CourseDetailsController controller = Get.put(CourseDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Course Details')));
  }
}
