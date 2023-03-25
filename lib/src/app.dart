import 'package:bs23_flutter_task/src/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/constants/app_color.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          primaryColor: AppColor.primaryColor,
          secondaryHeaderColor: AppColor.secondaryColor,
          primarySwatch: AppColor.primarySwatch,
        ),
        initialRoute: Routes.home,
        getPages: Routes.pages);
  }
}
