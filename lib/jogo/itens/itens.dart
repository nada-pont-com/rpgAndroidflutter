import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:rpg_andriod/banco/comandos.dart';
import 'package:rpg_andriod/objetos/item.dart';
import 'package:rpg_andriod/objetos/load.dart';

class Itens extends StatefulWidget {
  const Itens({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItensState();
}

class _ItensState extends State<Itens> {
  // Comandos _comandos = Comandos();
  final List<Item>? _itens = Load().itens;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Itens"),
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
    return ListView.builder(
      itemCount: (list == 0 && _itens!.isNotEmpty ? 1 : list),
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
              const Expanded(flex: 1, child: Text("")),
            );
          }
          cont++;
        }
        return Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: retorno,
          ),
        );
      },
    );
  }
}
