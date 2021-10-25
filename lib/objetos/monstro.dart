import 'package:rpg_andriod/objetos/habilidades.dart';
import 'package:rpg_andriod/objetos/ser_vivo.dart';

class Monstro extends SerVivo {
  List<dynamic>? _itens;

  static Monstro? _this;
  factory Monstro() {
    return _this ?? Monstro._getInstance();
  }

  static bool get isActive => _this == null;
  static void resetMonstro() => _this = null;

  Monstro._getInstance();
  void setInstance() => _this = this;

  Monstro.geraMostro(
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
    this.vida = vidaMax = vida;
    mpMax = this.mp = mp;
    this.atk = atk;
    this.def = def;
    this.agi = agi;
    this.atkM = atkM;
    this.defM = defM;
    this.level = level;
    this.nome = nome;
    experiencia = ex;
    _itens = item;
    this.habilidades = habilidades;
  }

  List<dynamic>? get itens => _itens;
}
