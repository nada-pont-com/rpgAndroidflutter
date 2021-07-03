import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpgandroid/application.dart';
import 'package:rpgandroid/banco/comandos.dart';
import 'package:rpgandroid/dados/dungeon_dados.dart';
import 'package:rpgandroid/jogo/dungeon/dungeon.dart';
import 'package:rpgandroid/jogo/guilda/guilda.dart';
import 'package:rpgandroid/jogo/inicio/personagem_menu.dart';
import 'package:rpgandroid/jogo/itens/itens.dart';
import 'package:rpgandroid/objetos/dungeon.dart';
import 'package:rpgandroid/objetos/perso.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  List<Perso> _persos = <Perso>[];
  List<DungeonTable> _dungeons = <DungeonTable>[];
  Comandos _comandos = Comandos();
  BuildContext _context;
  int _selectBar = 0, _refDunGuil = 0;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_selectBar == 0
              ? "Personagens"
              : (_selectBar == 1 ? "Work" : "Configurações")),
        ),
        body: _body(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.construction),
              label: "Trabalhos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Configs",
            ),
          ],
          onTap: (int index) {
            setState(() {
              _selectBar = index;
              _refDunGuil = 0;
            });
          },
          currentIndex: _selectBar,
          selectedItemColor: Colors.amber,
        ),
      ),
    );
  }

  Widget _body() {
    if (_selectBar == 0) {
      return _perso();
    } else {
      return _dungeonGuild();
    }
  }

  Widget _perso() {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              elevatedButtonOfList(
                "Voltar",
                () {
                  print(_context);
                  Navigator.pop(_context);
                },
                color: Colors.grey,
                textColor: Colors.black,
              )
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: FutureBuilder(
            future: _comandos.buscaPersos(),

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
                    persos = _persos;
                    _persos[0].toMap();
                    return _listPerso();
                  }
                  break;
              }
            },
          ),
        )
      ],
    );
  }

  _listPerso() {
    return ListView.builder(
      itemCount: _persos.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PersonagemMenu(_persos[index])));
          },
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      child: Text(_persos[index].getNome),
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
                          Text(_persos[index].getExperiencia.toString() +
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
                              value: _persos[index].getExperiencia /
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
                              "Level: " + _persos[index].getLevel.toString())),
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
                          Text("AtkM: " + _persos[index].getAtkM.toString(),
                              textScaleFactor: 1.5),
                          Text("DefM: " + _persos[index].getDefM.toString(),
                              textScaleFactor: 1.5),
                          Text("Agi: " + _persos[index].getMp.toString(),
                              textScaleFactor: 1.5),
                          Text("Vit: " + _persos[index].getVit.toString(),
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

  Widget _dungeonGuild() {
    if (_refDunGuil == 0) {
      return _buttonsGuildDung();
    } else if (_refDunGuil == 1) {
      return Text("data");
    } else {
      return _dungeon();
    }
  }

  Widget _buttonsGuildDung() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        elevatedButtonOfList(
          "Voltar",
          () {
            setState(() {
              _selectBar = 0;
            });
          },
          color: Colors.grey,
          textColor: Colors.black,
        ),
        Divider(
          color: Colors.black,
          height: 10,
          thickness: 2,
        ),
        elevatedButtonOfList(
          "Guilda",
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Guilda(),
              ),
            );
          },
          color: Colors.grey,
          textColor: Colors.black,
        ),
        elevatedButtonOfList(
          "Dungeon",
          () {
            setState(() {
              _refDunGuil = 2;
            });
          },
          color: Colors.grey,
          textColor: Colors.black,
        ),
        elevatedButtonOfList("Itens", () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Itens(),
            ),
          );
        }),
      ],
    );
  }

  Widget _dungeon() {
    return FutureBuilder(
      future: _comandos.buscaDungeons(),

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
              _dungeons = snapshot.data;
              // _persos[0].toMap();
              return _listDungeon();
            }
            break;
        }
      },
    );
  }

  Widget _listDungeon() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              elevatedButtonOfList(
                "Procurar",
                () {
                  setState(() {
                    DungeonsDados().geraDungeon(_persos[0].getRank);
                  });
                },
                color: Colors.grey,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: ListView.builder(
            itemCount: _dungeons.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dungeon(_dungeons[index])));
                    },
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child:
                              Text("Andares: " + _dungeons[index].getAndares),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(_dungeons[index].getNome),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 10,
                    thickness: 2,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
