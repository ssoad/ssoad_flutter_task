import 'package:bs34_flutter_task/src/features/details/presentation/cubit/home_cubit.dart';
import 'package:bs34_flutter_task/src/features/details/presentation/screen/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../features/homepage/presentation/cubit/home_cubit.dart';
import '../features/homepage/presentation/screen/homepage.dart';

class Routes {
  static const String home = "/home";
  static const String details = "/details";

  static final List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => BlocProvider(
        create: (_) => HomeCubit(),
        child: const Homepage(),
      ),
    ),
    GetPage(
      name: details,
      page: () => BlocProvider(
        create: (_) => RepositoryDetailsCubit(),
        child: const RepositoryDetails(),
      ),
    ),
  ];
}
