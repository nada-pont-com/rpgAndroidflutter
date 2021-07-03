import 'dart:math';

import 'package:rpgandroid/application.dart';
import 'package:rpgandroid/banco/comandos.dart';
import 'package:rpgandroid/objetos/dungeon.dart';

class DungeonsDados {
  //TODO nomes novos de acordo com o rank; limitar monstros aos nomes; até 3 para o rank G, aumentar de acordo com o rank;
  Map<String, Map<String, dynamic>> _dungeons = {
    "G": {
      "id": 0,
      "nomes": ["Floresta Norte", "Scarlet", "cubias", "Dragonideos", "Planice"]
    },
    "F": {
      "id": 1,
      "nomes": ["Floresta Sombria"]
    },
  };

  List<String> _nome = [];
  List<String> _andares = [
    "25",
    "30",
    "40",
    "45",
    "55",
    "60",
    "80",
    "70",
    "90",
    "100"
  ];

  List<DungeonTable> listaDeDungeons = <DungeonTable>[];

  Comandos comandos = Comandos();

  static DungeonsDados _this;

  factory DungeonsDados() {
    if (_this == null) {
      _this = DungeonsDados.getInstance();
    }
    return _this;
  }

  DungeonsDados.getInstance() : super();

  List<String> getNome(String rank) {
    _geraNome(rank);
    return _nome;
  }

  List<DungeonTable> get getListaDeDungeons {
    atuDungeons();
    return listaDeDungeons;
  }

  void atuDungeons() {
    comandos.buscaDungeons().then((value) {
      listaDeDungeons = value;
    });
  }

  void geraDungeon(String rank, {bool missao = false}) {
    Random random = Random();
    int andar = random.nextInt(_andares.length);

    int vali;
    do {
      int randRank = random.nextInt(ranks.length);
      vali = 0;
      if (validaRank(rank, ranks[randRank])) {
        _geraNome(ranks[randRank]);
        int name = random.nextInt(_nome.length);
        DungeonTable dungeon = DungeonTable();

        dungeon.setNome = _nome[name];
        dungeon.setAndares = ("1-" + _andares[andar]);
        dungeon.setRank = ranks[randRank];
        listaDeDungeons.add(dungeon);

        if (!missao) {
          _salvaDungeon(dungeon);
        }
      } else {
        vali = 1;
      }
    } while (vali == 1);

    atuDungeons();
  }

  void _salvaDungeon(DungeonTable dungeon) {
    comandos.inserirDungeon(dungeon.toMap());
  }

  void _geraNome(String rank) {
    _nome = [];
    for (String key in _dungeons.keys) {
      _nome.addAll(_dungeons[key]["nomes"]);
      if (key == rank) {
        break;
      }
    }
  }
}
