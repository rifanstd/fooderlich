import 'package:fooderlich/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';

class DBHelper {
  static const _dbVersion = 1;

  DBHelper._internal();
  factory DBHelper() => _instance;

  static final DBHelper _instance = DBHelper._internal();

  static Database? _database;

  // inisialisasi nama dan kolom pada tabel di database
  final String tableName = 'resep';
  final String id = 'id';
  final String dishImage = 'dishImage';
  final String title = 'title';
  final String duration = 'duration';
  final String source = 'source';
  final String information = 'information';

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDb();

    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "fooderlich.db");

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  // Membuat table dan kolom nya
  Future<void> _onCreate(Database db, int version) async {
    var sql =
        "CREATE TABLE $tableName ($id INTEGER PRIMARY KEY, $dishImage TEXT, $title TEXT, $duration TEXT, $source TEXT, $information TEXT)";

    await _database!.execute(sql);
  }

  // insert data
  Future<int?> addResep(SimpleRecipe recipe) async {
    var dbClient = await _database;

    return await dbClient?.insert(tableName, recipe.toMap());
  }
}
