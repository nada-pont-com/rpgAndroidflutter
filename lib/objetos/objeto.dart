import 'package:flutter/cupertino.dart';

abstract class Objeto {
  @protected
  int? id = 0;
  @protected
  String nome = "";

  String get getNome => nome;
  set setNome(String nome) => this.nome = nome;

  int? get getId => id;
  set setId(int id) => this.id = id;

  String toString() => "id=" + id.toString() + ", nome=" + nome;
}
