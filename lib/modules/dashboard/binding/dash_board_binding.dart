import 'package:get/get.dart';
import 'package:rasta_ai_app/modules/dashboard/controller/dashboard_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
  }
}
