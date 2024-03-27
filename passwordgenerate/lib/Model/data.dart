import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHandler {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'passwords.db');
    Database database = await openDatabase(path,
        onCreate: _onCreate, onUpgrade: _onUpgrade, version: 1);
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Passwords (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        password TEXT NOT NULL
      )
    ''');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {}

  Future<List<Map<String, dynamic>>> readData(String sql) async {
    Database? myDb = await db;
    return await myDb!.rawQuery(sql);
  }

  Future<int> insertData(String sql) async {
    Database? myDb = await db;
    return await myDb!.rawInsert(sql);
  }

  Future<int> updateData(String sql) async {
    Database? myDb = await db;
    return await myDb!.rawUpdate(sql);
  }

  Future<int> deleteData(String sql) async {
    Database? myDb = await db;
    return await myDb!.rawDelete(sql);
  }
}
