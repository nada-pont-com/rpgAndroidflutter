import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rpg_flutter/core/data/classes/arqueiro.dart';
import 'package:rpg_flutter/core/data/classes/aventureiro.dart';
import 'package:rpg_flutter/core/data/classes/guerreiro.dart';
import 'package:rpg_flutter/core/objs/classe.dart';
import 'package:rpg_flutter/core/utilitis/scroll.dart';

class ClasseVw extends StatefulWidget {
  @override
  State<ClasseVw> createState() => _ClasseVwState();
}

class _ClasseVwState extends State<ClasseVw> {
  List<Classe> classes = [Aventureiro(), Guerreiro(), Arqueiro()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return LayoutBuilder(builder: (context, box) {
              return ModalListClasses(
                box: box,
                index: index,
                itens: classes,
                update: updateClasse,
              );
            });
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Text("Classe: ${classes[index].runtimeType}"),
      ),
    );
  }

  updateClasse(int index) {
    setState(() {
      this.index = index;
    });
  }
}

class ModalListClasses extends StatelessWidget {
  const ModalListClasses({
    Key? key,
    required this.box,
    required this.itens,
    required this.index,
    required this.update,
  }) : super(key: key);

  final BoxConstraints box;
  final void Function(int) update;
  final List<Classe> itens;
  final int index;

  @override
  Widget build(BuildContext context) {
    int count = itens.length;

    ScrollController controller = ScrollController(
      initialScrollOffset: (box.maxWidth / 100 * 75) * index,
    );

    return Center(
      child: SizedBox(
        height: min(box.maxHeight * 0.5, 200),
        child: ListView.builder(
          controller: controller,
          itemCount: count + 2,
          physics: PagingScrollPhysics(
            itemDimension: box.maxWidth / 100 * 75,
          ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (c, i) {
            if (i == 0 || i == count + 1) {
              return SizedBox(
                width: box.maxWidth / 100 * 12.5,
                height: 10,
              );
            }
            return GestureDetector(
              onTap: () {
                update(i - 1);
                Navigator.pop(context);
                // TODO Corrigir problema de click depois de rodar a lista.
              },
              child: ModalClasse(
                box: box,
                classe: itens[i - 1],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ModalClasse extends StatelessWidget {
  const ModalClasse({
    Key? key,
    required this.box,
    required this.classe,
  }) : super(key: key);

  final BoxConstraints box;
  final Classe classe;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: box.maxHeight / 100 * 75,
      maxWidth: box.maxWidth / 100 * 75,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(classe.runtimeType.toString()),
                  ),

                  linhaStatus(
                    'Hp ${classe.status.hp}',
                    'Res ${classe.status.res}',
                  ),
                  linhaStatus(
                    'Atk ${classe.status.atk}',
                    'Def ${classe.status.def}',
                  ),
                  linhaStatus(
                    'Agi ${classe.status.agi}',
                    '',
                  ),
                  // 'SP ${classe.status.sp}'
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget linhaStatus(String status1, String status2) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 70,
          child: Text(status1),
        ),
        SizedBox(
          width: 70,
          child: Text(status2),
        ),
      ],
    );
  }
}
