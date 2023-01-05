import 'package:rpg_flutter/core/objs/arma.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Lanca implements Arma {
  Lanca({required this.status, required this.nome, required this.id});

  @override
  String distancia = 'medio';

  @override
  int id;

  @override
  String nome;

  @override
  Status status;

  @override
  String tipo = 'lanca';
}
