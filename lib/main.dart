import 'package:bs34_flutter_task/src/app.dart';
import 'package:flutter/material.dart';
import 'package:bs34_flutter_task/src/utils/di.dart' as di;

Future<void> main() async {
  await di.Init();
  runApp(const MyApp());
}
