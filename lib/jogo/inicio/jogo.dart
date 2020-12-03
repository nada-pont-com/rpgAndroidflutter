import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/banco/comandos.dart';
import 'package:inicio/jogo/inicio/personagem_menu.dart';
import 'package:inicio/objetos/perso.dart';

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
      debugShowCheckedModeBanner: false,
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
        return ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PersonagemMenu()));
          },
          title: Container(
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
                    Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      child: Text(_persos[index].nome),
                    ),
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
                      flex: 2,
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
                          Container(
                            // color: Colors.blue,
                            padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
                            margin: EdgeInsets.only(right: 10),
                            child: LinearProgressIndicator(
                              // valueColor: Colors.red,
                              minHeight: 10,
                              backgroundColor: Colors.black,
                              valueColor: AlwaysStoppedAnimation(
                                  Colors.lightGreenAccent),
                              value: _persos[index].experiencia /
                                  _persos[index].getExpMax(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4),
                            margin: EdgeInsets.only(right: 10),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.black,
                              minHeight: 10,
                              valueColor: AlwaysStoppedAnimation(Colors.red),
                              value: _persos[index].getVida /
                                  _persos[index].getVidaMax,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 10,
                  color: Colors.black,
                  thickness: 1,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          child: Text(
                              "Level: " + _persos[index].level.toString())),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          child: Text("Classe: " + _persos[index].classe)),
                    ),
                  ],
                ),
                Divider(
                  height: 10,
                  color: Colors.black,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Atk: " + _persos[index].getAtk.toString(),
                              textScaleFactor: 1.5),
                          Text("Def: " + _persos[index].getDef.toString(),
                              textScaleFactor: 1.5),
                          Text("Agi: " + _persos[index].getAgi.toString(),
                              textScaleFactor: 1.5),
                          Text("Int: " + _persos[index].getIntl.toString(),
                              textScaleFactor: 1.5),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Atk: " + _persos[index].getAtk.toString(),
                              textScaleFactor: 1.5),
                          Text("Def: " + _persos[index].getDef.toString(),
                              textScaleFactor: 1.5),
                          Text("Agi: " + _persos[index].getAgi.toString(),
                              textScaleFactor: 1.5),
                          Text("Int: " + _persos[index].getIntl.toString(),
                              textScaleFactor: 1.5),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _raisedButtonOfList(
    String text,
    Function onPress, {
    Color color: Colors.blue,
    Color textColor: Colors.white,
  }) =>
      Container(
        margin: EdgeInsets.all(5),
        child: RaisedButton(
            color: color,
            textColor: textColor,
            child: Text(text),
            onPressed: onPress),
      );
}
