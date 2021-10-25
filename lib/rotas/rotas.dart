import 'package:flutter/material.dart';
import 'package:rpg_andriod/home/home.dart';
import 'package:rpg_andriod/jogo/batalha/battle.dart';
import 'package:rpg_andriod/jogo/dungeon/dungeon.dart';
import 'package:rpg_andriod/jogo/guilda/guilda.dart';
import 'package:rpg_andriod/jogo/inicio/continuar.dart';
import 'package:rpg_andriod/jogo/inicio/jogo.dart';
import 'package:rpg_andriod/jogo/inicio/novo_jogo.dart';
import 'package:rpg_andriod/jogo/inicio/personagem_menu.dart';
import 'package:rpg_andriod/jogo/itens/itens.dart';

class Rotas {
  static Map<String, Widget Function(BuildContext)> rotas = {
    '/': (context) => const TelaInicio(),
    '/novo': (context) => const NovoJogo(),
    '/continuar': (context) => const Continuar(),
    '/jogo': (context) => const Jogo(),
    '/jogo/persoMenu': (context) => const PersonagemMenu(),
    '/jogo/batalha': (context) => const Battle(),
    '/jogo/dungeon': (context) => const Dungeon(),
    '/jogo/guild': (context) => const Guilda(),
    'jogo/itens': (context) => const Itens(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {}
}
