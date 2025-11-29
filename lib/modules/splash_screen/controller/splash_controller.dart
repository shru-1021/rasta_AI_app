import 'package:get/get.dart';
import '../../../commons/common_methods/shared_preferences.dart';
import '../../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      _checkLogin();
    });
  }

  void _checkLogin() {
    String? username = PreferencesService.getString('userName');
    String? password = PreferencesService.getString('passWord');

    if (username != null &&
        username.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.offAllNamed(AppRoutes.signup);
    }
  }
}
