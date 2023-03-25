import 'package:bs23_flutter_task/src/core/service/db_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../../model/repository_list_response_model.dart';

class APIService {
  Future<String> getRepositories(String url) async {
    String jsonResult = "";
    int retryCount = 3;
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/vnd.github.v3+json',
    };
    while (retryCount > 0) {
      try {
        var data = await http.get(Uri.parse(url), headers: headers);
        if (data.statusCode == 200) {
          jsonResult = data.body;
          break;
        } else {
          Get.snackbar("Error", "Connection Error Occured");
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        Get.snackbar("Error", "Connection Error Occured");
      }
    }
    return jsonResult;
  }
}
