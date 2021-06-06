import 'dart:math';

import 'package:inicio/application.dart';
import 'package:inicio/dados/itens.dart';
import 'package:inicio/objetos/habilidades.dart';
import 'package:inicio/objetos/monstro.dart';
import 'package:inicio/objetos/status.dart';

class Monstros {
  Map<String, List<Map<String, dynamic>>> _monstros = {
    "G": [
      {
        "nome": "Slime",
        "exp": 5,
        "level": 1,
        "rank": "G",
        "itens": [
          {
            "min": 1,
            "max": 3,
            "item": Itens().geraItemByName("GOSMA"),
          },
          {
            "min": 0,
            "max": 1,
            "item": Itens().geraItemByName("Poção_HP_P"),
          },
          {
            "min": 0,
            "max": 1,
            "item": Itens().geraItemByName("Poção_MP_P"),
          }
        ],
        "status": Status(
          vida: 25,
          atk: 2,
          def: 9,
          agi: 1,
          atkM: 0,
          defM: 1,
          intl: 0,
          mp: 5,
        ),
      },
      {
        "nome": "Esqueleto",
        "exp": 10,
        "level": 3,
        "rank": "G",
        "itens": [
          {
            "min": 1,
            "max": 3,
            "item": Itens().geraItemByName("OSSO"),
          },
          {
            "min": 0,
            "max": 1,
            "item": Itens().geraItemByName("Poção_HP_P"),
          },
          {
            "min": 0,
            "max": 1,
            "item": Itens().geraItemByName("Poção_MP_P"),
          }
        ],
        "status": Status(
          vida: 75,
          atk: 10,
          def: 4,
          agi: 5,
          atkM: 0,
          defM: 0,
          mp: 5,
        ),
      },
      {
        "nome": "Lobo de baixo rank",
        "exp": 12,
        "level": 5,
        "rank": "G",
        "itens": [
          {
            "min": 1,
            "max": 2,
            "item": Itens().geraItemByName("CARNE_C"),
          },
          {
            "min": 0,
            "max": 1,
            "item": Itens().geraItemByName("Poção_HP_P"),
          },
          {
            "min": 0,
            "max": 1,
            "item": Itens().geraItemByName("Poção_MP_P"),
          }
        ],
        "status": Status(
          vida: 100,
          atk: 15,
          def: 7,
          agi: 20,
          atkM: 5,
          defM: 7,
          mp: 15,
        ),
      },
    ],
    "F": [
      {
        "nome": "Golem de Pedra",
        "exp": 24,
        "level": 10,
        "rank": "F",
        "itens": [
          {
            "min": 1,
            "max": 2,
            "item": Itens().geraItemByName("FERRO"),
          },
          {
            "min": 0,
            "max": 1,
            "item": Itens().geraItemByName("Poção_HP_P"),
          },
          {
            "min": 0,
            "max": 1,
            "item": Itens().geraItemByName("Poção_MP_P"),
          }
        ],
        "status": Status(
          vida: 175,
          atk: 10,
          def: 24,
          agi: 5,
          atkM: 0,
          defM: 0,
          mp: 15,
        ),
      },
    ],
  };

  int quantMonstros() {
    int cont = 0;
    for (String key in _monstros.keys) {
      cont += _monstros[key].length;
    }
    return cont;
  }

  Map getMonstro(String rank, int andar, int andarMax) {
    Random random = Random();
    double valor = double.parse((convertRank(rankS: rank) + 1).toString());
    valor = valor / andarMax;
    valor = valor * andar;

    int valorInt = valor.toInt();
    valorInt = min(valorInt, 8);

    String rank2 = convertRank(rankInt: valorInt);

    int rand = random.nextInt(_monstros[rank2].length);
    int level = _monstros[rank2][rand]['level'];

    if (level > persos[0].getLevel) {
      return getMonstro(rank, andar, andarMax);
    }

    return _monstros[rank2][rand];
  }

  Map getMonstroByIdRank(int id, String rank) {
    if (_monstros[rank] != null && _monstros[rank].length < id)
      return _monstros[rank][id];
    return null;
  }

  Monstro constroiMonstro(String rank, int tipo, andar, andarMax, {int id}) {
    double valor;
    int valorInt;
    Random random = Random();

    Map monstroMap = id == null ? getMonstroByIdRank(id, rank) : null;

    if (monstroMap == null) monstroMap = getMonstro(rank, andar, andarMax);

    rank = monstroMap["rank"];
    Status statusBase = monstroMap["status"];
    int vida = statusBase.getVida;
    int mp = statusBase.getMp;
    int atk = statusBase.getAtk;
    int atkM = statusBase.getAtkM;
    int agi = statusBase.getAgi;
    int def = statusBase.getDef;
    int defM = statusBase.getDefM;
    int level = (((random.nextInt(1) == 0) ? -1 : 1) * (random.nextInt(2))) +
        persos[0].getLevel;

    // double modLevel = ((level) - 1) / 10;

    double status = 1;
    status *= _mod();
    double mod3 = 1;
    switch (tipo) {
      case 2: // alfa
        mod3 = 2;
        break;
      case 3: // boss
        print("boss");
        mod3 = (random.nextInt(4) + 4).toDouble(); // 4x a 7x
        double valorMin = 1;
        double valorMax = 3.5;
        double valorF = valorMax - valorMin;
        valor = valorF;
        valor = valor / andarMax;
        valor = valor * andar;
        valorInt = valor.toInt();
        if (valorInt == 0) {
          valorF = valorMax;
        } else {
          valorF = valorF / valor;
        }
        mod3 = mod3 / valorF;
        print(mod3);
        print(andar);
        break;
    }
    status *= mod3;

    double ex = (monstroMap["exp"] * status + monstroMap["exp"]);

    return Monstro(
      rank,
      (vida + vida * status).toInt(),
      (mp + mp * status / 2).toInt(),
      (atk + atk * status).toInt(),
      (def + def * status).toInt(),
      (agi + agi * status).toInt(),
      (atkM + atkM * status).toInt(),
      (defM + defM * status).toInt(),
      level,
      monstroMap["nome"],
      ex.toInt(),
      monstroMap["itens"],
      <Habilidades>[],
    );
  }

  String getNomeMonstroByIdRank(String rank, int id) {
    return _monstros[rank][id]['nome'];
  }

  double _mod() {
    Random random = new Random();
    double mod = random.nextDouble() + random.nextInt(1); //{1.5,0.5,1,2};
    if (mod < 0.4) {
      return _mod();
    } else {
      return mod;
    }
  }
}
