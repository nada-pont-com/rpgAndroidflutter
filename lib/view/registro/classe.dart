import 'package:flutter/material.dart';
import 'package:rpg_flutter/core/data/classes/arqueiro.dart';
import 'package:rpg_flutter/core/data/classes/aventureiro.dart';
import 'package:rpg_flutter/core/data/classes/guerreiro.dart';
import 'package:rpg_flutter/core/objs/classe.dart';

class ClasseVw extends StatefulWidget {
  @override
  State<ClasseVw> createState() => _ClasseVwState();
}

class _ClasseVwState extends State<ClasseVw> {
  List<Classe> classes = [Aventureiro(), Guerreiro(), Arqueiro()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return Stack(
        children: [
          // conteudo
          Expanded(
            child: SizedBox(
              width: boxConstraints.maxWidth,
              child: Column(
                children: [
                  Text('data'),
                  Text(classes[index].runtimeType.toString()),
                  Text('attr'),
                  Text('Hab'),
                ],
              ),
            ),
          ),

          Positioned(
            top: boxConstraints.maxHeight / 2,
            left: 10,
            child: Center(
              child: index != 0
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          index -= 1;
                        });
                      },
                      child: Icon(Icons.arrow_back_ios_rounded),
                    )
                  : null,
            ),
          ),
          Positioned(
            top: boxConstraints.maxHeight / 2,
            right: 10,
            child: Center(
              child: index != classes.length - 1
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          index += 1;
                        });
                      },
                      child: Icon(Icons.arrow_forward_ios_rounded),
                    )
                  : null,
            ),
          ),
        ],
      );
    });
  }
}
