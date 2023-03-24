import 'package:bs34_flutter_task/src/app.dart';
import 'package:bs34_flutter_task/src/core/service/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:bs34_flutter_task/src/utils/di.dart' as di;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.Init();
  await DatabaseHelper().db_init();
  runApp(const MyApp());
}
