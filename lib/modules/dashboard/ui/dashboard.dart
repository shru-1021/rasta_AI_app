import 'package:flutter/material.dart';
import 'package:rasta_ai_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => controller.addDialog(context),
              );
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const SizedBox(height: 30),

                // ---------------- SEARCH ----------------
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search courses...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) => controller.searchQuery.value = value,
                ),

                const SizedBox(height: 12),

                // ---------------- CATEGORY FILTER ----------------
                ValueListenableBuilder(
                  valueListenable: controller.selectedCategory,
                  builder: (context, current, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Category:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DropdownButton(
                          value: current,
                          items: controller.categories
                              .map(
                                (cat) => DropdownMenuItem(
                                  value: cat,
                                  child: Text(cat),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            controller.selectedCategory.value = value
                                .toString();
                          },
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 12),

                // ---------------- FILTERED LIST ----------------
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: controller.searchQuery,
                    builder: (context, query, _) {
                      return ValueListenableBuilder(
                        valueListenable: controller.selectedCategory,
                        builder: (context, selected, _) {
                          final filtered = controller.courses.where((course) {
                            final matchSearch =
                                course["title"].toLowerCase().contains(
                                  query.toLowerCase(),
                                ) ||
                                course["description"].toLowerCase().contains(
                                  query.toLowerCase(),
                                );

                            final matchCategory = selected == "All"
                                ? true
                                : course["category"] == selected;

                            return matchSearch && matchCategory;
                          }).toList();

                          return ListView.builder(
                            itemCount: filtered.length,
                            itemBuilder: (context, index) {
                              final c = filtered[index];
                              final originalIndex = controller.courses.indexOf(
                                c,
                              ); // find real index

                              return GestureDetector(
                                onDoubleTap: () {
                                  controller.deleteDialog(
                                    index: originalIndex,
                                    context: context,
                                  );
                                },
                                child: DashboardCard(
                                  title: c["title"],
                                  description: c["description"],
                                  category: c["category"],
                                  score: c["score"],
                                ),
                              );
                            },
                          );
                        },
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
  }
}

//// ------------------- Dashboard Card UI ---------------------
class DashboardCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final int score;

  const DashboardCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
        builder: (controller) {
          return  Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.black.withValues(alpha: 0.8),
                Colors.black12.withValues(alpha: 0.5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(3, 3),
                color: Colors.black.withValues(alpha: 0.3),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                     // controller.editDialog();
                    },
                    icon: Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              Text(
                description,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category: $category",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Score: $score",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
