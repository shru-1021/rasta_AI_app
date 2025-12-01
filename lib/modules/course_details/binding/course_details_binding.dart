import 'package:get/get.dart';
import 'package:rasta_ai_app/modules/course_details/controller/course_details_controller.dart';

class CourseDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CourseDetailsController());
  }
}
