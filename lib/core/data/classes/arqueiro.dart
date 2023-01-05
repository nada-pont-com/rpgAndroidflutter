import 'package:rpg_flutter/core/data/arma/arco.dart';
import 'package:rpg_flutter/core/objs/classe.dart';
import 'package:rpg_flutter/core/objs/item.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Arqueiro implements Classe {
  @override
  Status status = Status(
    hp: 60,
    atk: 6,
    def: 2,
    agi: 9,
    sp: 4,
    res: 0,
  );

  @override
  List<Type> tipoArmas = [Arco];

  @override
  List<Item> itensBase = [];
}
