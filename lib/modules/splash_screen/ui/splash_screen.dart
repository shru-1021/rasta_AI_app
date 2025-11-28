import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:rasta_ai_app/modules/splash_screen/controller/splash_controller.dart';
import 'dart:async';

import '../../dashboard/ui/dashboard.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return  GetBuilder<SplashController>(builder: (controller) {
      return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: controller.opacity,
                child: AnimatedScale(
                  scale:controller. scale,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeOutBack,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.school,
                          size: 95,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        "Course Learner",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
    // extract UI
  }
}

