import 'package:rpg_flutter/core/objs/arma.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Espada implements Arma {
  Espada({required this.status, required this.nome, required this.id});

  @override
  String distancia = 'perto';

  @override
  int id;

  @override
  String nome;

  @override
  Status status;

  @override
  String tipo = 'espada';
}
