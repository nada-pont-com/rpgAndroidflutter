import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:rpg_andriod/objetos/item.dart';
// import 'package:rpg_andriod/objetos/missao.dart';

class Guilda extends StatefulWidget {
  const Guilda({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Guilda();
}

class _Guilda extends State<Guilda> {
  int _aba = 0;
  // final List<Missao> _listMisao = <Missao>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Guilda",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: _body(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Recepção",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Missoes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Grupo",
            ),
          ],
          onTap: (int index) {
            setState(() {
              _aba = index;
            });
          },
          currentIndex: _aba,
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      child: _aba == 0
          ? _recepcao()
          : _aba == 1
              ? _missoes()
              : _persos(),
    );
  }

  Widget _recepcao() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: const [],
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

  Widget? _missoes() {
    return null;
  }

  Widget? _persos() {
    return null;
  }
}
