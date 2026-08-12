import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../../utils/logger.dart';
import 'migrations/v1_initial_schema.dart';

class SQLiteDatabase {
  static final SQLiteDatabase _instance = SQLiteDatabase._internal();

  factory SQLiteDatabase() {
    return _instance;
  }

  SQLiteDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, 'f360in.db');

      AppLogger.info('Initializing database at: $path');

      return openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          AppLogger.info('Creating database schema v$version');
          await V1InitialSchema.create(db);
          AppLogger.info('Database schema created successfully');
        },
      );
    } catch (e) {
      AppLogger.error('Database initialization failed', e);
      rethrow;
    }
  }

  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}
