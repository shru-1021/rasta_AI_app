import 'package:flutter/material.dart';

import '../../../commons/common_methods/color_constant.dart';
import '../controller/dashboard_controller.dart';
import 'dash_widgets.dart';

class DashFloatingButton extends StatelessWidget {
  final DashBoardController controller;
  const DashFloatingButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black.withValues(alpha: 0.9),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => addDialog(context, null, controller),
        );
      },
      child: const Icon(Icons.add, color: whiteColor),
    );
  }
}
