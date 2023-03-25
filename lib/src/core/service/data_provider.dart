import 'package:bs34_flutter_task/src/core/service/api_service/api_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../model/repository_list_response_model.dart';
import 'db_helper.dart';

class DataProvider {
  static const String _baseUrl = 'https://api.github.com/';
  static final DatabaseHelper _dbHelper = DatabaseHelper();
  static final Connectivity _connectivity = Connectivity();
  static final APIService _apiService = APIService();

  static Future<List<Item>> getRepositories(
      String query, int page, int perpage, String sortBy) async {
    String jsonResult = "";
    final connectivityResult = await (_connectivity.checkConnectivity());
    String url =
        '${_baseUrl}search/repositories?q=$query&page=$page&per_page=$perpage&sort=$sortBy&order=desc';
    jsonResult = await _dbHelper.getRepoList(
        url, connectivityResult == ConnectivityResult.none);
    if (jsonResult.isEmpty &&
        (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi)) {
      try {
        var data = await _apiService.getRepositories(url);
        jsonResult = data;
        _dbHelper.insertRepoList(url, jsonResult);
      } catch (e) {
        print(e);
      }
    }
    return jsonResult.isEmpty
        ? []
        : RepositoryListResponse.fromRawJson(jsonResult).items ?? [];
  }
}
