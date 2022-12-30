import 'package:rpg_flutter/core/objs/arma.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Espada extends Arma {
  Espada({required Status status, required String nome, required int id})
      : super(
          status,
          distancia: 'perto',
          tipo: 'espada',
          nome: nome,
          id: id,
        );
}
