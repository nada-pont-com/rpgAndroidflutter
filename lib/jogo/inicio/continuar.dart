import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/banco/comandos.dart';
import 'package:inicio/objetos/load.dart';

class Continuar extends StatefulWidget {
  @override
  _ContinuarState createState() => _ContinuarState();
}

class _ContinuarState extends State<Continuar> {
  Comandos comandos = Comandos();
  List<Load> loads = List<Load>();
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
    return Text("ola");
  }
}
