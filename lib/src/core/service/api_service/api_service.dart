import 'package:bs34_flutter_task/src/core/service/db_helper.dart';
import 'package:http/http.dart' as http;

import '../../model/repository_list_response_model.dart';

class APIService {
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
        var data = await http.get(Uri.parse(url));
        jsonResult = data.body;
        _dbHelper.insertRepoList(url, jsonResult);
      } catch (e) {
        print(e);
      }
    }
    var results = RepositoryListResponse.fromRawJson(jsonResult).items ?? [];
    return results;
  }
}
