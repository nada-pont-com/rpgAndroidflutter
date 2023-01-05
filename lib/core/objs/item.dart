import 'package:rpg_flutter/core/objs/base.dart';

class Item implements Base {
  Item({required this.id, required this.nome});

  @override
  int id;

  @override
  String nome;
}
