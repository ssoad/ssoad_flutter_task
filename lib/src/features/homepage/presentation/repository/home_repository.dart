import 'package:bs34_flutter_task/src/core/service/api_service/api_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/repository_list_response_model.dart';

class HomeRepository {
  HomeRepository();

  Future<List<Item>> getHome(int page) async {
    var result = await APIService.getRepositories('flutter', page, 10);
    return result;
  }
}
