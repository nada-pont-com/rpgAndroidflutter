import 'package:rpg_flutter/core/data/arma/arco.dart';
import 'package:rpg_flutter/core/data/arma/armas.dart';
import 'package:rpg_flutter/core/data/arma/espada.dart';
import 'package:rpg_flutter/core/data/arma/faca.dart';
import 'package:rpg_flutter/core/data/arma/lanca.dart';
import 'package:rpg_flutter/core/objs/classe.dart';
import 'package:rpg_flutter/core/objs/item.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Aventureiro implements Classe {
  @override
  Status status = Status(
    hp: 70,
    atk: 5,
    def: 3,
    agi: 5,
    sp: 6,
    res: 2,
  );

  @override
  List<Type> tipoArmas = [Espada, Faca, Lanca, Arco];

  @override
  List<Item> itensBase = [Armas().getArma(3)];
}
