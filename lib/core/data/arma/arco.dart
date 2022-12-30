import 'package:rpg_flutter/core/objs/arma.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Arco extends Arma {
  Arco({required Status status, required String nome, required int id})
      : super(
          status,
          distancia: 'longe',
          tipo: 'arco',
          nome: nome,
          id: id,
        );
}
