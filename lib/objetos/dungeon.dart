import 'package:rpgandroid/application.dart';
import 'package:rpgandroid/objetos/objeto.dart';

class DungeonTable extends Objeto {
  String _andares;
  String _rank;

  DungeonTable();

  DungeonTable.map(Map<String, dynamic> dungeon) {
    nome = dungeon["nome"];
    _andares = dungeon["andares"];
    _rank = dungeon["rank"];
  }

  String get getAndares => _andares;

  set setAndares(String andares) => this._andares = andares;

  String get getRank => _rank;

  set setRank(String rank) => this._rank = rank;

  Map<String, dynamic> toMap() => {
        "nome": nome,
        "andares": _andares,
        "rank": _rank,
        "load_id": loadId,
      };

  @override
  String toString() {
    return "DungeonTable{" +
        "nome='" +
        nome +
        '\'' +
        ", andares='" +
        _andares +
        '\'' +
        ", rank='" +
        _rank +
        '\'' +
        '}';
  }
}
