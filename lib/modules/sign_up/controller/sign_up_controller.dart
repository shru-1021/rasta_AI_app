import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rasta_ai_app/routes/routes.dart';
import '../../../commons/common_methods/shared_preferences.dart';

class SignUpController extends GetxController {
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  // SAVE USER
  Future<void> saveUser({
    required String username,
    required String password,
  }) async {

    // if (!formKey.currentState!.validate()) {
    //   Get.snackbar("Error", "Please fill all fields");
    //   return;
    // }

    isLoading = true;
    update();

    await PreferencesService.saveString("username", usernameController.text);
    await PreferencesService.saveString("password", passwordController.text);
    await PreferencesService.saveBool("isLoggedIn", true);

    isLoading = false;
    update();

    Get.snackbar("Success", "User Saved Successfully");
    Get.offAllNamed(AppRoutes.dashboard);
  }


  Map<String, dynamic> getUser() {
    return {
      "username": PreferencesService.getString("username"),
      "password": PreferencesService.getString("password"),
      "isLoggedIn": PreferencesService.getBool("isLoggedIn") ?? false,
    };
  }
}
