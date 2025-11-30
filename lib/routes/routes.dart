import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rasta_ai_app/modules/course_details/binding/course_details_binding.dart';
import 'package:rasta_ai_app/modules/course_details/ui/course_details.dart';
import 'package:rasta_ai_app/modules/sign_up/binding/sign_up_binding.dart';
import 'package:rasta_ai_app/modules/sign_up/screens/signup.dart';
import 'package:rasta_ai_app/modules/splash_screen/binding/splash_screen_binding.dart';
import 'package:rasta_ai_app/modules/splash_screen/ui/splash_screen.dart';

import '../modules/dashboard/binding/dash_board_binding.dart';
import '../modules/dashboard/ui/dashboard.dart';

class AppRoutes {
  static String dashboard = '/dashboard';
  static String splashScreen = '/splashScreen';
  static String signup = '/signup';
  static String courseDetails = '/course_details';

  static List<GetPage> pages = [
    GetPage(
      name: dashboard,
      page: () => Dashboard(),
      bindings: [DashBoardBinding()],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [SplashScreenBinding()],
    ),
    GetPage(
      name: signup,
      page: () => SignUpPage(),
      bindings: [SignUpBinding()],
    ),
    GetPage(
      name: courseDetails,
      page: () => CourseDetails(),
      bindings: [CourseDetailsBinding()],
    ),
  ];
}
