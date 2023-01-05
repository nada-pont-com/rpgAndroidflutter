import 'package:rpg_flutter/core/data/arma/espada.dart';
import 'package:rpg_flutter/core/data/arma/lanca.dart';
import 'package:rpg_flutter/core/objs/classe.dart';
import 'package:rpg_flutter/core/objs/item.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Guerreiro implements Classe {
  @override
  Status status = Status(
    hp: 90,
    atk: 7,
    def: 7,
    agi: 2,
    sp: 1,
    res: 1,
  );

  @override
  List<Item> itensBase = [];

  @override
  List<Type> tipoArmas = [Espada, Lanca];
}
