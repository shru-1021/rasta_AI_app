import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DashBoardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final ValueNotifier<String> searchQuery = ValueNotifier("");
  final ValueNotifier<String> selectedCategory = ValueNotifier("All");
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();

  // Category List
  final List<String> categories = [
    "All",
    "Mobile",
    "Programming",
    "Design",
    "Computer Science",
  ];

  List<Map<String, dynamic>> courses = [];

  void addCourse(String title, String desc, String category) {
    courses.add({
      "title": title,
      "description": desc,
      "category": category,
      "score": 0,
    });

    update();
  }

  void deleteCourse(int index) {
    courses.removeAt(index);
    update();
  }

  Widget addDialog(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
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
                      child: const Icon(Icons.school, color: Colors.black87, size: 40),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Add New Course",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
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
                controller: titleCtrl,
                decoration: InputDecoration(
                  hintText: "Enter course title",
                  fillColor: Colors.white,
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
                controller: descCtrl,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Enter short description",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // CATEGORY
              const Text(
                "Category",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: categories.contains(selectedCategory.value)
                    ? selectedCategory.value
                    : null,
                items: categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (val) {
                  selectedCategory.value = val!;
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
                        side: const BorderSide(color: Colors.black87),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // ADD BUTTON
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (titleCtrl.text.isEmpty || descCtrl.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fill all fields"),
                            ),
                          );
                          return;
                        }

                        addCourse(
                          titleCtrl.text,
                          descCtrl.text,
                          selectedCategory.value,
                        );

                        titleCtrl.clear();
                        descCtrl.clear();

                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Add Course",
                        style: TextStyle(color: Colors.white, fontSize: 16),
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

  void deleteDialog({required BuildContext context, required int index}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha:0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.delete, color: Colors.red, size: 40),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Delete Course?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
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
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "No",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Delete Button
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                          deleteCourse(index);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(fontSize: 16, color: Colors.white),
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

//
//   Widget editDialog(BuildContext context, CourseModel course) {
//     // Fill controllers with existing values
//     titleCtrl.text = course.title;
//     descCtrl.text = course.description;
//     selectedCategory.value = course.category;
//
//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               Center(
//                 child: Column(
//                   children: const [
//                     Icon(Icons.edit, size: 40, color: Colors.black87),
//                     SizedBox(height: 10),
//                     Text(
//                       "Edit Course",
//                       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//
//               // TITLE
//               const Text(
//                 "Course Title",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 5),
//
//               TextField(
//                 controller: titleCtrl,
//                 decoration: InputDecoration(
//                   hintText: "Enter course title",
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               // DESCRIPTION
//               const Text(
//                 "Description",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 5),
//
//               TextField(
//                 controller: descCtrl,
//                 maxLines: 3,
//                 decoration: InputDecoration(
//                   hintText: "Enter short description",
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               // CATEGORY
//               const Text(
//                 "Category",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 5),
//
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 value: selectedCategory.value,
//                 items: categories
//                     .map((c) => DropdownMenuItem(value: c, child: Text(c)))
//                     .toList(),
//                 onChanged: (val) {
//                   selectedCategory.value = val!;
//                 },
//               ),
//
//               const SizedBox(height: 25),
//
//               Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         side: const BorderSide(color: Colors.black),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text(
//                         "Cancel",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(width: 12),
//
//                   Expanded(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () {
//                         if (titleCtrl.text.isEmpty || descCtrl.text.isEmpty) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text("Please fill all fields"),
//                             ),
//                           );
//                           return;
//                         }
//
//                         updateCourse(
//                           course.id,
//                           titleCtrl.text,
//                           descCtrl.text,
//                           selectedCategory.value,
//                         );
//
//                         Navigator.pop(context);
//                       },
//                       child: const Text(
//                         "Save Changes",
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//   void updateCourse(String id, String title, String desc, String category) {
//     // API or local update logic
//   }
//
//
//
// }
// class CourseModel {
//   final String id;
//   String title;
//   String description;
//   String category;
//
//   CourseModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.category,
//   });
//
//   // Convert Model → Map (useful for API or local storage)
//   Map<String, dynamic> toMap() {
//     return {
//       "id": id,
//       "title": title,
//       "description": description,
//       "category": category,
//     };
//   }
//
//   // Convert Map → Model
//   factory CourseModel.fromMap(Map<String, dynamic> map) {
//     return CourseModel(
//       id: map["id"],
//       title: map["title"],
//       description: map["description"],
//       category: map["category"],
//     );
//   }
}