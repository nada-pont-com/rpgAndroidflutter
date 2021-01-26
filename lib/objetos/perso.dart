import 'dart:math';

import 'package:inicio/objetos/ser_vivo.dart';
import 'package:inicio/objetos/status.dart';

class Perso extends SerVivo {
  int _pontosExp = 0;
  int _pontosHab = 0;
  int _loadId;
  String _classe;
  int _rankExp = 0;

  Perso() : super();

  Perso.status({
    int vida = 0,
    int vidaMax = 0,
    int mp = 0,
    int mpMax = 0,
    int atk = 0,
    int def = 0,
    int agi = 0,
    int atkM = 0,
    int defM = 0,
    int intl = 0,
    int vit = 0,
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
        ) {
    extraStatus = Status();
  }

  Perso.map(Map<String, dynamic> perso) : super.map(perso) {
    id = perso['id'];
    _pontosHab = perso['pontosHab'];
    _pontosExp = perso['pontosExp'];
    _loadId = perso['load_id'];
    _classe = perso['classe'];
    _rankExp = perso['rankExp'];
    extraStatus = Status();
  }

  int get pontosExp => _pontosExp;
  set pontosExp(pontosExp) => this._pontosExp = pontosExp;

  int get pontosHab => _pontosHab;
  set pontosHab(pontosHab) => this._pontosHab = pontosHab;

  int get loadId => _loadId;
  set loadId(loadId) => this._loadId = loadId;

  String get classe => _classe;
  set classe(classe) => this._classe = classe;

  int get rankExp => _rankExp;
  set rankExp(rankExp) => this._rankExp = rankExp;

  int getExpMax() {
    double i = pow(2, (level.toDouble() - 1)); //potencia 2^(level-1)
    double d = pow(1.5, (level.toDouble())); //potencia 1.5^level
    return ((100 * i) ~/ d);
  }

  void updateExperiencia(int experiencia) {
    int expMax = getExpMax();
    while (experiencia >= expMax) {
      expMax = getExpMax();
      experiencia = (experiencia - expMax);
      this.level++;
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
    }
    this.experiencia = experiencia;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> persoMap = {
      "id": id,
      "classe": _classe,
      "load_id": _loadId,
      "pontosExp": _pontosExp,
      "pontosHab": _pontosHab,
      "rankExp": _rankExp,
    };
    persoMap.addAll(super.toMap());
    return persoMap;
  }
}
