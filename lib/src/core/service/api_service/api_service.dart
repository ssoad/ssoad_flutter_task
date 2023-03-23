import 'package:http/http.dart' as http;

import '../../model/repository_list_response_model.dart';

class APIService {
  static const String _baseUrl = 'https://api.github.com/';

  static Future<List<Item>> getRepositories(
      String query, int page, int perpage) async {
    var data = await http.get(Uri.parse(
        '${_baseUrl}search/repositories?q=$query&page=$page&per_page=$perpage'));
    return RepositoryListResponse.fromRawJson(data.body).items ?? [];
  }
}
