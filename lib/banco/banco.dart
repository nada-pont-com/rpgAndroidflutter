import 'package:rpgandroid/application.dart';
import 'package:sqflite/sqflite.dart';

abstract class Banco {
  Database _db;

  String get dbname;

  int get dbversion;

  Future<Database> init() async {
    if (this._db == null) {
      String databasePach = await getDatabasesPath();
      String path = databasePach + dbname;

      this._db = await openDatabase(path, version: dbversion,
          onCreate: (Database db, int version) async {
        //Cria as tabelas
        tablesCriat.forEach((String sql) {
          db.execute(sql);
        });
      });
      // await _db.execute("DROP TABLE perso");
      // await _db.execute("DROP TABLE load;");

      tablesCriat.forEach((String sql) {
        _db.execute(sql);
      });
    }
    return this._db;
  }

  Future<Database> getDb() async {
    return await this.init();
  }

  void close() async {
    if (this._db != null) {
      await this._db.close();
      this._db = null;
    }
  }
}
