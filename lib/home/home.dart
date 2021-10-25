import 'package:flutter/material.dart';
import 'package:rpg_andriod/banco/comandos.dart';
import 'package:rpg_andriod/objetos/item.dart';
import 'package:rpg_andriod/objetos/load.dart';

class TelaInicio extends StatelessWidget {
  const TelaInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Comandos().buscaLoad().then((loads) {
      for (Load load in loads) {
        if (load.getId == 1) {
          // TO DO montar tela de continuar
          load = Load.setInstance(id: load.getId, nome: load.getNome);
          Comandos().buscaItensLoad().then((itens) {
            for (Item element in itens) {
              print(element.toMap());
            }
            return load.atualizaItens(itens);
          });
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
      ),
      body: Container(
          alignment: Alignment.center,
          // color: Colors.red,
          // margin: EdgeInsets.all(100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 115,
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  child: const Text("Continuar"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(color: Colors.white)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/continuar');
                  },
                  // textColor: Colors.white,
                ),
              ),
              Container(
                width: 115,
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  child: const Text("Novo Jogo"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(color: Colors.white)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/novo/batalha');
                  },
                ),
              ),
            ],
          )),
    );
  }
}
