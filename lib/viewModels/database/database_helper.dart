import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hiking_dairy/models/dairy.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  late Database _database;
  final String _tabelDairy = 'dairy';

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var db = await openDatabase(
      join(await getDatabasesPath(), 'task_db.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tabelDairy (
            id TEXT PRIMARY KEY, 
            name TEXT,
            location TEXT,
            date TEXT,
            dairy TEXT,
            pic TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute('DROP TABLE $_tabelDairy');
        await db.execute('''
          CREATE TABLE $_tabelDairy (
            id TEXT PRIMARY KEY, 
            name TEXT,
            location TEXT,
            date TEXT,
            dairy TEXT,
            pic TEXT,
            status BOOL
          )
        ''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertDairy(Dairy value) async {
    final Database db = await database;
    await db.insert(_tabelDairy, value.toMap());
  }

  Future<List<Dairy>> getDairy() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tabelDairy);
    return result.map((dairyMap) => Dairy.fromMap(dairyMap)).toList();
  }

  Future<Dairy> getDairyById(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tabelDairy,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((dairyMap) => Dairy.fromMap(dairyMap)).first;
  }

  Future<bool> updateDairy(Dairy value) async {
    final Database db = await database;
    final result = await db.update(
      _tabelDairy,
      value.toMap(),
      where: 'id = ?',
      whereArgs: [value.id],
    );
    return result > 0 ? true : false;
  }

  Future<bool> deletDairy(String id) async {
    final Database db = await database;
    final result = await db.delete(
      _tabelDairy,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result > 0 ? true : false;
  }
}
