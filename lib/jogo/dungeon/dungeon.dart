import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/application.dart';
import 'package:inicio/objetos/dungeon.dart';

class Dungeon extends StatefulWidget {
  final DungeonTable _dungeon;

  Dungeon(this._dungeon) : super();

  @override
  _DungeonState createState() => _DungeonState(_dungeon);
}

class _DungeonState extends State<Dungeon> {
  DungeonTable _dungeon;

  _DungeonState(this._dungeon) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: _body(),
        ));
  }

  Widget _body() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: raisedButtonOfList(
                  "ESQUERDA",
                  () {},
                  color: Colors.grey,
                  textColor: Colors.black,
                ),
              ),
              Expanded(
                flex: 2,
                child: raisedButtonOfList(
                  "FRENTE",
                  () {},
                  color: Colors.grey,
                  textColor: Colors.black,
                ),
              ),
              Expanded(
                flex: 2,
                child: raisedButtonOfList(
                  "Direita",
                  () {},
                  color: Colors.grey,
                  textColor: Colors.black,
                ),
              ),
              Expanded(
                flex: 2,
                child: raisedButtonOfList(
                  "Subir",
                  () {},
                  color: Colors.grey,
                  textColor: Colors.black,
                ),
              ),
              Expanded(
                flex: 2,
                child: raisedButtonOfList(
                  "Descer",
                  () {},
                  color: Colors.grey,
                  textColor: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
