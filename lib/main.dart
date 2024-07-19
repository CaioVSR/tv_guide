import 'package:flutter/material.dart';
import 'package:tv_guide/app/app_injections.dart';
import 'package:tv_guide/app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInjections.setupInjections();

  runApp(const AppWidget());
}
