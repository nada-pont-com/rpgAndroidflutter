import 'package:inicio/objetos/status.dart';

class Monstro extends Status {
  String _rank;
  int _level;
  String _nome;
  int _ex;
  List<String> _itemQuant;
  // ItensDados[] itens;

  Monstro(
      String rank,
      int vida,
      int mp,
      int atk,
      int def,
      int agi,
      int atkM,
      int defM,
      int level,
      String nome,
      int ex,
      List<String> item /*,ItensDados[] itens*/) {
    this._rank = rank;
    this.vida = this.vidaMax = vida;
    this.mpMax = this.mp = mp;

    this.atk = atk;
    this.def = def;
    this.agi = agi;
    this.atkM = atkM;
    this.defM = defM;
    this._level = level;
    this._nome = nome;
    this._ex = ex;
    this._itemQuant = item; // (randon(max-min)) + min
    // this.itens = itens;
  }

  String get rank => _rank;

  set rank(String rank) => this._rank = rank;

  int get level => _level;

  set level(int level) => this._level = level;

  String get nome => _nome;

  set nome(String nome) => this._nome = nome;

  int get ex => _ex;

  List<String> get itemQuant => _itemQuant;

  // ItensDados[] getItens() {
  //     return itens;
  // }
}
