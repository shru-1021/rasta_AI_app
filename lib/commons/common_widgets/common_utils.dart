import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../common_methods/color_constant.dart';

Widget customField(String hint, IconData icon, TextEditingController controller,
    {bool isPass = false}) {
  return Container(
    decoration: BoxDecoration(
      color: whiteColor.withValues(alpha: 0.25),
      borderRadius: BorderRadius.circular(14),
    ),
    child: TextField(
      controller: controller,
      obscureText: isPass,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: black26),
        hintText: hint,
        filled: true,
        fillColor:whiteColor,
        hintStyle: const TextStyle(color: black26),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),

      ),
      style: const TextStyle(color: blackColor, fontSize: 16),
    ),
  );
}


  Widget commonBtn({BuildContext? context,VoidCallback? onPressed,String? title}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: whiteColor,
        foregroundColor: black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 14,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title??"",
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

Widget showShimmer({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Shimmer(
        duration: Duration(seconds: 3),
        color: Colors.grey.withValues(alpha: 0.1),
        colorOpacity: 1,
        enabled: true,
        interval: Duration(milliseconds: 10),
        direction: ShimmerDirection.fromLTRB(),
        child: child,
      ),
    ),
  );
}


PreferredSizeWidget appBar({String? title}) {
  return AppBar(
    title: Text(
      title??"",
      style: TextStyle(
        color: whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: blackColor.withValues(alpha: 0.9),
  );
}


void showSnackBar({context, title}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
