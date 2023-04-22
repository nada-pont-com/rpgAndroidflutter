import 'package:rpg_flutter/core/objs/base.dart';
import 'package:rpg_flutter/core/objs/missao.dart';

class Guilda extends Base {
  Guilda({
    required int id,
    required String nome,
    required this.missoes,
  }) : super(id: id, nome: nome);

  final List<Missao> missoes;

  set addMissao(Missao missao) => missoes.add(missao);
}
