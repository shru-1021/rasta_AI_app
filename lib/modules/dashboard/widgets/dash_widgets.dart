import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:rasta_ai_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../commons/common_methods/color_constant.dart';
import '../../../commons/common_methods/shared_preferences.dart';
import '../../../commons/common_widgets/common_utils.dart';
import '../model/courses_model.dart';

// to add new courses
Widget addDialog(
  BuildContext context,
  String? id,
  DashBoardController dashboardController,
) {
  return Dialog(
    backgroundColor: whiteColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
    elevation: 10,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.school, color: black87, size: 40),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Add New Course",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            // TITLE
            const Text(
              "Course Title",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),

            TextField(
              controller: dashboardController.titleCtrl,
              decoration: InputDecoration(
                hintText: "Enter course title",
                fillColor: whiteColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // DESCRIPTION
            const Text(
              "Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),


            TextField(
              controller: dashboardController.descCtrl,
              maxLines: 3,
              decoration: InputDecoration(
                filled: true,
                fillColor: whiteColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: dashboardController.lesson,
              decoration: InputDecoration(
                hintText: "Enter number of lesson",
                filled: true,
                fillColor: whiteColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),

            // CATEGORY
            const Text(
              "Category",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),

            DropdownButtonFormField<String>(
              dropdownColor: whiteColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: whiteColor,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // initialValue: dashboardController.selectedCategory?.value
              //     .toLowerCase(),
              items: dashboardController.categories
                  .map(
                    (c) => DropdownMenuItem(
                      value: c.category?.toLowerCase(),
                      child: Text(c.category?.toLowerCase().capitalize ?? ""),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                dashboardController.selectedCategory?.value = val!;
              },
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                // CANCEL BUTTON
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: black87),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 16, color: black87),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // ADD BUTTON
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: black87,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      if (dashboardController.titleCtrl.text.isEmpty ||
                          dashboardController.descCtrl.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields"),
                          ),
                        );
                        return;
                      }

                      CoursesModel model = CoursesModel(
                        id: UniqueKey().toString(),
                        category: dashboardController.selectedCategory?.value,
                        description: dashboardController.descCtrl.text,
                        title: dashboardController.titleCtrl.text,
                        lessons: int.parse(dashboardController.lesson.text),
                        score:
                            dashboardController.titleCtrl.text.length *
                            int.parse(dashboardController.lesson.text),
                      );

                      if (id != null) {
                        Navigator.pop(context);
                        await dashboardController
                            .updateCourse(id: id, model: model)
                            .then((_) async {
                              await dashboardController.fetchCourses();
                            });
                      } else {
                        Navigator.pop(context);
                        await dashboardController
                            .createCourses(model: model)
                            .then((_) async {
                              await dashboardController.fetchCourses();
                            });
                      }

                      dashboardController.titleCtrl.clear();
                      dashboardController.descCtrl.clear();
                      dashboardController.lesson.clear();
                    },
                    child: const Text(
                      "Add Course",
                      style: TextStyle(color: whiteColor, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

// to delete new courses
void deleteDialog({
  required BuildContext context,
  String? id,
  int? index,
  required DashBoardController dashboardController,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.delete, color: Colors.red, size: 40),
              ),

              const SizedBox(height: 20),

              const Text(
                "Delete Course?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              const Text(
                "Are you sure you want to delete this course?",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: blackColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "No",
                        style: TextStyle(color: blackColor, fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Delete Button
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        if (id != null && id.isNotEmpty) {
                          dashboardController.deleteCourse(
                            id: id,
                            index: index,
                          );
                        }

                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(fontSize: 16, color: whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
