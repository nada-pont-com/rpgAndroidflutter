import 'package:rpg_flutter/core/objs/arma.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Lanca extends Arma {
  Lanca({required Status status, required String nome, required int id})
      : super(
          status,
          distancia: 'medio',
          tipo: 'lança',
          nome: nome,
          id: id,
        );
}
