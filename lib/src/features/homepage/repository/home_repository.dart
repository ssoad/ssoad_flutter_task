import 'package:bs23_flutter_task/src/core/service/api_service/api_service.dart';
import 'package:bs23_flutter_task/src/core/service/data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/model/repository_list_response_model.dart';

class HomeRepository {
  HomeRepository();

  Future<List<Item>> fetchRepositories(int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String sortBy = prefs.getString('sortBy') ?? '';
    if (kDebugMode) {
      print("Fetching Repositories Page: $page");
    }
    var result =
        await DataProvider.getRepositories('flutter', page, 10, sortBy);
    if (kDebugMode) {
      print(result);
    }
    return result;
  }
}
