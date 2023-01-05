import 'package:rpg_flutter/core/objs/arma.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Arco implements Arma {
  Arco({required this.status, required this.nome, required this.id});

  @override
  String distancia = 'longe';

  @override
  int id;

  @override
  String nome;

  @override
  Status status;

  @override
  String tipo = 'arco';
}
