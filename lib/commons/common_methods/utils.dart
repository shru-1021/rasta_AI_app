import 'package:flutter/material.dart';

void showSnackBar({context, title}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
