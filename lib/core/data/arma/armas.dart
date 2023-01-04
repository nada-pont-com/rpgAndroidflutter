import 'package:rpg_flutter/core/data/arma/arco.dart';
import 'package:rpg_flutter/core/data/arma/espada.dart';
import 'package:rpg_flutter/core/data/arma/faca.dart';
import 'package:rpg_flutter/core/data/arma/lanca.dart';
import 'package:rpg_flutter/core/objs/arma.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class _ArmaDados {
  Map<int, Arma> dados = {
    1: Espada(
      id: 1,
      nome: 'Espada',
      status: Status(atk: 5),
    ),
    2: Lanca(
      id: 1,
      nome: 'Lança',
      status: Status(atk: 3, agi: 1),
    ),
    3: Faca(
      id: 1,
      nome: 'Faca',
      status: Status(atk: 2, agi: 2),
    ),
    4: Arco(
      id: 1,
      nome: 'Arco',
      status: Status(atk: 7),
    ),
  };

  Arma? getArma(int id) {
    return dados[id];
  }

  List<Arma> getArmas() {
    return dados.values.toList();
  }
}

class Armas {
  static Armas _this = Armas._init();

  Armas._init();

  factory Armas() {
    return _this;
  }

  List<Arma> getArmas() {
    return _ArmaDados().getArmas();
  }

  Arma getArma(int id) {
    return _ArmaDados().getArma(id) ??
        Espada(
          id: -1,
          nome: 'Erro',
          status: Status(),
        );
  }
}
