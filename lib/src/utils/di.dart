import 'package:bs34_flutter_task/src/features/homepage/presentation/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<void> Init() async {
  Get.put<HomeRepository>(HomeRepository());
}

HomeRepository get homeRepository => Get.find<HomeRepository>();
