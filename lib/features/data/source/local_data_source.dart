import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sql {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'dayer.db');
    Database database = await openDatabase(path,
        onCreate: createDataBase, version: 1, onUpgrade: upgradeDataBase);
    return database;
  }

  createDataBase(Database db, int version) async {
    await db.execute(
        'CREATE TABLE "Search" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"query" TEXT NOT NULL)');
    version = 1;
  }

  upgradeDataBase(Database db, int oldVersion, int newVersion) async {
    await db.execute(
        'CREATE TABLE "Search" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"query" TEXT NOT NULL)');
    oldVersion = 1;
    newVersion = 2;
  }

  insertDatabase(String query) async {
    Database? mydb = await db;
    int id1 = await mydb!.rawInsert(
      '''
        INSERT INTO "Search" ("query") VALUES("$query")''',
    );
    return id1;
  }

  Future<List<Map>> getRecords() async {
    Database? mydb = await db;
    List<Map> list = await mydb!.rawQuery("SELECT * FROM Search");
    return list;
  }

  deleteColumn(String id) async {
    Database? mydb = await db;
    int response = await mydb!.delete("Search WHERE id = $id");
    return response;
  }

  deleteDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'dayer.db');
    await deleteDatabase(path);
  }
}
