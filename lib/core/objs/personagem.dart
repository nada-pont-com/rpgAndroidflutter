import 'package:rpg_flutter/core/objs/classe.dart';
import 'package:rpg_flutter/core/objs/habilidade.dart';
import 'package:rpg_flutter/core/objs/missao.dart';
import 'package:rpg_flutter/core/objs/servivo.dart';
import 'package:rpg_flutter/core/objs/status.dart';

class Personagem extends Servivo {
  Personagem({
    this.rank = Rank.F,
    required this.nome,
    Classe? classe,
    Status? status,
    List<Habilidade> habilidades = const [],
  }) : super(classe: classe, habilidades: habilidades, status: status);

  final String nome;

  final Rank rank;
}
