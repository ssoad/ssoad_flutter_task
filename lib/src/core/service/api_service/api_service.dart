import 'package:bs34_flutter_task/src/core/service/db_helper.dart';
import 'package:http/http.dart' as http;

import '../../model/repository_list_response_model.dart';

class APIService {
  static final DatabaseHelper _dbHelper = DatabaseHelper();

  static Future<String> getRepositories(String url) async {
    String jsonResult = "";
    var data = await http.get(Uri.parse(url));
    jsonResult = data.body;
    return jsonResult;
  }
}
