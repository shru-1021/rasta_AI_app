import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasta_ai_app/modules/splash_screen/controller/splash_controller.dart';

import '../../../commons/common_methods/color_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [blackColor, black12],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(seconds: 2),
                    opacity: 1,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: whiteColor.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.school,
                        size: 95,
                        color: whiteColor,
                      ),
                    ),
                  ),
        
                  const SizedBox(height: 20),
        
                  AnimatedOpacity(
                    duration: const Duration(seconds: 2),
                    opacity: 1,
                    child: const Text(
                      "Rasta AI App",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
