import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  var isOwner = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
   Future<void> saveUser({String? username, String? password}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", username!);
    await prefs.setString("password", password!);
  }

   Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("username");
  }

   Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("password");
  }


}
