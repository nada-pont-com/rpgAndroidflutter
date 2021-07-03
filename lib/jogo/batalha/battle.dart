import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_flutter/application.dart';
import 'package:rpg_flutter/banco/comandos.dart';
import 'package:rpg_flutter/objetos/habilidades.dart';
import 'package:rpg_flutter/objetos/item.dart';
import 'package:rpg_flutter/objetos/monstro.dart';
import 'package:rpg_flutter/objetos/notificacao.dart';
import 'package:rpg_flutter/objetos/perso.dart';

class Battle extends StatefulWidget {
  final Monstro _monstro;
  Battle(this._monstro) : super();

  @override
  _BattleState createState() => _BattleState(_monstro);
}

class _BattleState extends State<Battle> {
  _BattleState(this._monstro) : super();
  int _persoNumber = 0;
  late Monstro _monstro;
  Random random = Random();
  List<Perso> _persos = persos;
  List<String> listaAcoes = ["jose", "teste"];
  List<Habilidades>? listaHabilidadesPerso;
  List<Item> _listaDeItens = <Item>[];
  int nocalte = 0;
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Battle"),
        ),
        body: body(),
      ),
    );
  }

  int modo = -1;

  Widget body() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Text(_monstro.getNome),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Text("Lv:" + _monstro.getLevel.toString()),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Text("Hp: " +
                            _monstro.getVida.toString() +
                            "/" +
                            _monstro.getVidaMax.toString()),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          // color: Colors.blue,
                          padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
                          margin: EdgeInsets.only(right: 10),
                          child: LinearProgressIndicator(
                            // valueColor: Colors.red,
                            minHeight: 10,
                            backgroundColor: Colors.black,
                            valueColor: AlwaysStoppedAnimation(Colors.red),
                            value: _monstro.getVida / _monstro.getVidaMax,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Text("Mp: " +
                            _monstro.getMp.toString() +
                            "/" +
                            _monstro.getmpMax.toString()),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: EdgeInsets.only(top: 4),
                          margin: EdgeInsets.only(right: 10),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.black,
                            minHeight: 10,
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                            value: _monstro.getMp / _monstro.getmpMax,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 85,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              itemCount: listaAcoes.length,
              itemBuilder: (BuildContext contex, int index) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        listaAcoes[index],
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
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.lime,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                modo = 0;
                                if (_persoNumber == _persos.length) {
                                  _persoNumber = 0;
                                }
                                setState(() {});
                              },
                              child: Text("Atk"),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("Def"),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("Fugir"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  (modo == -1 ? Text("") : _acoes()),
                  Expanded(
                    flex: 8,
                    child: Container(
                      child: _listPerso(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _listPerso() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 5),
      itemCount: _persos.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: InkWell(
            onTap: () {
              print(_persos[index].toMap());
              // _persos.add(_persos[index]);
            },
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
                          // Text("Exp"),
                          Text("Vida"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          // Text(_persos[index].getExperiencia.toString() +
                          //     "/" +
                          //     _persos[index].getExpMax().toString()),
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
              ],
            ),
          ),
        );
      },
    );
  }

  _acoes() {
    if (modo == 0 /*atk*/) {
      return _atk();
    } else if (modo == 1 /*def*/) {}
  }

  _atk() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.red,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  modo = -1;
                  listaAcoes.replaceRange(
                      0,
                      0,
                      _persos[_persoNumber].atkInimigo(
                        _persos[_persoNumber],
                        _monstro,
                      ));
                  _monstroAtk();

                  setState(() {});
                },
                child: Text("atk"),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  modo = -1;
                },
                child: Text("atkM"),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  print(_persos[_persoNumber].getHabilidades.toString());
                  if (_persos[_persoNumber].getHabilidades!.length == 0) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Aviso!"),
                          content: Text("Não possue habilidades."),
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        var _singleNotifier =
                            Provider.of<SingleNotifier>(context);
                        return Container(
                          child: AlertDialog(
                            title: Text("Escolha"),
                            content: Container(
                              width: 100,
                              height: 100,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: _persos[_persoNumber]
                                      .getHabilidades!
                                      .map(
                                        (e) => RadioListTile<int>(
                                          title: Text(e.toString()),
                                          value: e.getId!,
                                          groupValue:
                                              _singleNotifier.currentIndex,
                                          selected:
                                              _singleNotifier.currentIndex ==
                                                  e.getId,
                                          onChanged: (value) {
                                            if (value !=
                                                _singleNotifier.currentIndex) {
                                              _singleNotifier
                                                  .updateCountry(value);
                                            }
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text("Usar"),
                                onPressed: () {
                                  modo = -1;
                                  Perso perso = _persos[_persoNumber];
                                  if (perso
                                          .getHabilidades![
                                              _singleNotifier.currentIndex]
                                          .getTipo ==
                                      2) {
                                    perso.useHabilidade(perso.getHabilidades![
                                        _singleNotifier.currentIndex]);
                                    print(perso.getExtraStatus!.toMap());
                                  } else
                                    listaAcoes.replaceRange(
                                      0,
                                      0,
                                      perso.atkInimigo(
                                        perso,
                                        _monstro,
                                        habilidade: perso.getHabilidades![
                                            _singleNotifier.currentIndex],
                                      ),
                                    );

                                  Navigator.of(context).pop();
                                  _monstroAtk();
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
                          ),
                        );
                      },
                    );
                  }
                },
                child: Text("hab"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _monstroAtk() {
    if (_monstro.isVivo()) {
      int hab = Random().nextInt(_monstro.getHabilidades!.length + 1);
      listaAcoes.replaceRange(
          0,
          0,
          _monstro.atkInimigo(
            _monstro,
            _persos[Random().nextInt(_persos.length)],
            habilidade: hab == _monstro.getHabilidades!.length
                ? null
                : _monstro.getHabilidades![hab],
          ));
    } else {
      _monsterMorto();
    }
  }

  void _monsterMorto() {
    int exp = _monstro.getExperiencia ~/ _persos.length;
    for (Perso perso in _persos) {
      perso.updateExperiencia(exp + perso.getExperiencia);
    }
    _monstroItens();
    _salvar();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Aviso!"),
          content: Text(_monstro.getNome +
              " derrotado(a) e ganhou " +
              _monstro.getExperiencia.toString() +
              " de Exp." +
              "\nDeseja continuar a jornada na Dongeon ou voltar para a superfice!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(_context, true);
              },
              child: Text("Continuar"),
            ),
            TextButton(
              child: Text("Voltar"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(_context, false);
              },
            )
          ],
        );
      },
    );
  }

  void _monstroItens() {
    for (Map item in _monstro.itens!) {
      int quant = (random.nextInt(item["max"]) + item["min"]).toInt();
      if (quant > 0) {
        Item itemDrop = item["item"];
        itemDrop.quantidade = (quant);
        _listaDeItens.add(itemDrop);
      }
    }
  }

  void _salvar() {
    Comandos comandos = Comandos();
    load!.atualizaItens(_listaDeItens);
    for (int i = 0; i < _listaDeItens.length; i++) {
      comandos.newItem(_listaDeItens[i].toMapBanco());
    }
    for (Perso perso in persos) {
      comandos.atulizarPerso(perso.toMap(), perso.getId!);
    }
  }
}
