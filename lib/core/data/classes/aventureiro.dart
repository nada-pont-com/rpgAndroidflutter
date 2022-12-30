import 'package:rpg_flutter/core/objs/classe.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Aventureiro extends Classe {
  static Status base = Status(
    hp: 70,
    atk: 5,
    def: 3,
    agi: 5,
    sp: 6,
    res: 2,
  );

  Aventureiro() : super(base);
}
