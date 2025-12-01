import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasta_ai_app/commons/common_widgets/common_utils.dart';
import 'package:rasta_ai_app/modules/course_details/controller/course_details_controller.dart';

import '../../../commons/common_methods/color_constant.dart';

class CourseDetails extends StatelessWidget {
  CourseDetails({super.key});

  final CourseDetailsController controller = Get.put(CourseDetailsController());

  @override
  Widget build(BuildContext context) {
    final course = controller.arguments;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: appBar(title: "Course Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    blackColor.withValues(alpha: 0.9),
                    Colors.grey.shade800,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                    color: blackColor.withValues(alpha: 0.35),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if ((course.category ?? '').isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: whiteColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: white24),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.category_outlined,
                            size: 16,
                            color: whiteColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            course.category?.capitalize ?? '',
                            style: const TextStyle(
                              color: whiteColor,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 12),
                  Text(
                    course.title ?? '',
                    style: const TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            'Score: ${course.score ?? 0}',
                            style: const TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: const [
                          Icon(
                            Icons.play_lesson_outlined,
                            color: white70,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Course',
                            style: TextStyle(color: white70, fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      course.description?.capitalize ??
                          'No description available.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quick Info',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.label_important_outline, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Category: ${course.category?.capitalize ?? 'N/A'}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.stacked_line_chart, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'Score: ${course.score ?? 0}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blackColor,
                  foregroundColor: whiteColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                ),
                onPressed: () {
                  Get.back();
                },
                label: const Text(
                  'Go Back',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
