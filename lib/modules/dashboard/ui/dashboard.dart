import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:rasta_ai_app/modules/dashboard/controller/dashboard_controller.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                //---------------- SEARCH BAR ----------------
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

                //---------------- CATEGORY FILTER ----------------
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

                //---------------- FILTERED COURSE LIST ----------------
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: controller.searchQuery,
                    builder: (context, sQuery, _) {
                      return ValueListenableBuilder(
                        valueListenable: controller.selectedCategory,
                        builder: (context, selected, _) {
                          // Apply Filtering
                          final filtered = courses.where((course) {
                            bool matchSearch =
                                course["title"].toLowerCase().contains(
                                  sQuery.toLowerCase(),
                                ) ||
                                course["description"].toLowerCase().contains(
                                  sQuery.toLowerCase(),
                                );

                            bool matchCategory = selected == "All"
                                ? true
                                : course["category"] == selected;

                            return matchSearch && matchCategory;
                          }).toList();

                          return ListView.builder(
                            itemCount: filtered.length,
                            itemBuilder: (context, index) {
                              final c = filtered[index];
                              return DashboardCard(
                                title: c["title"],
                                description: c["description"],
                                category: c["category"],
                                score: c["score"],
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

//// --------------------- Courses Data ------------------------
final List<Map<String, dynamic>> courses = [
  {
    "title": "Flutter Development",
    "description": "Build beautiful native apps.",
    "category": "Mobile",
    "score": 92,
  },
  {
    "title": "Python for AI",
    "description": "Learn ML, DL & AI.",
    "category": "Programming",
    "score": 88,
  },
  {
    "title": "UI/UX Design",
    "description": "Design modern user interfaces.",
    "category": "Design",
    "score": 81,
  },
  {
    "title": "Data Structures",
    "description": "Master core DSA concepts.",
    "category": "Computer Science",
    "score": 95,
  },
];

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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.red.withValues(alpha: 0.8),
            Colors.red.withValues(alpha: 0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(3, 3),
            color: Colors.red.withValues(alpha: 0.3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //---------------- TITLE ----------------
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          //---------------- DESCRIPTION ----------------
          Text(
            description,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),

          const SizedBox(height: 10),

          //---------------- CATEGORY + SCORE ----------------
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
}
