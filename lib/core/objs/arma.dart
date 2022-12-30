import 'package:rpg_flutter/core/objs/base.dart';
import 'package:rpg_flutter/core/objs/status.dart';

abstract class Arma extends Base {
  Arma(this.status,
      {required this.distancia,
      required this.tipo,
      required String nome,
      required int id})
      : super(id: id, nome: nome);

  Status status;

  String tipo;
  String distancia;
}
