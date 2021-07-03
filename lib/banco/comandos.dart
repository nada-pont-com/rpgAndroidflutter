import 'package:rpgandroid/banco/banco.dart';
import 'package:rpgandroid/application.dart';
import 'package:rpgandroid/dados/habilidades.dart';
import 'package:rpgandroid/dados/itens.dart';
import 'package:rpgandroid/objetos/dungeon.dart';
import 'package:rpgandroid/objetos/habilidades.dart';
import 'package:rpgandroid/objetos/item.dart';
import 'package:rpgandroid/objetos/load.dart';
import 'package:rpgandroid/objetos/perso.dart';
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

  Future<bool> atulizarPerso(Map<String, dynamic> values, int id) async {
    Database db = await this.getDb();
    db.update(
      "perso",
      values,
      where: "load_id=? AND id=?",
      whereArgs: [loadId, id],
    );
    return true;
  }

  Future<bool> inserirDungeon(Map<String, dynamic> values) async {
    Database db = await this.getDb();
    db.insert("dungeons_tem_loads", values);
    return true;
  }

  Future<bool> inserirItem(Map<String, dynamic> values) async {
    Database db = await this.getDb();
    db.insert("itens_perso", values);
    return true;
  }

  bool newItem(Map<String, dynamic> values) {
    buscaItem(values["id"]).then((value) {
      if (value.length == 0) {
        inserirItem(values);
      } else {
        atulizarItem({
          "quantidade": values["quantidade"] + value[0].quantidade,
        }, values["id"]);
      }
    });
    return true;
  }

  Future<bool> atulizarItem(Map<String, dynamic> values, int id) async {
    Database db = await this.getDb();
    db.update(
      "itens_perso",
      values,
      where: "load_id=? AND id=?",
      whereArgs: [loadId, id],
    );
    return true;
  }

  Future<bool> inserirHabilidadesPerso(Map<String, dynamic> values) async {
    Database db = await this.getDb();
    db.insert("perso_tem_habilidades", values);
    return true;
  }

  void buscaHabilidadesPerso(Perso perso) async {
    Database db = await this.getDb();
    List<Map<String, dynamic>> habsPersoDb = await db.query(
      "perso_tem_habilidades",
      where: "perso_id=?",
      whereArgs: [perso.getId],
    );
    List<Habilidades> habilidades = <Habilidades>[];
    habsPersoDb.forEach((Map<String, dynamic> habDb) {
      Habilidades hab = HabilidadesDados().getHabilidadeById(habDb["id"]);
      hab.level = habDb["level"];
      habilidades.add(hab);
    });
    perso.setHabilidades = habilidades;
  }

  Future<List<Item>> buscaItem(int id) async {
    Database db = await this.getDb();
    List<Map<String, dynamic>> itensBd = await db.query(
      "itens_perso",
      where: "load_id=? AND id=?",
      whereArgs: [loadId, id],
    );
    List<Item> itens = <Item>[];

    itensBd.forEach((Map<String, dynamic> itemDb) {
      Item item = Itens().geraItemById(itemDb["id"]);
      item.quantidade = itemDb["quantidade"];
      itens.add(item);
    });
    return itens;
  }

  Future<List<Item>> buscaItensLoad() async {
    Database db = await this.getDb();
    List<Map<String, dynamic>> itensBd = await db.query(
      "itens_perso",
      where: "load_id=?",
      whereArgs: [loadId],
    );
    List<Item> itens = <Item>[];

    itensBd.forEach((Map<String, dynamic> itemDb) {
      Item item = Itens().geraItemById(itemDb["id"]);
      item.quantidade = itemDb["quantidade"];
      itens.add(item);
    });
    return itens;
  }

  Future<List<DungeonTable>> buscaDungeons() async {
    Database db = await this.getDb();
    List<Map<String, dynamic>> dungeonsBd = await db.query(
      "dungeons_tem_loads",
      where: "load_id=?",
      whereArgs: [loadId],
    );
    List<DungeonTable> dungeons = <DungeonTable>[];

    dungeonsBd.forEach((Map<String, dynamic> dungeonDb) {
      dungeons.add(DungeonTable.map(dungeonDb));
    });
    return dungeons;
  }

  Future<List<Perso>> buscaPersos() async {
    Database db = await this.getDb();
    List<Map<String, dynamic>> persosDb =
        await db.query('perso', where: "load_id=?", whereArgs: [loadId]);
    print(persosDb);
    List<Perso> persos = <Perso>[];
    persosDb.forEach((Map<String, dynamic> persoDb) {
      Perso perso = Perso.map(persoDb);
      buscaHabilidadesPerso(perso);
      persos.add(perso);
    });

    return persos;
  }

  Future<List<Load>> buscaLoad() async {
    Database db = await this.getDb();
    List<Map<String, dynamic>> loadsDb = await db.query('load');
    // print(loadsDb.toString());
    List<Load> loads = <Load>[];
    loadsDb.forEach((Map<String, dynamic> loadDb) {
      Load load = Load(id: loadDb['id'], nome: loadDb['nome']);
      loads.add(load);
    });

    return loads;
  }
}
