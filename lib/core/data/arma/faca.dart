import 'package:rpg_flutter/core/objs/arma.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Faca extends Arma {
  Faca({required Status status, required String nome, required int id})
      : super(
          status,
          distancia: 'perto',
          tipo: 'faca',
          nome: nome,
          id: id,
        );
}
