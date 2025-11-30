import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dashboard_controller.dart';

class DashboardCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String category;
  final int score;
  final VoidCallback onTap;
  final ConfirmDismissCallback? confirmDismiss;

  const DashboardCard({
    this.confirmDismiss,
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.score,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) {
        return Dismissible(
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.delete, color: Colors.white, size: 30),
          ),

          // ---------------- HANDLE DELETE ----------------
          confirmDismiss: confirmDismiss,
          key: ValueKey(id),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
              // gradient: LinearGradient(
              //   colors: [
              //     Colors.black.withValues(alpha: 0.8),
              //     Colors.black12.withValues(alpha: 0.5),
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(3, 3),
                  color: Colors.grey.withValues(alpha: 0.1),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.9),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    TextButton(
                      onPressed: onTap,
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.9),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  description,
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category: $category",
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 0.9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Score: $score",
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 0.9),
                        fontWeight: FontWeight.bold,
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
}
