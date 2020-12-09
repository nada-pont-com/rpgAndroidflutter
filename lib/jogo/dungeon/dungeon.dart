import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/application.dart';
import 'package:inicio/dados/monstros.dart';
import 'package:inicio/jogo/batalha/battle.dart';
import 'package:inicio/objetos/dungeon.dart';
import 'package:inicio/objetos/monstro.dart';
import 'package:inicio/objetos/perso.dart';

class Dungeon extends StatefulWidget {
  final DungeonTable _dungeon;

  Dungeon(this._dungeon) : super();

  @override
  _DungeonState createState() => _DungeonState(_dungeon);
}

class _DungeonState extends State<Dungeon> {
  DungeonTable _dungeon;
  Random _gerador = Random();
  int _passos = 0;
  int _andar;
  int _andarMax;
  String _nomeDungeon;
  String _rank;
  List<Perso> _dados;
  Monstro _monstro;

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
                  () {
                    _caminhos();
                    _geraMonstro();
                  },
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

  void _desceCaminho() {
    _passos++;
    if ((_gerador.nextInt(25) == 0) || (_passos == 100)) {
      _alert("Você avista uma descida a frente!", text: "Aviso!");
      // desce.setClickable(true);
      // desce.setAlpha(1);
      _boss();
    }
  }

  void _caminhos() {
    _passos++;
    switch (_gerador.nextInt(6)) {
      case 0: //Frente
        // frente.setClickable(true);
        // frente.setAlpha(1);
        // direita.setClickable(false);
        // direita.setAlpha(0.2f);
        // esquerda.setClickable(false);
        // esquerda.setAlpha(0.2f);
        break;
      case 1: //Direita
        // frente.setClickable(false);
        // frente.setAlpha(0.2f);
        // direita.setClickable(true);
        // direita.setAlpha(1);
        // esquerda.setClickable(false);
        // esquerda.setAlpha(0.2f);
        break;
      case 2: //Esquerda
        // frente.setClickable(false);
        // frente.setAlpha(0.2f);
        // direita.setClickable(false);
        // direita.setAlpha(0.2f);
        // esquerda.setClickable(true);
        // esquerda.setAlpha(1);
        break;
      case 3: //Frente/Direita
        // frente.setClickable(true);
        // frente.setAlpha(1);
        // direita.setClickable(true);
        // direita.setAlpha(1);
        // esquerda.setClickable(false);
        // esquerda.setAlpha(0.2f);
        break;
      case 4: //Frente/Esquerda
        // frente.setClickable(true);
        // frente.setAlpha(1);
        // direita.setClickable(false);
        // direita.setAlpha(0.2f);
        // esquerda.setClickable(true);
        // esquerda.setAlpha(0.2f);
        break;
      case 5: //Direita/Esquerda
        // frente.setClickable(false);
        // frente.setAlpha(0.2f);
        // direita.setClickable(true);
        // direita.setAlpha(1);
        // esquerda.setClickable(true);
        // esquerda.setAlpha(1);
        break;
    }
    _regHp();
  }

  void _regHp() {
    for (int i = 0; i < _dados.length; i++) {
      Perso dado = _dados[i];
      int vida = dado.getVida;
      int reg = dado.getVidaMax ~/ 100;

      print("Reg: " + reg.toString());
      dado.setVida = reg > vida ? vida : reg;
    }
  }

  void _geraMonstro() {
    int rand = _gerador.nextInt(100);
    if (rand < 10) {
      _invocarMonstro(1);
      // AlertDialog.Builder alert = new AlertDialog.Builder(this);
      // alert.setTitle("Aviso");
      // alert.setMessage("Você encontrou um "+monstro.getNome());
      // alert.setNeutralButton("Lutar", new DialogInterface.OnClickListener() {
      //     @Override
      //     public void onClick(DialogInterface dialog, int which) {
      //         batalha();
      //     }
      // }).setNegativeButton("Fugir", new DialogInterface.OnClickListener() {
      //     @Override
      //     public void onClick(DialogInterface dialog, int which) {
      //         int agiT = 0;
      //         for (int i = 0;i<_dados.size();i++ ){
      //             agiT+=  _dados.get(i).getAgi();
      //         }
      //         int agiM = agiT/_dados.size();

      //         int fuga = (agiM/Math.max(monstro.getAgi(),1))*100;
      //         int valor = _gerador.nextInt(100);
      //         System.out.println("valor: "+valor);
      //         System.out.println("Fuga: "+fuga);
      //         if(valor<=fuga){
      //             visualizar("Conseguiu fugir","Alerta");
      //         }else{
      //             visualizar("Falha ao tentar fugir fugir","Alerta");
      //             batalha();
      //         }
      //     }
      // });
      // alert.setCancelable(false);
      // alert.show();
    }
  }

  void _invocarMonstro(int tipo) {
    _monstro = Monstros().constroiMonstro(_rank, tipo, _andar, _andarMax);
  }

  void _boss() {
    if ((_gerador.nextInt(99) > 79) || (_passos == 100)) {
      //TODO colocar o boss no final do nome do monstro e alterar vida. adicionar jogo casual ou hard(3 vidas)
      _invocarMonstro(3);
      _alert("Aviso",
          text: "Você encontrou um Boss:" + _monstro.nome,
          actions: [
            FlatButton(
              child: Text("Lutar"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Battle(_monstro)));
              },
            ),
          ]);
    }
  }

  _alert(String title,
      {String text: "",
      Widget content,
      List<Widget> actions,
      bool barrierDismissible: true}) {
    if (content == null) {
      content = Text(text);
    }

    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: actions,
        );
      },
    );
  }
}
