import 'package:sqflite/sqflite.dart';

import 'base_model.dart';

abstract class BaseSqliteDB<T extends BaseModel> {
  Future<void> open();
  Future<List<T?>> getList();
  Future<void> delete(String id);
  Future<void> insert(T model);
  Future<void> update(String id);
  Future<T> getById(String id);
  Database? database;
}
