// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpg_andriod/banco/comandos.dart';
import 'package:rpg_andriod/objetos/load.dart';

class Continuar extends StatefulWidget {
  const Continuar({Key? key}) : super(key: key);

  @override
  _ContinuarState createState() => _ContinuarState();
}

class _ContinuarState extends State<Continuar> {
  Comandos comandos = Comandos();
  List<Load> loads = <Load>[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _body(),
      ),
    );
  }

  _body() {
    comandos.buscaLoad().then((value) => print(value.toString()));
    return const Text("ola");
  }
}
