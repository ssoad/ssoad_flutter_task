import 'package:bs23_flutter_task/src/utils/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../features/homepage/presentation/cubit/home_cubit.dart';
import '../features/homepage/presentation/screen/homepage.dart';
import '../features/repository_details/presentation/cubit/repository_details_cubit.dart';
import '../features/repository_details/presentation/screen/repository_details.dart';

class Routes {
  static const String home = "/home";
  static const String details = "/details";

  static final List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => BlocProvider(
        create: (_) => HomeCubit(homeRepository, sharedPreferences)..onInit(),
        child: Homepage(),
      ),
    ),
    GetPage(
      name: details,
      page: () => BlocProvider(
        create: (_) => RepositoryDetailsCubit()..onInit(Get.arguments),
        child: const RepositoryDetails(),
      ),
    ),
  ];
}
