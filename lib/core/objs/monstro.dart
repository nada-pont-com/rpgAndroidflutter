import 'package:rpg_flutter/core/data/classes/monstro.dart';
import 'package:rpg_flutter/core/objs/servivo.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Monstro extends Servivo {
  Monstro({Status? status}) : super(classe: MonstroClass(), status: status);

  @override
  void ataque(Servivo alvo) {
    super.ataque(alvo);
  }
}
