// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io' as io;
import 'package:fisio_app/app/modules/favorites/model/photo_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final DBHelper dbHelper = DBHelper._instance();
  DBHelper._instance();

  late Database _db;

  static const String ID = 'id';
  static const String NAME = 'photo_name';
  static const String TABLE = 'PhotosTable';
  static const String DB_NAME = 'photos.db';

  Future<Database> get db async {
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $TABLE ($ID INTEGER, $NAME TEXT)');
  }

  Future<PhotoModel> save(PhotoModel photo) async {
    var dbClient = await db;
    photo.id = await dbClient.insert(TABLE, photo.toMap());
    return photo;
  }

  Future<List<PhotoModel>> getPhotoModels() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query(TABLE, columns: [ID, NAME]);
    List<PhotoModel> employees = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(PhotoModel.fromMap(maps[i]));
      }
    }
    return employees;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
