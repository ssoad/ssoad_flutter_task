import 'package:bs34_flutter_task/src/core/service/db_helper.dart';
import 'package:bs34_flutter_task/src/features/homepage/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> Init() async {
  await Get.putAsync<SharedPreferences>(() => SharedPreferences.getInstance());
  Get.put<HomeRepository>(HomeRepository());
  await DatabaseHelper().db_init();
}

SharedPreferences get sharedPreferences => Get.find<SharedPreferences>();
HomeRepository get homeRepository => Get.find<HomeRepository>();
