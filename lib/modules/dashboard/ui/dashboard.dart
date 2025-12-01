import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasta_ai_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:rasta_ai_app/modules/dashboard/widgets/dash_body.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final DashBoardController controller = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return DashBody();
  }
}
