import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpg_flutter/application.dart';
import 'package:rpg_flutter/banco/comandos.dart';
import 'package:rpg_flutter/dados/habilidades.dart';
import 'package:rpg_flutter/objetos/habilidades.dart';
import 'package:rpg_flutter/objetos/perso.dart';

class PersonagemMenu extends StatefulWidget {
  final Perso _perso;
  PersonagemMenu(this._perso) : super();
  @override
  _PersonagemMenuState createState() => _PersonagemMenuState(_perso);
}

class _PersonagemMenuState extends State<PersonagemMenu> {
  _PersonagemMenuState(this._perso) : super() {
    _pontosExp = _perso.pontosExp;
    _pontosHab = _perso.pontosHab;
    _perso.clearExtraStatus();
  }

  int _selectPage = 0, _selectHab = 0;
  late Perso _perso;
  List<Habilidades> _listHabilidades = HabilidadesDados().getHabilidades();
  late int _pontosExp, _pontosHab;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personagem " + _perso.getNome),
        ),
        body: _body(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Text(
                "Status",
                style: TextStyle(color: _selectPage == 0 ? Colors.amber : null),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Text(
                "Habilidades",
                style: TextStyle(color: _selectPage == 1 ? Colors.amber : null),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Text(
                "Magias",
                style: TextStyle(color: _selectPage == 2 ? Colors.amber : null),
              ),
              label: "",
            ),
          ],
          currentIndex: _selectPage,
          onTap: (int index) {
            setState(() {
              _selectPage = index;
            });
          },
          selectedItemColor: Colors.amber,
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        elevatedButtonOfList(
          "Voltar",
          () {
            _perso.clearExtraStatus();
            Navigator.pop(context);
          },
          color: Colors.grey,
          textColor: Colors.black,
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      child: Text(_perso.getNome),
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
                          Text(_perso.getExperiencia.toString() +
                              "/" +
                              _perso.getExpMax().toString()),
                          Text(_perso.getVida.toString() +
                              "/" +
                              _perso.getVidaMax.toString())
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
                              value: _perso.getExperiencia / _perso.getExpMax(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4),
                            margin: EdgeInsets.only(right: 10),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.black,
                              minHeight: 10,
                              valueColor: AlwaysStoppedAnimation(Colors.red),
                              value: _perso.getVida / _perso.getVidaMax,
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
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: Text(
                          "Level: " + _perso.getLevel.toString(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: Text(
                          "Classe: " + _perso.classe!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: Text(
                          "Pontos: " +
                              (_selectPage == 0 ? _pontosExp : _pontosHab)
                                  .toString(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 10,
                  color: Colors.black,
                  thickness: 1,
                ),
                Expanded(
                  flex: 1,
                  child: _selectPage == 0 ? _status() : _habilidades(),
                ),
              ],
            )),
      ],
    );
  }

  Widget _status() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10, left: 2, top: 2),
                      child: Row(
                          children: _pointsButtons(
                              "Atk: " + _perso.getAtk.toString(), () {
                        if (_pontosExp == 0) {
                          _perso.getExtraStatus!.setAtk =
                              _perso.getExtraStatus!.getAtk + 1;
                          // _pontosExp--;
                          setState(() {});
                        }
                      }, () {
                        if (_perso.getExtraStatus!.getAtk != 0) {
                          _perso.getExtraStatus!.setAtk =
                              _perso.getExtraStatus!.getAtk - 1;
                          _pontosExp++;
                          setState(() {});
                        }
                      }, _perso.getExtraStatus!.getAtk.toString())),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, left: 2, top: 2),
                      child: Row(
                          children: _pointsButtons(
                              "Def: " + _perso.getDef.toString(), () {
                        if (_pontosExp != 0) {
                          _perso.getExtraStatus!.setDef =
                              _perso.getExtraStatus!.getDef + 1;
                          _pontosExp--;
                          setState(() {});
                        }
                      }, () {
                        if (_perso.getExtraStatus!.getDef != 0) {
                          _perso.getExtraStatus!.setDef =
                              _perso.getExtraStatus!.getDef - 1;
                          _pontosExp++;
                          setState(() {});
                        }
                      }, _perso.getExtraStatus!.getDef.toString())),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, left: 2, top: 2),
                      child: Row(
                          children: _pointsButtons(
                              "Agi: " + _perso.getAgi.toString(), () {
                        if (_pontosExp != 0) {
                          _perso.getExtraStatus!.setAgi =
                              _perso.getExtraStatus!.getAgi + 1;
                          _pontosExp--;
                          setState(() {});
                        }
                      }, () {
                        if (_perso.getExtraStatus!.getAgi != 0) {
                          _perso.getExtraStatus!.setAgi =
                              _perso.getExtraStatus!.getAgi - 1;
                          _pontosExp++;
                          setState(() {});
                        }
                      }, _perso.getExtraStatus!.getAgi.toString())),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, left: 2, top: 2),
                      child: Row(
                        children: _pointsButtons(
                            "Int: " + _perso.getIntl.toString(), () {
                          if (_pontosExp != 0) {
                            _perso.getExtraStatus!.setIntl =
                                _perso.getExtraStatus!.getIntl + 1;
                            _pontosExp--;
                            setState(() {});
                          }
                        }, () {
                          if (_perso.getExtraStatus!.getIntl != 0) {
                            _perso.getExtraStatus!.setIntl =
                                _perso.getExtraStatus!.getIntl - 1;
                            _pontosExp++;
                            setState(() {});
                          }
                        }, _perso.getExtraStatus!.getIntl.toString()),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10, left: 2, top: 2),
                      child: Row(
                        children: _pointsButtons(
                            "AtkM: " + _perso.getAtkM.toString(), () {
                          if (_pontosExp != 0) {
                            _perso.getExtraStatus!.setAtkM =
                                _perso.getExtraStatus!.getAtkM + 1;
                            _pontosExp--;
                            setState(() {});
                          }
                        }, () {
                          if (_perso.getExtraStatus!.getAtkM != 0) {
                            _perso.getExtraStatus!.setAtkM =
                                _perso.getExtraStatus!.getAtkM - 1;
                            _pontosExp++;
                            setState(() {});
                          }
                        }, _perso.getExtraStatus!.getAtkM.toString()),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, left: 2, top: 2),
                      child: Row(
                          children: _pointsButtons(
                              "DefM: " + _perso.getDefM.toString(), () {
                        if (_pontosExp != 0) {
                          _perso.getExtraStatus!.setDefM =
                              _perso.getExtraStatus!.getDefM + 1;
                          _pontosExp--;
                          setState(() {});
                        }
                      }, () {
                        if (_perso.getExtraStatus!.getDefM != 0) {
                          _perso.getExtraStatus!.setDefM =
                              _perso.getExtraStatus!.getDefM - 1;
                          _pontosExp++;
                          setState(() {});
                        }
                      }, _perso.getExtraStatus!.getDefM.toString())),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, left: 2, top: 2),
                      child: Row(
                        children: [
                          Text(
                            "Mp: " +
                                _perso.getMp.toString() +
                                "/" +
                                _perso.getmpMax.toString(),
                            textScaleFactor: 1.5,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, left: 2, top: 2),
                      child: Row(
                        children: _pointsButtons(
                            "Vit: " + _perso.getVit.toString(), () {
                          if (_pontosExp != 0) {
                            _perso.getExtraStatus!.setVit =
                                _perso.getExtraStatus!.getVit + 1;
                            _pontosExp--;
                            setState(() {});
                          }
                        }, () {
                          if (_perso.getExtraStatus!.getVit != 0) {
                            _perso.getExtraStatus!.setVit =
                                _perso.getExtraStatus!.getVit - 1;
                            _pontosExp++;
                            setState(() {});
                          }
                        }, _perso.getExtraStatus!.getVit.toString()),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: elevatedButtonOfList(
            "Salvar",
            () {
              _perso.pontosExp = _pontosExp;
              _perso.increment(_perso.getExtraStatus!);
              _perso.clearExtraStatus();
              Comandos().atulizarPerso(_perso.toMap(), _perso.getId!);
              setState(() {});
            },
          ),
        )
      ],
    );
    // ],
    // );
  }

  List<Widget> _pointsButtons(String text, void Function() bntAdd,
      void Function() bntRemove, String pontosUse) {
    return [
      Expanded(
        flex: 7,
        child: Text(
          text,
          textScaleFactor: 1.5,
        ),
      ),
      Expanded(
        flex: 4,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: SizedBox(
            width: 30,
            height: 25,
            child: ElevatedButton(
              onPressed: bntAdd,
              child: Icon(Icons.add),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Text(
          pontosUse,
          textScaleFactor: 1.5,
          textAlign: TextAlign.center,
        ),
      ),
      Expanded(
        flex: 4,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: SizedBox(
            width: 30,
            height: 25,
            child: ElevatedButton(
              onPressed: bntRemove,
              child: Icon(Icons.remove),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
            ),
          ),
        ),
      ),
    ];
  }

  Widget _habilidades() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: Text(
            _listHabilidades[_selectHab].getNome,
            textAlign: TextAlign.center,
          ),
        ),
        Divider(
          height: 10,
          color: Colors.black,
          thickness: 1,
        ),
        Container(
          width: double.infinity,
          height: 50,
          child: SingleChildScrollView(
            child: Text(
              _listHabilidades[_selectHab].getDescricao()!,
            ),
          ),
        ),
        Divider(
          height: 10,
          color: Colors.black,
          thickness: 1,
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: _listHabilidades.length,
            itemBuilder: (BuildContext context, int index) {
              List<Widget> text = [
                Expanded(
                  flex: 1,
                  child: Text(
                    _listHabilidades[index].toString(),
                  ),
                )
              ];
              for (Habilidades hab in _perso.getHabilidades!) {
                if (hab.getId == _listHabilidades[index].getId) {
                  text.add(Expanded(
                    flex: 1,
                    child: Text(
                      "Adiquirida",
                      textDirection: TextDirection.rtl,
                    ),
                  ));
                  break;
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        _selectHab = index;
                        setState(() {});
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: text,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black,
                    thickness: 1,
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                for (Habilidades hab in _perso.getHabilidades!) {
                  if (hab.getId == _listHabilidades[_selectHab].getId) {
                    _alert("Habilidade",
                        text: "Você já possue essa habilidade.");
                    return null;
                  }
                }

                if (_listHabilidades[_selectHab].getPontos()! >
                    _perso.pontosHab) {
                  // _alert("Pontos", text: "Pontos insuficientes.");
                  // return null;
                }
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Aprender Habilidade"),
                      content: Text("Você Deseja Aprender " +
                          _listHabilidades[_selectHab].getNome +
                          "por " +
                          _listHabilidades[_selectHab].getPontos().toString() +
                          " pontos."),
                      actions: [
                        TextButton(
                          child: Text("Aprender"),
                          onPressed: () {
                            _perso.getHabilidades!
                                .add(_listHabilidades[_selectHab]);
                            Map<String, dynamic> hab =
                                _listHabilidades[_selectHab].toMapToBanco();
                            hab["perso_id"] = _perso.getId;
                            Comandos().inserirHabilidadesPerso(hab);
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                        ),
                        TextButton(
                          child: Text("Cancelar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Apreder"),
            ),
          ),
        )
      ],
    );
  }

  void _alert(String title,
      {String text: "",
      Widget? content,
      List<Widget>? actions,
      bool barrierDismissible: true}) {
    if (content == null) {
      content = Text(text);
    }

    showDialog(
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
