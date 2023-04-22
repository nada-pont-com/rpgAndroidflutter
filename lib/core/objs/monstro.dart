import 'package:rpg_flutter/core/data/classes/monstro.dart';
import 'package:rpg_flutter/core/objs/missao.dart';
import 'package:rpg_flutter/core/objs/servivo.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Monstro extends Servivo {
  Monstro({
    required this.rank,
    required this.nome,
    Status? status,
  }) : super(classe: MonstroClass(), status: status);

  final Rank rank;

  final String nome;

  @override
  void ataque(Servivo alvo) {
    super.ataque(alvo);
  }
}
