import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  late BoxCollection collection;
  Future<void> db_init() async {
    if (kDebugMode) {
      print("Database init");
    }
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    //  Create a box collection
    collection = await BoxCollection.open(
      'top_flutter_repository',
      {'repo_list', 'repo_details'},
      path: appDocumentDirectory.path,
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
    final repoListBox = await collection.openBox<Map>('repo_list');
    await repoListBox
        .put(url, {"last_updated": DateTime.now(), "json": repoListJson});
  }

  Future<String> getRepoList(String url, bool isOffline) async {
    if (kDebugMode) {
      print("Device Offline: $isOffline");
    }
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    collection = await BoxCollection.open(
      'top_flutter_repository', // Name of your database
      {'repo_list', 'repo_details'}, // Names of your boxes
      path: appDocumentDirectory
          .path, // Path where to store your boxes (Only used in Flutter / Dart IO)
    );
    final repoListBox = await collection.openBox<Map>('repo_list');
    final repoList = await repoListBox.get(url);
    if (repoList?['last_updated'] != null && !isOffline) {
      final lastUpdated = repoList?['last_updated'];
      final now = DateTime.now();
      final difference = now.difference(lastUpdated).inMinutes;
      if (difference > 30) {
        return "";
      }
    }
    return repoList?['json'] ?? "";
  }
}
