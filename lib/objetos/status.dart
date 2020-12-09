import 'package:flutter/cupertino.dart';

class Status {
  @protected
  int vida;
  @protected
  int vidaMax;
  @protected
  int mp;
  @protected
  int mpMax;
  @protected
  int atk;
  @protected
  int def;
  @protected
  int agi;
  @protected
  int atkM;
  @protected
  int defM;
  @protected
  int vit;
  @protected
  int intl;

  Status(
      {this.vida: 0,
      this.vidaMax,
      this.mp,
      this.mpMax,
      this.atk,
      this.def,
      this.agi,
      this.atkM,
      this.defM,
      this.intl,
      this.vit});

  Status.map(Map<String, dynamic> status) {
    vida = status["vida"];
    vidaMax = status["vidaMax"];
    mp = status["mp"];
    mpMax = status["mpMax"];
    atk = status["atk"];
    def = status["def"];
    agi = status["agi"];
    defM = status["defM"];
    atkM = status["atkM"];
    vit = status["vit"];
    intl = status["inteli"];
  }

  int get getVida => vida;
  set setVida(int vida) => this.vida = vida;

  int get getVidaMax => vidaMax;
  set setVidaMax(int vidaMax) => this.vidaMax = vidaMax;

  int get getMp => mp;
  set setMp(int mp) => this.mp = mp;

  int get getmpMax => mpMax;
  set setMpMax(int mpMax) => this.mpMax = mpMax;

  int get getAtk => atk;
  set setAtk(int atk) => this.atk = atk;

  int get getDef => def;
  set setDef(int def) => this.def = def;

  int get getAgi => agi;
  set setAgi(int agi) => this.agi = agi;

  int get getAtkM => atkM;
  set setAtkM(int atkM) => this.atkM = atkM;

  int get getDefM => defM;
  set setDefM(int defM) => this.defM = defM;

  int get getVit => vit;
  set setVit(int vit) => this.vit = vit;

  int get getIntl => intl;
  set setIntl(int intl) => this.intl = intl;

  Map<String, dynamic> toMap() {
    return {
      "vida": vida,
      "vidaMax": vidaMax,
      "mp": mp,
      "mpMax": mpMax,
      "atk": atk,
      "def": def,
      "agi": agi,
      "defM": defM,
      "atkM": atkM,
      "vit": vit,
      "inteli": intl,
    };
  }
}
