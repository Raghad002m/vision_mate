import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBSqflite{
  static final DBSqflite instance = DBSqflite._init();
  static Database? _database;

  DBSqflite._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('history.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
     CREATE TABLE history (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    action TEXT,
    timestamp TEXT
  )
      )
    ''');
  }

  Future<int> insertHistory(String action) async {
    final db = await database;
    return await db.insert(
      'history',
      {'action': action, 'timestamp': DateTime.now().toIso8601String()},
    );
  }

  Future<List<Map<String, dynamic>>> getHistory() async {
    final db = await database;
    return await db.query('history', orderBy: 'timestamp DESC');
  }

  Future<void> clearHistory() async {
    final db = await database;
    await db.delete('history');
  }
}