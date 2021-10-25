import 'dart:math';

import 'package:rpg_andriod/dados/dungeon_dados.dart';
import 'package:rpg_andriod/dados/itens.dart';
import 'package:rpg_andriod/dados/monstros.dart';
import 'package:rpg_andriod/objetos/dungeon.dart';
import 'package:rpg_andriod/objetos/item.dart';
import 'package:rpg_andriod/objetos/monstro.dart';
import 'package:rpg_andriod/objetos/objeto.dart';

class Missao extends Objeto {
  int? _tipo; //salv
  Item? _item; //id
  Monstro? monstro; //id
  DungeonTable? dungeon; //nome
  int? quant; //salv
  int? _dificuldade;
  String? _rank; //salv
  // int? _exp;

  // set tipo(int tipo) => _tipo = tipo;
  // set item(Item item) => _item = item;
  int get tipo => _tipo!;

  Item get item => _item!;

  int? get dificuldade => _dificuldade;

  String? get rank => _rank;

  void setDificuldadeERank() {
    switch (_tipo) {
      case 1:
        _dificuldade = quant! * _converte(_item!.raridade);
        _rank = _item!.raridade;
        nome = "Encontrar " + _item!.getNome;
        nome += "\nQuant:" +
            quant.toString() +
            "  Rank:" +
            _rank! +
            "  Dificuldade: " +
            _dificuldade.toString();
        break;
      case 2:
        _dificuldade = quant! * _converte(monstro!.getRank);
        _rank = monstro!.getRank;
        nome = "Matar " + monstro!.getNome;
        nome += "\nQuant:" +
            quant.toString() +
            "  Rank:" +
            _rank! +
            "  Dificuldade: " +
            _dificuldade.toString();
        break;
      case 3:
        _dificuldade = (_converte(dungeon!.rank!));
        _rank = dungeon!.rank!;
        nome = "Completar dungeon " + dungeon!.getNome;
        nome += "\nRank:" +
            _rank.toString() +
            "  Dificuldade: " +
            _dificuldade.toString();
        break;
    }
  }

  int _converte(String rank) {
    switch (rank) {
      case "S":
        return 10;
      case "A":
        return 9;
      case "B":
        return 7;
      case "C":
        return 5;
      case "D":
        return 4;
      case "E":
        return 3;
      case "F":
        return 2;
      case "G":
        return 1;
    }
    return 0;
  }

  void setDados(int itemId, int monstroId, String rank, String dungeonNome) {
    switch (_tipo) {
      case 1:
        _item = (Itens().geraItemById(itemId));
        break;
      case 2:
        monstro!.setRank = (rank);
        monstro!.setNome =
            (Monstros().getNomeMonstroByIdRank(rank, monstroId));
        break;
      case 3:
        dungeon!.setNome = (dungeonNome);
        dungeon!.rank = (rank);
        break;
    }
  }

  Random random = Random();

  Missao geraMissao() {
    int tipo = random.nextInt(3) + 1;
    int quant = -1;
    Missao missao = Missao();
    List<String> rankMissao = ["G", "F", "E", "D", "C", "B", "A", "S"];
    String rank;
    bool vali = true;
    do {
      int rankRand = random.nextInt(rankMissao.length);
      rank = rankMissao[rankRand];
      // vali = Sessao.getDadosPerso().get(0).validadorRank(rank);
    } while (!vali);
    // System.out.println("test tipo"+_tipo);
    switch (tipo) {
      case 1: // encontrar Item (drop de monstro)
        do {
          vali = true;
          Itens itens = Itens();
          int id = random.nextInt(itens.countItens);
          Item item = itens.geraItemById(id)!;

          if (item.raridade == (rank)) {
            quant = random.nextInt(10) + 1;
            missao._item = (item);
            vali = false;
          }
        } while (vali);
        break;
      case 2:
        int id = -1;
        quant = random.nextInt(10) + 1;

        missao.monstro = (Monstros().constroiMonstro(rank, 1, 0, 0, id: id));
        break;
      case 3:
        int valor;
        DungeonsDados dungeonDados = DungeonsDados();
        List<String> dungeonNomes = dungeonDados.getNome(rank);
        DungeonTable dungeonTable = DungeonTable();
        dungeonTable.rank = (rank);
        valor = random.nextInt(dungeonNomes.length);
        dungeonTable.setNome = (dungeonNomes[valor]);
        missao.dungeon = (dungeonTable);
        break;
    }
    missao._tipo = (tipo);
    missao.quant = (quant);
    missao.setDificuldadeERank();
    // System.out.println("validando");
    return missao;
  }

  @override
  String toString() {
    return nome;
  }
}
