import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/datasources/local/sqlite_database.dart';

final sqliteDatabaseProvider = Provider((ref) => SQLiteDatabase());
