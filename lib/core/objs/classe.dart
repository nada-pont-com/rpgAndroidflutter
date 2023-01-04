import 'package:rpg_flutter/core/objs/status.dart';

abstract class Classe {
  Classe(this.status, this.tipoArmas);

  Status status;
  List<Type> tipoArmas;
}
