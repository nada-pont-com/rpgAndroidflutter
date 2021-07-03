import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpg_flutter/application.dart';
// import 'package:rpg_flutter/banco/comandos.dart';
import 'package:rpg_flutter/objetos/item.dart';

class Itens extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ItensState();
}

class _ItensState extends State<Itens> {
  // Comandos _comandos = Comandos();
  List<Item>? _itens = load!.itens;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Itens"),
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return _listItens();
  }

  Widget _listItens() {
    int list = _itens!.length ~/ 10;
    int cont = 0;
    return Container(
      child: ListView.builder(
        itemCount: (list == 0 && _itens!.length != 0 ? 1 : list),
        itemBuilder: (BuildContext context, int index) {
          List<Widget> retorno = [];
          for (int i = 0; i < 5; i++) {
            if (cont < _itens!.length) {
              retorno.add(Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(_itens![cont].getNome + ": "),
                    Text(
                      _itens![cont].quantidade.toString(),
                    ),
                  ],
                ),
              ));
            } else {
              retorno.add(
                Expanded(flex: 1, child: Text("")),
              );
            }
            cont++;
          }
          return Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: retorno,
            ),
          );
        },
      ),
    );
  }
}
