import 'package:flutter/material.dart';
import 'package:rpg_flutter/view/registro/infos.dart';

class Registro extends StatefulWidget {
  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  int passo = 0;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            Infos(
              controller: controller,
            ),
            ElevatedButton(
              child: Text('continuar'),
              onPressed: () {
                passo++;
              },
            )
          ],
        ),
      ),
    );
  }
}
