import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/repository_list_response_model.dart';

class DatabaseHelper {
  late BoxCollection collection;
  Future<void> db_init() async {
    print("Database init");
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    //  Create a box collection
    collection = await BoxCollection.open(
      'top_flutter_repository', // Name of your database
      {'repo_list', 'repo_details'}, // Names of your boxes
      path: appDocumentDirectory
          .path, // Path where to store your boxes (Only used in Flutter / Dart IO)
    );
  }

  Future<void> insertRepoList(String url, String repoListJson) async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    collection = await BoxCollection.open(
      'top_flutter_repository', // Name of your database
      {'repo_list', 'repo_details'}, // Names of your boxes
      path: appDocumentDirectory
          .path, // Path where to store your boxes (Only used in Flutter / Dart IO)
    );
    final repo_list_box = await collection.openBox<Map>('repo_list');
    await repo_list_box
        .put(url, {"last_updated": DateTime.now(), "json": repoListJson});
  }

  Future<String> getRepoList(String url) async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    collection = await BoxCollection.open(
      'top_flutter_repository', // Name of your database
      {'repo_list', 'repo_details'}, // Names of your boxes
      path: appDocumentDirectory
          .path, // Path where to store your boxes (Only used in Flutter / Dart IO)
    );
    final repo_list_box = await collection.openBox<Map>('repo_list');
    final repo_list = await repo_list_box.get(url);
    if (repo_list?['last_updated'] != null) {
      final last_updated = repo_list?['last_updated'];
      final now = DateTime.now();
      final difference = now.difference(last_updated).inMinutes;
      if (difference > 30) {
        return "";
      }
    }
    return repo_list?['json'] ?? "";
  }
}
