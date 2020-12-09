import 'dart:math';

import 'package:inicio/application.dart';
import 'package:inicio/objetos/monstro.dart';
import 'package:inicio/objetos/status.dart';

class Monstros {
  Map<String, List<Map<String, dynamic>>> _monstros = {
    "G": [
      {
        "nome": "Slime",
        "exp": "5",
        "level": 1,
        "rank": "G",
        "itens": [
          {
            "min": 1,
            "max": 3,
            "item": "Gosma",
          },
          {
            "min": 0,
            "max": 1,
            "item": "Poção HP P",
          },
          {
            "min": 0,
            "max": 1,
            "item": "Poção MP P",
          }
        ],
        "status": Status(
            vida: 25,
            agi: 1,
            atk: 2,
            atkM: 0,
            def: 9,
            defM: 1,
            intl: 2,
            mp: 5,
            mpMax: 5,
            vidaMax: 25),
      }
    ],
    "F": [{}],
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
    double valor = convertRank(rankS: rank) + 1;
    valor = valor / andarMax;
    valor = valor * andar;

    int valorInt = valor.toInt();
    valorInt = min(valorInt, 8);

    String rank2 = convertRank(rankInt: valorInt);

    int rand = random.nextInt(_monstros[rank2].length);
    int level = _monstros[rank2][rand]['level'];

    if (level > persos[0].level) {
      return getMonstro(rank, andar, andarMax);
    }

    return _monstros[rank2][rand];
  }

  Monstro constroiMonstro(String rank, int tipo, andar, andarMax) {
    double valor;
    int valorInt;
    Random random = Random();

    Map monstroMap = getMonstro(rank, andar, andarMax);

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
        persos[0].level;

    // double modLevel = ((level) - 1) / 10;

    double status = 1;
    status *= _mod();
    double mod3 = 1;
    switch (tipo) {
      case 2: // alfa
        mod3 = 2;
        break;
      case 3: // boss
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
        break;
    }
    int ex = (monstroMap["exp"] * status + monstroMap["exp"]);

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
      ex,
      monstroMap["itens"],
      /*monstroMap["itens"]*/
    );
  }

  double _mod() {
    Random random = new Random();
    double mod = random.nextDouble() + random.nextInt(1); //{1.5,0.5,1,2};
//        System.out.println("ola mundo: "+mod);
    if (mod < 0.4) {
      return _mod();
    } else {
      return mod;
    }
  }
}
