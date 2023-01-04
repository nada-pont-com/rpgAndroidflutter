import 'package:rpg_flutter/core/objs/item.dart';
import 'package:rpg_flutter/core/objs/status.dart';

abstract class Arma extends Item {
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
