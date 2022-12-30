import 'package:flutter/material.dart';
import 'package:rpg_flutter/view/home.dart';
import 'package:rpg_flutter/view/registro/registro.dart';

class Routers {
  static Map<String, WidgetBuilder> routers = {
    '/': (context) => Home(),
    '/inicio': (context) => Home(),
    '/registro': (context) => Registro(),
    '/estatisticas': (context) => Home(),
    '/status': (context) => Home(),
    '/batalha': (context) => Home(),
    '/dungeon': (context) => Home(),
    '/guilda': (context) => Home(),
  };
}
