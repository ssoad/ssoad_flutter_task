import 'package:bs34_flutter_task/src/core/service/api_service/api_service.dart';
import 'package:bs34_flutter_task/src/core/service/data_provider.dart';
import 'package:flutter/material.dart';

import '../../../core/model/repository_list_response_model.dart';

class HomeRepository {
  HomeRepository();

  Future<List<Item>> fetchRepositories(int page) async {
    print("Fetching Repositories Page: $page");
    var result = await DataProvider.getRepositories('flutter', page, 10);
    print(result);
    return result;
  }
}
