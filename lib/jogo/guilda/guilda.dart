import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/objetos/missao.dart';

class Guilda extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Guilda();
}

class _Guilda extends State<Guilda> {
  int _aba = 0;
  List<Missao> _listMisao = <Missao>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Guilda",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: _body(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
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
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [],
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
      ),
    );
  }

  Widget _missoes() {
    return null;
  }

  Widget _persos() {
    return null;
  }
}
