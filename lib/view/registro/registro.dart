import 'package:flutter/material.dart';
import 'package:rpg_flutter/view/registro/classe.dart';
import 'package:rpg_flutter/view/registro/infos.dart';

class Registro extends StatefulWidget {
  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  // int passo = 0;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  // late List<Widget?> vws = [nome(), classe()];

  body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                nome(),
                classe(),
              ],
            ),
          ),
          avancar(),
        ],
      ),
    );
  }

  nome() {
    return Infos(
      controller: controller,
    );
  }

  classe() {
    return ClasseVw();
  }

  avancar() {
    return ElevatedButton(
      onPressed: () => print("Ação"),
      child: Text("Avançar"),
    );
  }
}
