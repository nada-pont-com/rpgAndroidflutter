import 'package:rpg_flutter/core/data/arma/arco.dart';
import 'package:rpg_flutter/core/data/arma/armas.dart';
import 'package:rpg_flutter/core/data/arma/espada.dart';
import 'package:rpg_flutter/core/data/arma/faca.dart';
import 'package:rpg_flutter/core/data/arma/lanca.dart';
import 'package:rpg_flutter/core/objs/classe.dart';
import 'package:rpg_flutter/core/objs/item.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class MonstroClass implements Classe {
  @override
  Status status = Status(
    hp: 20,
    atk: 1,
    def: 1,
    agi: 1,
    sp: 1,
    res: 1,
  );

  @override
  List<Type> tipoArmas = [Espada, Faca, Lanca, Arco];

  @override
  List<Item> itensBase = [];
}
