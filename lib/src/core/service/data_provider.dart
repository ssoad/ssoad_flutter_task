import 'package:bs34_flutter_task/src/core/service/api_service/api_service.dart';

import '../model/repository_list_response_model.dart';
import 'db_helper.dart';

class DataProvider {
  static const String _baseUrl = 'https://api.github.com/';
  static final DatabaseHelper _dbHelper = DatabaseHelper();

  static Future<List<Item>> getRepositories(
      String query, int page, int perpage) async {
    String jsonResult = "";
    String url =
        '${_baseUrl}search/repositories?q=$query&page=$page&per_page=$perpage';
    jsonResult = await _dbHelper.getRepoList(url);
    if (jsonResult.isEmpty) {
      try {
        var data = await APIService.getRepositories(url);
        jsonResult = data;
        _dbHelper.insertRepoList(url, jsonResult);
      } catch (e) {
        print(e);
      }
    }
    var results = RepositoryListResponse.fromRawJson(jsonResult).items ?? [];
    return results;
  }
}
