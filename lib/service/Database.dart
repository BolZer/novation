import 'dart:async';
import 'dart:core';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

const DATABASE_NAME = "sb.db";

class AppDatabase {
  AppDatabase._();

  // Singleton instance
  static final AppDatabase _singleton = AppDatabase._();

  // Singleton accessor
  static AppDatabase get instance => _singleton;

  Completer<Database> _completer;
  Database _database;

  Future<Database> get database async {
    if (_completer == null) {
      _completer = new Completer();
      _openDatabase();
    }

    return _completer.future;
  }

  Future _openDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, DATABASE_NAME);

    final database = await createDatabaseFactoryIo().openDatabase(path);
    this._database = database;

    _completer.complete(database);
  }
}
