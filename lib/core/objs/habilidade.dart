import 'package:rpg_flutter/core/objs/servivo.dart';
import 'package:rpg_flutter/core/objs/status.dart';

abstract class Habilidade {
  Habilidade({Status? status}) {
    this.status = status ?? Status();
  }

  late Status status;

  void action(Servivo alvo) {}
}
