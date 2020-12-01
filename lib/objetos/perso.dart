import 'dart:math';

import 'package:inicio/objetos/status.dart';

class Perso extends Status {
  int _id;
  String _nome;
  int _level = 1;
  int _experiencia = 0;
  int _pontosExp = 0;
  int _pontosHab = 0;
  int _loadId;
  String _classe;
  String _rank = "G";
  int _rankExp = 0;

  Perso();

  Perso.status({
    int vida,
    int vidaMax,
    int mp,
    int mpMax,
    int atk,
    int def,
    int agi,
    int atkM,
    int defM,
    int intl,
    int vit,
  }) : super(
          vida: vida,
          vidaMax: vidaMax,
          mp: mp,
          mpMax: mpMax,
          atk: atk,
          def: def,
          agi: agi,
          atkM: atkM,
          defM: defM,
          intl: intl,
          vit: vit,
        );

  Perso.map(Map<String, dynamic> perso) : super.map(perso) {
    _nome = perso['nome'];
    _id = perso['id'];
    _level = perso['level'];
    _experiencia = perso['experiencia'];
    _pontosHab = perso['pontosHab'];
    _pontosExp = perso['pontosExp'];
    _loadId = perso['load_id'];
    _classe = perso['classe'];
    _rank = perso['rank'];
    _rankExp = perso['rankExp'];
  }

  int get id => _id;
  set id(id) => this._id = id;

  String get nome => _nome;
  set nome(nome) => this._nome = nome;

  int get level => _level;
  set level(level) => this._level = level;

  int get experiencia => _experiencia;
  set experiencia(experiencia) => this._experiencia = experiencia;

  int get pontosExp => _pontosExp;
  set pontosExp(pontosExp) => this._pontosExp = pontosExp;

  int get pontosHab => _pontosHab;
  set pontosHab(pontosHab) => this._pontosHab = pontosHab;

  int get loadId => _loadId;
  set loadId(loadId) => this._loadId = loadId;

  String get classe => _classe;
  set classe(classe) => this._classe = classe;

  String get rank => _rank;
  set rank(rank) => this._rank = rank;

  int get rankExp => _rankExp;
  set rankExp(rankExp) => this._rankExp = rankExp;

  int getExpMax() {
    double i = pow(2, (level.toDouble() - 1)); //potencia 2^(level-1)
    double d = pow(1.5, (level.toDouble())); //potencia 1.5^level
    return ((100 * i) ~/ d);
  }

  void setExperiencia(int experiencia) {
    int expMax = getExpMax();
    while (experiencia >= expMax) {
      print(experiencia);
      expMax = getExpMax();
      experiencia = (experiencia - expMax);
      this._level++;
      this.pontosExp = this.pontosExp + 5;
      this.pontosHab = this.pontosHab + 2;
      this.vidaMax = (this.vidaMax * 1.25).toInt();
      this.vida = this.vidaMax;
      this.atk++;
      this.def++;
      this.atkM++;
      this.defM++;
      this.agi++;
      this.mp = this.mpMax = this.mpMax + 5;
      print(mp);
    }
    this.experiencia = experiencia;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> persoMap = {
      "id": _id,
      "nome": _nome,
      "classe": _classe,
      "experiencia": _experiencia,
      "level": _level,
      "load_id": _loadId,
      "pontosExp": _pontosExp,
      "pontosHab": _pontosHab,
      "rankExp": _rankExp,
      "rank": _rank,
    };
    persoMap.addAll(super.toMap());
    print(persoMap.toString());
    return persoMap;
  }
}
