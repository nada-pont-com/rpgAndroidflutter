import 'package:rpgandroid/objetos/habilidades.dart';
import 'package:rpgandroid/objetos/ser_vivo.dart';

class Monstro extends SerVivo {
  List<dynamic> _itens;

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
      List<dynamic> item,
      List<Habilidades> habilidades)
      : super(
          vida: vida,
          vidaMax: vida,
          mp: mp,
          mpMax: mp,
          atk: atk,
          def: def,
          agi: agi,
          atkM: atkM,
          defM: defM,
        ) {
    this.rank = rank;
    this.vida = this.vidaMax = vida;
    this.mpMax = this.mp = mp;
    this.atk = atk;
    this.def = def;
    this.agi = agi;
    this.atkM = atkM;
    this.defM = defM;
    this.level = level;
    this.nome = nome;
    this.experiencia = ex;
    this._itens = item;
    this.habilidades = habilidades;
  }

  List<dynamic> get itens => _itens;
}
