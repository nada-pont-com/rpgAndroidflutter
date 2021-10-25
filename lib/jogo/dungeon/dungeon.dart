import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpg_andriod/application.dart';
import 'package:rpg_andriod/dados/monstros.dart';
import 'package:rpg_andriod/objetos/dungeon.dart';
import 'package:rpg_andriod/objetos/load.dart';
import 'package:rpg_andriod/objetos/monstro.dart';
import 'package:rpg_andriod/objetos/perso.dart';

class Dungeon extends StatefulWidget {
  // final DungeonTable _dungeon = ;

  const Dungeon({Key? key}) : super(key: key);

  @override
  _DungeonState createState() => _DungeonState();
}

class _DungeonState extends State<Dungeon> {
  final DungeonTable _dungeon = DungeonTable();
  final Random _gerador = Random();
  late int _passos = 0;
  late int andar;
  late int _andarMax;
  late int _andarAtual;
  // String _nomeDungeon;
  late String _rank;
  final List<Perso> _dados = Load.getInstance.persos;
  Monstro? _monstro;
  late BuildContext _context;
  bool descer = true;
  Map<String, bool> caminhos = {
    "Esquerda": false,
    "Direita": false,
    "Descer": false,
    "Frente": true,
  };

  _DungeonState() : super();

  @override
  Widget build(BuildContext context) {
    _context = context;
    _rank = _dungeon.rank!;
    _andarAtual = andar = int.parse(_dungeon.andares!.split("-")[0]);
    _andarMax = int.parse(_dungeon.andares!.split("-")[1]);
    // _nomeDungeon = _dungeon.getNome;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dungeon"),
          ),
          body: _body(),
        ));
  }

  _caminhar() {
    _caminhos();
    _desceCaminho();
    _geraMonstro();
  }

  Widget _body() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: elevatedButtonOfList(
                "Esquerda",
                (caminhos["Esquerda"]! ? _caminhar : null),
                color: Colors.grey,
                textColor: Colors.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: elevatedButtonOfList(
                "Frente",
                (caminhos["Frente"]! ? _caminhar : null),
                color: Colors.grey,
                textColor: Colors.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: elevatedButtonOfList(
                "Direita",
                (caminhos["Direita"]! ? _caminhar : null),
                color: Colors.grey,
                textColor: Colors.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: elevatedButtonOfList(
                "Subir",
                () {
                  Navigator.pop(context);
                },
                color: Colors.grey,
                textColor: Colors.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: elevatedButtonOfList(
                "Descer",
                (descer ? _descer : null),
                color: Colors.grey,
                textColor: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }

  void _descer() {
    descer = true;
    _andarAtual++;
    if (_andarAtual % 10 == 0) {
      _boss();
    } else {
      _invocarMonstro(3);
      _alertMonstro();
    }
  }

  void _desceCaminho() {
    if ((_gerador.nextInt(25) == 0) || (_passos == 100)) {
      _alert("Aviso!", text: "Você avista uma descida a frente!");
      descer = true;
    }
  }

  void _caminhos() {
    _passos++;
    switch (_gerador.nextInt(6)) {
      case 0: //Frente
        for (String key in caminhos.keys) {
          caminhos[key] = false;
          if (key == "Frente") caminhos[key] = true;
        }
        break;
      case 1: //Direita
        for (String key in caminhos.keys) {
          caminhos[key] = false;
          if (key == "Direita") caminhos[key] = true;
        }
        break;
      case 2: //Esquerda
        for (String key in caminhos.keys) {
          caminhos[key] = false;
          if (key == "Esquerda") caminhos[key] = true;
        }
        break;
      case 3: //Frente/Direita
        for (String key in caminhos.keys) {
          caminhos[key] = false;
          if (key == "Frente" || key == "Direita") caminhos[key] = true;
        }
        break;
      case 4: //Frente/Esquerda
        for (String key in caminhos.keys) {
          caminhos[key] = false;
          if (key == "Frente" || key == "Esquerda") caminhos[key] = true;
        }
        break;
      case 5: //Direita/Esquerda
        for (String key in caminhos.keys) {
          caminhos[key] = false;
          if (key == "Direita" || key == "Esquerda") caminhos[key] = true;
        }
        break;
    }
    _regHp();
  }

  void _regHp() {
    for (int i = 0; i < _dados.length; i++) {
      Perso dado = _dados[i];
      int vida = dado.getVidaReal;
      int reg = dado.getVidaMax ~/ 100;
      // print("Reg: " + reg.toString());
      dado.setVida = dado.getVidaMax == dado.getVida ? vida : reg + vida;
    }
    setState(() {});
  }

  void _geraMonstro() {
    int rand = _gerador.nextInt(100);
    if (rand < 10) {
      _invocarMonstro(3);
      _alertMonstro();
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

  void _alertMonstro() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Aviso"),
          content: Text("Você encontrou um " + _monstro!.getNome),
          actions: [
            TextButton(
              child: const Text("Lutar"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(_context, '/jogo/batalha');
              },
            ),
            TextButton(
              child: const Text("Fugir"),
              onPressed: () {
                int agiT = 0;
                for (int i = 0; i < _dados.length; i++) {
                  agiT += _dados[i].getAgi;
                }
                int agiM = agiT ~/ _dados.length;

                int fuga = ((agiM / max(_monstro!.getAgi, 1)) * 100).toInt();
                int valor = _gerador.nextInt(100);
                if (valor <= fuga) {
                  // _alert("Alerta", text: "Conseguiu fugir");
                  Navigator.of(context).pop();
                } else {
                  _alert("Alerta", text: "Falha ao tentar fugir");
                  Navigator.of(context).pop();
                  Navigator.pushNamed(_context, '/jogo/batalha');
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _invocarMonstro(int tipo) {
    _monstro = Monstros().constroiMonstro(_rank, tipo, _andarAtual, _andarMax)
      ..setInstance();
  }

  void _boss() {
    if ((_gerador.nextInt(99) > 79) || (_passos == 100)) {
      //TOD colocar o boss no final do nome do monstro e alterar vida. adicionar jogo casual ou hard(3 vidas)
      _invocarMonstro(3);
      _alert("Aviso",
          text: "Você encontrou um Boss:" + _monstro!.getNome,
          barrierDismissible: false,
          actions: [
            TextButton(
              child: const Text("Lutar"),
              onPressed: () {
                Navigator.pushNamed(context, '/jogo/batalha');
              },
            ),
          ]);
    }
  }

  _alert(String title,
      {String text = "",
      Widget? content,
      List<Widget>? actions,
      bool barrierDismissible = true}) {
    content ??= Text(text);

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
