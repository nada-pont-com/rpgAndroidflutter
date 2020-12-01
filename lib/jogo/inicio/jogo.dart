import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/banco/comandos.dart';
import 'package:inicio/objetos/perso.dart';
// import 'package:thizerlist/layout.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() {
    return _JogoState();
  }
}

class _JogoState extends State<Jogo> {
  List<Perso> _persos = List<Perso>();
  Comandos _comandos = Comandos();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return FutureBuilder(
      future: _comandos.buscaDados(),

      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: Text("Carregando"));
            break;
          default:
            if (snapshot.hasError) {
            } else {
              _persos = snapshot.data;
              _persos[0].toMap();
              return _list();
            }
            break;
        }
      },
    );
  }

  _list() {
    return ListView.builder(
      itemCount: _persos.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(
            children: [
              Row(
                children: [
                  _raisedButtonOfList(
                    "Voltar",
                    () {},
                    color: Colors.grey,
                    textColor: Colors.black,
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(flex: 3, child: Text(_persos[index].nome)),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text("Exp"),
                        Text("Vida"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(_persos[index].experiencia.toString() +
                            "/" +
                            _persos[index].getExpMax().toString()),
                        Text(_persos[index].getVida.toString() +
                            "/" +
                            _persos[index].getVidaMax.toString())
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          // valueColor: Colors.red,
                          value: _persos[index].experiencia /
                              _persos[index].getExpMax() *
                              100,
                        ),
                        LinearProgressIndicator(
                          value: _persos[index].getVida /
                              _persos[index].getVidaMax *
                              100,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Expanded _raisedButtonOfList(
    String text,
    Function onPress, {
    Color color: Colors.blue,
    Color textColor: Colors.white,
  }) =>
      Expanded(
        flex: 5,
        child: Container(
          margin: EdgeInsets.all(5),
          child: RaisedButton(
              color: color,
              textColor: textColor,
              child: Text(text),
              onPressed: onPress),
        ),
      );
}
