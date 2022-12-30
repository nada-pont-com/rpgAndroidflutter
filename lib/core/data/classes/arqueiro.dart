import 'package:rpg_flutter/core/objs/classe.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Arqueiro extends Classe {
  static Status base = Status(
    hp: 60,
    atk: 6,
    def: 2,
    agi: 9,
    sp: 4,
    res: 0,
  );

  Arqueiro() : super(base);
}
