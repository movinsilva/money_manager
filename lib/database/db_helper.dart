import 'dart:io';

import 'package:money_manager/data/pie_chart_data.dart';
import 'package:money_manager/model/account_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{

  static final _dbName = 'moneyManagerDb.db';
  static final _dbVersion = 1;


  //making a singleton class
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if(_database!=null) return _database!;

    _database = await _initiateDb();
    print('db initiated');
    return _database!;
  }

  _initiateDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }


  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $tableUser (
      ${AccountFields.name} TEXT PRIMARY KEY,
      ${AccountFields.nickName} TEXT NOT NULL,
      ${AccountFields.email} TEXT
      )
      '''
    );


  }

  Future<int> insert(AccountModel model, String tableName) async{
    Database db = await instance.database;
    print('value to be inserted ${model.toJson()}');
    return await db.insert(tableName, model.toJson());

  }

  Future<List<Map<String, dynamic>>> queryAll(String tableName) async {
    Database db = await instance.database;
    return await db.query(tableName);
  }

  Future update(Map<String, dynamic> row, String tableName, String where) async {
    Database db = await instance.database;
    String data = row[where];
    return await db.update(tableName, row,
        where: '$where = ? ',
        whereArgs: [data]);

  }

  Future delete(String name, String tableName, String where) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: '$where = ?', whereArgs: [name]);
  }

}