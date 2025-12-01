import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasta_ai_app/modules/dashboard/binding/dash_board_binding.dart';
import 'package:rasta_ai_app/modules/sign_up/binding/sign_up_binding.dart';
import 'package:rasta_ai_app/modules/splash_screen/binding/splash_screen_binding.dart';
import 'package:rasta_ai_app/routes/routes.dart';

import 'commons/common_methods/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferencesService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialBinding: SplashScreenBinding(),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
    );
  }
}
