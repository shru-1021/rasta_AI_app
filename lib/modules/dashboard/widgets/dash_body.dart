import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasta_ai_app/routes/routes.dart';
import '../../../commons/common_methods/color_constant.dart';
import '../../../commons/common_methods/shared_preferences.dart';
import '../../../commons/common_widgets/common_utils.dart';
import '../controller/dashboard_controller.dart';
import 'dash_card_widget.dart';
import 'dash_floating_button.dart';
import 'dash_widgets.dart';

class DashBody extends StatelessWidget {
  const DashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: whiteColor,
          floatingActionButton: DashFloatingButton(controller: controller),
          appBar: appBar(
            title: "Welcome ${PreferencesService.getString("username") ?? ""}",
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              spacing: 15,
              children: controller.isLoading.isTrue
                  ? [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return showShimmer(
                              child: Container(
                                height: 150,
                                width: 100,

                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ]
                  : [
                      // ---------------- SEARCH ----------------
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search the Course",
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: controller.onSearchChanged,
                      ),

                      // ---------------- FILTERED LIST ----------------
                      if (controller.filteredCourses.isEmpty) ...{
                        Center(
                          child: Text(
                            "No More Courses.!",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      },
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.filteredCourses.length,
                          itemBuilder: (context, index) {
                            final c = controller.filteredCourses[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.courseDetails,
                                  arguments: c,
                                );
                              },
                              onDoubleTap: () {
                                deleteDialog(
                                  id: c.id ?? "",
                                  index: index,
                                  context: context,
                                  dashboardController: controller,
                                );
                              },
                              child: DashboardCard(
                                confirmDismiss: (direction) async {
                                  deleteDialog(
                                    dashboardController: controller,
                                    id: c.id ?? "",
                                    index: index,
                                    context: context,
                                  );
                                },
                                id: c.id ?? "",
                                onTap: () {
                                  controller.lesson.text = "${c.lessons}";
                                  controller.titleCtrl.text = c.title ?? "";
                                  controller.descCtrl.text =
                                      c.description ?? "";
                                  controller.selectedCategory?.value =
                                      c.category ?? "";
                                  showDialog(
                                    context: context,
                                    builder: (_) =>
                                        addDialog(context, c.id, controller),
                                  );
                                },
                                title: c.title ?? "",
                                description: c.description ?? "",
                                category: c.category ?? "",
                                score: c.score ?? 0,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
            ),
          ),
        );
      },
    );
    ;
  }
}
