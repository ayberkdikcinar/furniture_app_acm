import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:furniture_app/core/base/base_database.dart';
import 'package:furniture_app/core/constants/service/service_contants.dart';
import 'package:furniture_app/view/product/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

class ProductDatabaseProvider extends BaseSqliteDB<Product> {
  final String _dbName = ServiceContants.DB_NAME;
  final String _tableName = ServiceContants.PRODUCT_TABLE_NAME;
  final int _version = ServiceContants.DB_VERSION;

  static ProductDatabaseProvider? _instance;
  static ProductDatabaseProvider? get instance {
    if (_instance != null) {
      return _instance;
    }
    _instance = ProductDatabaseProvider._init();
    return _instance;
  }

  ProductDatabaseProvider._init();
  @override
  Database? database;

  Future<void> initDb() async {
    var dbName = 'furnituredb.sql';
    var databasesPath = await getDatabasesPath();

    var path = join(databasesPath, dbName);
    var exists = await databaseExists(path);
    if (!exists) {
      debugPrint('Creating new copy from asset');
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      var data = await rootBundle.load(join('assets/database', dbName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      debugPrint('Opening existing database');
    }
    database = await openDatabase(path);
  }

  @override
  Future<void> open() async {
    database = await openDatabase(
      _dbName,
      version: _version,
      onCreate: (db, version) {
        createTable(db);
      },
    );
  }

  Future<void> createTable(Database db) async {
    await db.execute(
      '''CREATE TABLE $_tableName(
      id VARCHAR(20) PRIMARY KEY,
      title VARCHAR(50),
      image VARCHAR(100),
      description VARCHAR(100),
      price REAL,
      point REAL,
      categoryId VARCHAR(20))''',
    );
  }

  @override
  Future<List<Product>> getList() async {
    if (database != null) {
      List<Map<String, dynamic>> productMap = await database!.query(_tableName);
      return productMap.map((e) => Product().fromJson(e)).toList();
    }
    return [];
  }

  @override
  Future<void> delete(String id) async {
    await database?.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> insert(Product product) async {
    await database?.insert(_tableName, product.toJson());
  }

  @override
  Future<Product> getById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(String id) async {
    throw UnimplementedError();
  }
}
