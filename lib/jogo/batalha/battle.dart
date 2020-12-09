import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/objetos/monstro.dart';

class Battle extends StatefulWidget {
  Battle(Monstro monstro);
  @override
  _BattleState createState() => _BattleState();
}

class _BattleState extends State<Battle> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text("Ola"),
    );
  }
}
