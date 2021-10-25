import 'package:rpg_andriod/objetos/load.dart';
import 'package:rpg_andriod/objetos/objeto.dart';

class DungeonTable extends Objeto {
  String? andares;
  String? rank;

  static DungeonTable? _this;

  factory DungeonTable() {
    return _this ?? DungeonTable._getInstance();
  }

  static bool get isActive => _this == null;
  static void resetDungeon() {
    _this = null;
  }

  DungeonTable._getInstance();
  void setInstance() {
    _this = this;
  }

  DungeonTable.map(Map<String, dynamic> dungeon) {
    nome = dungeon["nome"];
    andares = dungeon["andares"];
    rank = dungeon["rank"];
  }

  Map<String, dynamic> toMap() => {
        "nome": nome,
        "andares": andares,
        "rank": rank,
        "load_id": Load.getInstance.getId,
      };

  @override
  String toString() {
    return "DungeonTable{"
            "nome='" +
        nome +
        '\'' +
        ", andares='" +
        andares! +
        '\'' +
        ", rank='" +
        rank! +
        '\'' +
        '}';
  }
}
