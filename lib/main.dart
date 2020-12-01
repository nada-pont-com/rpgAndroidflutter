import 'package:flutter/material.dart';
import 'package:inicio/jogo/inicio/continuar.dart';
import 'package:inicio/jogo/inicio/novo_jogo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
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
    // Comandos().init();
    return Scaffold(
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
                child: RaisedButton(
                  child: Text("Continuar"),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Continuar()));
                  },
                  textColor: Colors.white,
                ),
              ),
              Container(
                width: 115,
                margin: EdgeInsets.all(5),
                child: RaisedButton(
                  child: Text("Novo Jogo"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NovoLoad()));
                  },
                ),
              ),
            ],
          )),
    );
  }
}
