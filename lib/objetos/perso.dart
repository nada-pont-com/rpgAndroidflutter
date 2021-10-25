import 'dart:math';

import 'package:rpg_andriod/objetos/load.dart';
import 'package:rpg_andriod/objetos/ser_vivo.dart';
import 'package:rpg_andriod/objetos/status.dart';

class Perso extends SerVivo {
  int pontosExp = 0;
  int pontosHab = 0;
  int? loadId = Load.isActive ? Load.getInstance.getId : null;
  String? classe;
  int rankExp = 0;

  static Perso? _this;
  factory Perso() {
    return _this ?? Perso._getInstance();
  }

  static bool get isActive => _this == null;
  static void resetPerso() => _this = null;

  Perso._getInstance() : super();
  void setInstance() => _this = this;

  // Perso() : super();

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
    pontosHab = perso['pontosHab'];
    pontosExp = perso['pontosExp'];
    loadId = perso['load_id'];
    classe = perso['classe'];
    rankExp = perso['rankExp'];
    extraStatus = Status();
  }

  int getExpMax() {
    double i = pow(2, (level.toDouble() - 1)).toDouble(); //potencia 2^(level-1)
    double d = pow(1.5, (level.toDouble())).toDouble(); //potencia 1.5^level
    return ((100 * i) ~/ d);
  }

  void updateExperiencia(int experiencia) {
    int expMax = getExpMax();
    while (experiencia >= expMax) {
      expMax = getExpMax();
      experiencia = (experiencia - expMax);
      level++;
      pontosExp = pontosExp + 5;
      pontosHab = pontosHab + 2;
      vidaMax = (vidaMax * 1.25).toInt();
      vida = vidaMax;
      atk++;
      def++;
      atkM++;
      defM++;
      agi++;
      mp = mpMax = mpMax + 5;
    }
    this.experiencia = experiencia;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> persoMap = {
      "id": id,
      "classe": classe,
      "load_id": loadId,
      "pontosExp": pontosExp,
      "pontosHab": pontosHab,
      "rankExp": rankExp,
    };
    persoMap.addAll(super.toMap());
    return persoMap;
  }
}
