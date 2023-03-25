import 'package:bs23_flutter_task/src/app.dart';
import 'package:flutter/material.dart';
import 'package:bs23_flutter_task/src/utils/di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.Init();
  runApp(const MyApp());
}
