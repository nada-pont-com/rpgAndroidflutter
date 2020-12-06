import 'package:inicio/banco/banco.dart';
import 'package:inicio/application.dart';
import 'package:inicio/objetos/dungeon.dart';
import 'package:inicio/objetos/load.dart';
import 'package:inicio/objetos/perso.dart';
import 'package:sqflite/sqflite.dart';

class Comandos extends Banco {
  @override
  int get dbversion => dbVersion;

  @override
  String get dbname => dbName;

  static Comandos _this;

  factory Comandos() {
    if (_this == null) {
      _this = Comandos.getInstance();
    }
    return _this;
  }

  Comandos.getInstance() : super();

  Future<bool> inserirLoad(Map<String, dynamic> values) async {
    Database db = await this.getDb();
    await db.insert("load", values);
    return true;
  }

  Future<bool> inserirPerso(Map<String, dynamic> values) async {
    Database db = await this.getDb();
    db.insert("perso", values);
    return true;
  }

  Future<bool> inserirDungeon(Map<String, dynamic> values) async {
    Database db = await this.getDb();
    db.insert("dungeons_tem_loads", values);
    return true;
  }

  Future<List<DungeonTable>> buscaDungeons() async {
    Database db = await this.getDb();
    List<Map<String, dynamic>> dungeonsBd = await db.query(
      "dungeons_tem_loads",
      where: "load_id=?",
      whereArgs: [loadId],
    );
    List<DungeonTable> dungeons = List<DungeonTable>();

    dungeonsBd.forEach((Map<String, dynamic> dungeonDb) {
      dungeons.add(DungeonTable.map(dungeonDb));
    });
    return dungeons;
  }

  Future<List<Perso>> buscaDados() async {
    Database db = await this.getDb();
    List<Map<String, dynamic>> persosDb =
        await db.query('perso', where: "load_id=?", whereArgs: [loadId]);
    List<Perso> persos = List<Perso>();
    persosDb.forEach((Map<String, dynamic> persoDb) {
      persos.add(Perso.map(persoDb));
    });

    return persos;
  }

  Future<List<Load>> buscaLoad() async {
    Database db = await this.getDb();
    List<Map<String, dynamic>> loadsDb = await db.query('load');
    print(loadsDb.toString());
    List<Load> loads = List<Load>();
    loadsDb.forEach((Map<String, dynamic> loadDb) {
      Load load = Load(id: loadDb['id'], nome: loadDb['nome']);
      loads.add(load);
    });

    return loads;
  }
}
