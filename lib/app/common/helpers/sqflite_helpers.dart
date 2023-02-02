// ignore_for_file: depend_on_referenced_packages

import 'package:app_acai/app/common/utils/sql_tables.dart';
import 'package:app_acai/app/common/utils/strings_app.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteHelpers {
  SqfliteHelpers._();

  static final SqfliteHelpers instance = SqfliteHelpers._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), StringsApp.nomeDatabase);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute(SqlTables.tableCart);
  }
}
