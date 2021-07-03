import 'package:flutter/material.dart';
import 'package:rpg_flutter/application.dart';
// import 'package:rpg_flutter/application.dart';
import 'package:rpg_flutter/banco/comandos.dart';
// import 'package:rpg_flutter/jogo/rpgandroid/continuar.dart';
import 'package:rpg_flutter/jogo/inicio/jogo.dart';
import 'package:rpg_flutter/jogo/inicio/novo_jogo.dart';
import 'package:rpg_flutter/objetos/notificacao.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SingleNotifier>(
        create: (_) => SingleNotifier(),
      )
    ],
    child: MyApp(),
  ));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("aqui 2");
    return MaterialApp(
        title: 'RPG Android',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TelaInicio());
  }
}

class TelaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Comandos().buscaLoad().then((value) {
      value.forEach((item) {
        if (item.getId == loadId) {
          load = item;
          Comandos().buscaItensLoad().then((value) {
            value.forEach((element) {
              print(element.toMap());
            });
            return load!.atualizaItens(value);
          });
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
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
                margin: EdgeInsets.all(5),
                child: ElevatedButton(
                  child: Text("Continuar"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(color: Colors.white)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Jogo();
                    }));
                  },
                  // textColor: Colors.white,
                ),
              ),
              Container(
                width: 115,
                margin: EdgeInsets.all(5),
                child: ElevatedButton(
                  child: Text("Novo Jogo"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(color: Colors.white)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      print("teste");
                      return NovoLoad();
                    }));
                  },
                ),
              ),
            ],
          )),
    );
  }
}
