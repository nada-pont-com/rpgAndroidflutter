import 'package:flutter/cupertino.dart';

abstract class Objeto {
  @protected
  int id;
  @protected
  String nome = "";

  String get getNome => nome;
  set setNome(String nome) => this.nome = nome;

  int get getId => id;
  set setId(int id) => this.id = id;
}
