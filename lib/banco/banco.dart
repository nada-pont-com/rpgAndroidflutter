import 'package:rpg_andriod/application.dart';
import 'package:sqflite/sqflite.dart';

abstract class Banco {
  Database? _db;

  String get dbname;

  int get dbversion;

  Future<Database> init() async {
    if (_db == null) {
      String databasePach = await getDatabasesPath();
      String path = databasePach + dbname;

      _db = await openDatabase(path, version: dbversion,
          onCreate: (Database db, int version) async {
        //Cria as tabelas
        for (var sql in tablesCriat) {
          db.execute(sql);
        }
      });
      // await _db.execute("DROP TABLE perso");
      // await _db.execute("DROP TABLE load;");

      for (var sql in tablesCriat) {
        _db!.execute(sql);
      }
    }
    return _db!;
  }

  Future<Database> getDb() async {
    return await init();
  }

  void close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }
}
