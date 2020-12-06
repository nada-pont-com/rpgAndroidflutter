import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonagemMenu extends StatefulWidget {
  @override
  _PersonagemMenuState createState() => _PersonagemMenuState();
}

class _PersonagemMenuState extends State<PersonagemMenu> {
  int _selectPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ola"),
          actions: [
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("ola"),
            )
          ],
        ),
        body: Text("ola Mundo"),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Text("Status"),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Text("Habilidades"),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Text("Magias"),
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
}
