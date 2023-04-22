import 'package:rpg_flutter/core/objs/base.dart';
import 'package:rpg_flutter/core/objs/item.dart';

enum Rank { S, A, B, C, D, E, F }

class Missao extends Base {
  Missao({
    required int id,
    this.pega = false,
    required this.rank,
    required String nome,
    required this.recompensa,
  }) : super(id: id, nome: nome);

  final Rank rank;
  final List<Item> recompensa;
  final bool pega;
}
