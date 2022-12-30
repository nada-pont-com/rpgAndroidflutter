import 'package:flutter/material.dart';

class Classe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('data'),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                child: Icon(Icons.arrow_back_ios_rounded),
              ),
              Positioned(
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),
              // conteudo
              Text('desc'),
              Text('attr'),
              Text('Hab'),
            ],
          ),
        )
      ],
    );
  }
}
