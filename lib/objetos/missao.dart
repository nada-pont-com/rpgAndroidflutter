import 'dart:math';

import 'package:rpgandroid/dados/dungeon_dados.dart';
import 'package:rpgandroid/dados/itens.dart';
import 'package:rpgandroid/dados/monstros.dart';
import 'package:rpgandroid/objetos/dungeon.dart';
import 'package:rpgandroid/objetos/item.dart';
import 'package:rpgandroid/objetos/monstro.dart';
import 'package:rpgandroid/objetos/objeto.dart';

class Missao extends Objeto {
  int _tipo; //salv
  Item _item; //id
  Monstro _monstro; //id
  DungeonTable _dungeon; //nome
  int _quant; //salv
  int _dificuldade;
  String _rank; //salv
  int _exp;

  int get tipo => _tipo;

  set tipo(int tipo) => this._tipo = tipo;

  Item get item => _item;

  set item(Item item) => this._item = item;

  get monstro => _monstro;

  set monstro(Monstro monstro) => this._monstro = monstro;

  get dungeon => _dungeon;

  set dungeon(DungeonTable dungeon) => this._dungeon = dungeon;

  get quant => _quant;

  set quant(int quant) => this._quant = quant;

  get dificuldade => _dificuldade;

  get rank => _rank;

  void setDificuldadeERank() {
    switch (_tipo) {
      case 1:
        _dificuldade = _quant * _converte(_item.raridade);
        _rank = _item.raridade;
        nome = "Encontrar " + _item.getNome;
        nome += "\nQuant:" +
            _quant.toString() +
            "  Rank:" +
            _rank +
            "  Dificuldade: " +
            _dificuldade.toString();
        break;
      case 2:
        _dificuldade = _quant * _converte(_monstro.getRank);
        _rank = _monstro.getRank;
        nome = "Matar " + _monstro.getNome;
        nome += "\nQuant:" +
            _quant.toString() +
            "  Rank:" +
            _rank +
            "  Dificuldade: " +
            _dificuldade.toString();
        break;
      case 3:
        _dificuldade = (_converte(_dungeon.getRank));
        _rank = _dungeon.getRank;
        nome = "Completar dungeon " + _dungeon.getNome;
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
        this._item = (Itens().geraItemById(itemId));
        break;
      case 2:
        _monstro.setRank = (rank);
        _monstro.setNome = (Monstros().getNomeMonstroByIdRank(rank, monstroId));
        break;
      case 3:
        _dungeon.setNome = (dungeonNome);
        _dungeon.setRank = (rank);
        break;
    }
  }

  Random random = new Random();

  Missao geraMissao() {
    int tipo = random.nextInt(3) + 1;
    int quant = -1;
    Missao missao = new Missao();
    List<String> rankMissao = ["G", "F", "E", "D", "C", "B", "A", "S"];
    String rank;
    bool vali;
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
          Item item = itens.geraItemById(id);

          if (item.raridade == (rank)) {
            quant = random.nextInt(10) + 1;
            missao.item = (item);
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
        DungeonTable dungeonTable = new DungeonTable();
        dungeonTable.setRank = (rank);
        valor = random.nextInt(dungeonNomes.length);
        dungeonTable.setNome = (dungeonNomes[valor]);
        missao.dungeon = (dungeonTable);
        break;
    }
    missao.tipo = (tipo);
    missao.quant = (quant);
    missao.setDificuldadeERank();
    // System.out.println("validando");
    return missao;
  }

  String toString() {
    return nome;
  }
}
