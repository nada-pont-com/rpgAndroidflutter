import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpg_andriod/application.dart';
import 'package:rpg_andriod/banco/comandos.dart';
import 'package:rpg_andriod/dados/dungeon_dados.dart';
import 'package:rpg_andriod/jogo/guilda/guilda.dart';
import 'package:rpg_andriod/jogo/itens/itens.dart';
import 'package:rpg_andriod/objetos/dungeon.dart';
import 'package:rpg_andriod/objetos/item.dart';
import 'package:rpg_andriod/objetos/load.dart';
import 'package:rpg_andriod/objetos/perso.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  List<Perso> _persos = <Perso>[];
  List<DungeonTable> _dungeons = <DungeonTable>[];
  final Comandos _comandos = Comandos();
  late BuildContext _context;
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
              : (_selectBar == 1
                  ? "Work"
                  : _selectBar == 2
                      ? "Informações"
                      : "Configurações")),
        ),
        body: _body(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.construction),
              label: "Trabalhos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "Infos",
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
          unselectedItemColor: Colors.black54,
        ),
      ),
    );
  }

  Widget _body() {
    if (_selectBar == 0) {
      return _perso();
    } else if (_selectBar == 1) {
      return _dungeonGuild();
    } else {
      return _info();
    }
  }

  Widget _perso() {
    return Column(
      children: [
        Row(
          children: [
            elevatedButtonOfList(
              "Voltar",
              () {
                // print(_context);
                Navigator.pop(_context);
              },
              color: Colors.grey,
              textColor: Colors.black,
            )
          ],
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
                  return const Center(child: Text("Carregando"));
                default:
                  if (snapshot.hasError) {
                    return const Center(child: Text("Erro"));
                  } else {
                    _persos = snapshot.data;
                    Load.getInstance.persos = _persos;
                    _persos[0].toMap();
                    return _listPerso();
                  }
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
            _persos[index].setInstance();
            Navigator.pushNamed(context, '/jogo/persoMenu')
                .then((value) => Perso.resetPerso());
          },
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: Text(_persos[index].getNome),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: const [
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
                          padding: const EdgeInsets.only(top: 2.5, bottom: 2.5),
                          margin: const EdgeInsets.only(right: 10),
                          child: LinearProgressIndicator(
                            // valueColor: Colors.red,
                            minHeight: 10,
                            backgroundColor: Colors.black,
                            valueColor: const AlwaysStoppedAnimation(
                                Colors.lightGreenAccent),
                            value: _persos[index].getExperiencia /
                                _persos[index].getExpMax(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 4),
                          margin: const EdgeInsets.only(right: 10),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.black,
                            minHeight: 10,
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.red),
                            value: _persos[index].getVida /
                                _persos[index].getVidaMax,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
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
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        child: Text(
                            "Level: " + _persos[index].getLevel.toString())),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        child: Text("Classe: " + _persos[index].classe!)),
                  ),
                ],
              ),
              const Divider(
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
        );
      },
    );
  }

  Widget _dungeonGuild() {
    if (_refDunGuil == 0) {
      return _buttonsGuildDung();
    } else if (_refDunGuil == 1) {
      return const Text("data");
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
        const Divider(
          color: Colors.black,
          height: 10,
          thickness: 2,
        ),
        elevatedButtonOfList(
          "Guilda",
          () {
            Navigator.pushNamed(context, 'jogo/guild');
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
          Navigator.pushNamed(context, 'jogo/itens');
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
            return const Center(child: Text("Carregando"));
          default:
            if (snapshot.hasError) {
              return const Center(child: Text("Erro"));
            } else {
              _dungeons = snapshot.data;
              // _persos[0].toMap();
              return _listDungeon();
            }
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
                  // print("aqui6");
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
                      Navigator.pushNamed(context, '/jogo/dungeon');
                    },
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text("Andares: " + _dungeons[index].andares!),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(_dungeons[index].getNome),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
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

  Widget _info() {
    // insertsItemFromLoad();
    Comandos comandos = Comandos();
    // comandos.buscaLoad().then((value) => {print(value)});
    if (series.isEmpty) {
      comandos.buscaItensLoad().then((value) => setState(() {
            itens = value;
          }));
    }
    _constroiSeriesToLine();
    _constroiSeriesToPie();

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  title: AxisTitle(text: "Ranks"),
                ),
                primaryYAxis: CategoryAxis(
                  title: AxisTitle(text: "Qtds"),
                ),
                // Chart title
                title: ChartTitle(text: 'Quant '),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: series,
              ),
              Expanded(
                child: SfCircularChart(
                  title: ChartTitle(text: 'Itens por rank'),
                  legend: Legend(isVisible: true),
                  series: seriesPie,
                ),
              )
            ],
          ),
        ),
        // ListView.builder(
        //     itemCount: _listMisao.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return Column(
        //         children: [],
        //       );
        //     })
      ],
    );
  }

  List<ChartSeries<Item, String>> series = <ChartSeries<Item, String>>[];
  List<PieSeries<Item, String>> seriesPie = <PieSeries<Item, String>>[];

  _constroiSeriesToLine() {
    // print(itens);
    series = [];
    for (Item item in itens) {
      List<Item> itensValidados = [item];

      series.add(
        LineSeries<Item, String>(
          yValueMapper: (Item item, int _) => item.quantidade,
          xValueMapper: (Item item, int _) => item.raridade,
          dataSource: itensValidados,
          name: item.getNome,
          markerSettings: const MarkerSettings(
            isVisible: true,
            shape: DataMarkerType.circle,
            borderWidth: 1,
          ),
          animationDuration: 0,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
        ),
      );
    }
  }

  List<Item> itens = <Item>[];

  _constroiSeriesToPie() {
    seriesPie = [];
    List<Item> itensValidados = [];
    for (var rank in ranks) {
      itensValidados.add(Item.item(raridade: rank));
      for (var item in itens) {
        if (item.raridade == rank) {
          itensValidados.last.quantidade += item.quantidade;
        }
      }
    }
    seriesPie.add(
      PieSeries<Item, String>(
        yValueMapper: (Item item, int _) => item.quantidade,
        xValueMapper: (Item item, int _) => item.raridade,
        dataSource: itensValidados,
        explode: true,
        explodeIndex: 0,
        dataLabelMapper: (Item item, _) =>
            item.raridade + ":" + item.quantidade.toString(),
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          showZeroValue: false,
        ),
        animationDuration: 1,
      ),
    );
  }
}
