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
    Classe classe = classes[index];

    return LayoutBuilder(builder: (context, boxConstraints) {
      return Stack(
        children: [
          // conteudo
          SizedBox(
            width: boxConstraints.maxWidth,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('data'),
                  Text(classes[index].runtimeType.toString()),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text('Atk ${classe.status.atk}'),
                      ),
                      SizedBox(
                        width: 50,
                        child: Text('Def ${classe.status.def}'),
                      ),
                      SizedBox(
                        width: 50,
                        child: Text('Agi ${classe.status.agi}'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text('HP ${classe.status.hp}'),
                      ),
                      SizedBox(
                        width: 50,
                        child: Text('SP ${classe.status.sp}'),
                      ),
                      SizedBox(
                        width: 50,
                        child: Text('Res ${classe.status.res}'),
                      ),
                    ],
                  ),
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
