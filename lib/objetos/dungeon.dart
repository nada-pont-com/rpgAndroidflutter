import 'package:inicio/application.dart';

class DungeonTable {
  String _nome;
  String _andares;
  String _rank;

  DungeonTable();

  DungeonTable.map(Map<String, dynamic> dungeon) {
    _nome = dungeon["nome"];
    _andares = dungeon["andares"];
    _rank = dungeon["rank"];
  }

  String get getNome => _nome;

  set setNome(String nome) => this._nome = nome;

  String get getAndares => _andares;

  set setAndares(String andares) => this._andares = andares;

  String get getRank => _rank;

  set setRank(String rank) => this._rank = rank;

  Map<String, dynamic> toMap() => {
        "nome": _nome,
        "andares": _andares,
        "rank": _rank,
        "load_id": loadId,
      };

  @override
  String toString() {
    return "DungeonTable{" +
        "nome='" +
        _nome +
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
