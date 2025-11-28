import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../commons/common_methods/shared_preferences.dart';
import '../../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    precacheImage(const AssetImage("assets/images/splashIcon.png"), Get.context!);
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    navigateAfterSplash();
  }

  var isSuccess = false.obs;
  double opacity = 0;
  double scale = 0.6;
  bool? navigateAfterSplash() {
    String? userName = PreferencesService.getString('userName');
    String? passWord = PreferencesService.getString('passWord');


    if (userName!.isNotEmpty &&
        passWord!.isNotEmpty) {
      return true;
    } else {
      Get.offAllNamed(AppRoutes.signup);

      return false;
    }
  }
}
