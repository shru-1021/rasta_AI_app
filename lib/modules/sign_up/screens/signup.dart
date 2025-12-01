import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:rasta_ai_app/commons/common_methods/color_constant.dart';
import '../../../commons/common_widgets/common_utils.dart';
import '../controller/sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [blackColor, black26],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 330,
                decoration: BoxDecoration(
                  color: whiteColor.withValues(alpha: 0.20),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: whiteColor.withValues(alpha: 0.3),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 30,
                      color: black26,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 26,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),

                    customField(
                      "Username",
                      Icons.person,
                      controller.usernameController
                    ),
                    const SizedBox(height: 15),

                    customField(
                      "Password",
                      Icons.lock,
                      controller.passwordController,
                      isPass: true,
                    ),

                    const SizedBox(height: 22),
                    commonBtn(
                      title: "Sign Up",
                      onPressed: () {
                        if (controller.usernameController.text.isNotEmpty &&
                            controller.passwordController.text.isNotEmpty) {
                          controller.saveUser(
                            username: controller.usernameController.text,
                            password: controller.passwordController.text,
                          );
                        } else {
                          showSnackBar(
                            context: context,
                            title: "Fields are mandatory",
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
