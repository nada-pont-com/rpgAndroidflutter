import 'package:rpg_flutter/core/objs/status.dart';

abstract class Habilidade {
  Habilidade({Status? status}) {
    _status = status ?? Status();
  }

  late Status _status;
}
