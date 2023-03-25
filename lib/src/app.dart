import 'package:bs34_flutter_task/src/features/homepage/presentation/screen/homepage.dart';
import 'package:bs34_flutter_task/src/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.home,
      getPages: Routes.pages
    );
  }
}
