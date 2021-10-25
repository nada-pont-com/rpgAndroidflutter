import 'package:flutter/cupertino.dart';

class Status {
  @protected
  int vida = 0;
  @protected
  int vidaMax = 0;
  @protected
  int mp = 0;
  @protected
  int mpMax = 0;
  @protected
  int atk = 0;
  @protected
  int def = 0;
  @protected
  int agi = 0;
  @protected
  int atkM = 0;
  @protected
  int defM = 0;
  @protected
  int vit = 0;
  @protected
  int intl = 0;
  @protected
  int nocalteado = 0;
  @protected
  Status? extraStatus;

  Status(
      {this.vida = 0,
      // this.vidaAparente: 0,
      this.vidaMax = 0,
      this.mp = 0,
      this.mpMax = 0,
      this.atk = 0,
      this.def = 0,
      this.agi = 0,
      this.atkM = 0,
      this.defM = 0,
      this.intl = 0,
      this.vit = 0});

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

  void cloneByStatus(Status clone) {
    // Map<String, dynamic> extra = clone.toMap();
    vida = clone.vida;
    vidaMax = clone.vidaMax;
    mp = clone.mp;
    mpMax = clone.mpMax;
    atk = clone.atk;
    def = clone.def;
    agi = clone.agi;
    defM = clone.defM;
    atkM = clone.atkM;
    vit = clone.vit;
    intl = clone.intl;
  }

  Status clone() {
    Status clone = Status();
    clone.cloneByStatus(this);
    return clone;
  }

  void extra(double valor, Status? base, Status? status, {int type = 1}) {
    Map<String, dynamic> extra = status!.toMap();
    base ??= Status();
    if (type == 1) {
      valor *= 0.01;
    }
    vida = extra["vida"] == -1
        ? (type == 1 ? (valor * base.getVida) : (valor)).toInt()
        : extra["vida"];
    vidaMax = extra["vidaMax"] == -1
        ? (type == 1 ? (valor * base.getVidaMax) : (valor)).toInt()
        : extra["vidaMax"];
    mp = extra["mp"] == -1
        ? (type == 1 ? (valor * base.getMp) : (valor)).toInt()
        : extra["mp"];
    mpMax = extra["mpMax"] == -1
        ? (type == 1 ? (valor * base.getmpMax) : (valor)).toInt()
        : extra["mpMax"];
    atk = extra["atk"] == -1
        ? (type == 1 ? (valor * base.getAtk) : (valor)).toInt()
        : extra["atk"];
    def = extra["def"] == -1
        ? (type == 1 ? (valor * base.getDef) : (valor)).toInt()
        : extra["def"];
    agi = extra["agi"] == -1
        ? (type == 1 ? (valor * base.getAgi) : (valor)).toInt()
        : extra["agi"];
    defM = extra["defM"] == -1
        ? (type == 1 ? (valor * base.getDefM) : (valor)).toInt()
        : extra["defM"];
    atkM = extra["atkM"] == -1
        ? (type == 1 ? (valor * base.getAtkM) : (valor)).toInt()
        : extra["atkM"];
    vit = extra["vit"] == -1
        ? (type == 1 ? (valor * base.getVit) : (valor)).toInt()
        : extra["vit"];
    intl = extra["inteli"] == -1
        ? (type == 1 ? (valor * base.getIntl) : (valor)).toInt()
        : extra["inteli"];
  }

  void increment(Status status) {
    vida = status.getVida + vida;
    vidaMax = status.getVidaMax + vidaMax;
    mp = status.getMp + mp;
    mpMax = status.getmpMax + mpMax;
    atk = status.getAtk + atk;
    def = status.getDef + def;
    agi = status.getAgi + agi;
    defM = status.getDefM + defM;
    atkM = status.getAtkM + atkM;
    vit = status.getVit + vit;
    intl = status.getIntl + intl;
  }

  int get getVida => vida + (vit * 10);
  int get getVidaReal => vida;
  set setVida(int vida) => this.vida = vida;

  int get getVidaMax => vidaMax + (vit * 10);
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

  int get getNocalteado => nocalteado;
  set setNocalteado(int nocalteado) => this.nocalteado = nocalteado;

  Status? get getExtraStatus => extraStatus;
  void clearExtraStatus() => extraStatus!.cloneByStatus(Status());

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

  @override
  String toString() {
    return " vida: " +
        vida.toString() +
        " vidaMax: " +
        vidaMax.toString() +
        " mp: " +
        mp.toString() +
        " mpMax: " +
        mpMax.toString() +
        " atk: " +
        atk.toString() +
        " def: " +
        def.toString() +
        " agi: " +
        agi.toString() +
        " defM: " +
        defM.toString() +
        " atkM: " +
        atkM.toString() +
        " vit: " +
        vit.toString() +
        " inteli: " +
        intl.toString();
  }
}
