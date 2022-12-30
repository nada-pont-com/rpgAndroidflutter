import 'package:rpg_flutter/core/data/arma/espada.dart';
import 'package:rpg_flutter/core/objs/arma.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class ArmaDados {
  Map<int, Arma> dados = {
    1: Espada(
      id: 1,
      nome: 'Espada',
      status: Status(atk: 5),
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
  List<Arma> armas = [];

  Armas._init();

  factory Armas() {
    return _this;
  }
}
