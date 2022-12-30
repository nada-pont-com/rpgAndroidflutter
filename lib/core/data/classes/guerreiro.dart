import 'package:rpg_flutter/core/objs/classe.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Guerreiro extends Classe {
  static Status base = Status(
    hp: 90,
    atk: 7,
    def: 7,
    agi: 2,
    sp: 1,
    res: 1,
  );

  Guerreiro() : super(base);
}
