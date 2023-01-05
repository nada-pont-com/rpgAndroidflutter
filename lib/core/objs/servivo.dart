import 'dart:math';

import 'package:rpg_flutter/core/data/classes/aventureiro.dart';
import 'package:rpg_flutter/core/objs/classe.dart';
import 'package:rpg_flutter/core/objs/efeito.dart';
import 'package:rpg_flutter/core/objs/habilidade.dart';
import 'package:rpg_flutter/core/objs/status.dart';

abstract class Servivo {
  Servivo({
    Status? status,
    Classe? classe,
    List<Habilidade> habilidades = const [],
  }) {
    _status = status ?? Status();
    _classe = classe ?? Aventureiro();
    this.habilidades = habilidades;
  }

  late Status _status;

  late Classe _classe;

  List<Habilidade> habilidades = [];

  List<Efeito> efeitos = [];

  bool get vivo => _status.hp > 0;

  double get getHp => _status.hp + _classe.status.hp;
  double get getHpMax => _status.hpMax + _classe.status.hp;

  double get getAtk =>
      _status.atk +
      _classe.status.atk +
      efeitos.fold<double>(0, (previousValue, efeito) {
        double vl = efeito.atk;
        if (efeito.tipo == TypeEfects.porcento) {
          vl = efeito.atk * _status.atk;
        }
        return vl + previousValue;
      });

  double get getDef =>
      _status.def +
      _classe.status.def +
      efeitos.fold<double>(0, (previousValue, efeito) {
        double vl = efeito.def;
        if (efeito.tipo == TypeEfects.porcento) {
          vl = efeito.def * _status.def;
        }
        return vl + previousValue;
      });

  double get getRes =>
      _status.res +
      _classe.status.res +
      efeitos.fold<double>(0, (previousValue, efeito) {
        double vl = efeito.res;
        if (efeito.tipo == TypeEfects.porcento) {
          vl = efeito.res * _status.res;
        }
        return vl + previousValue;
      });

  double get getAgi =>
      _status.agi +
      _classe.status.agi +
      efeitos.fold<double>(0, (previousValue, efeito) {
        double vl = efeito.agi;
        if (efeito.tipo == TypeEfects.porcento) {
          vl = efeito.agi * _status.agi;
        }
        return vl + previousValue;
      });

  int get getSp => _status.sp;
  int get getSpMax => _status.spMax;

  set addHp(double hp) => _status.hp = min(_status.hp + hp, getHpMax);
  set removeHp(double hp) => _status.hp = max(_status.hp - hp, getHpMax);

  set efeito(Efeito efeito) {
    if (efeito.interacao == IntecationEfects.instantanio) {
      addHp = efeito.hp;
      _status.sp += efeito.sp;
    } else
      efeitos.add(efeito);
  }

  void ataque(Servivo alvo) {
    double dano = getAtk - alvo.getDef / 5;

    // hp effect
    addHp = efeitos.fold<double>(0, (previousValue, efeito) {
      double vl = efeito.hp;
      if (efeito.tipo == TypeEfects.porcento) {
        vl = efeito.hp * _status.hpMax;
      }
      return vl + previousValue;
    });

    alvo.removeHp = dano;
    turnoBatalhaEfeitos();
  }

  void turnoEfeitos() {
    efeitos.forEach((Efeito efeito) => efeito.uso());
  }

  void turnoBatalhaEfeitos() {
    efeitos.forEach((Efeito efeito) => efeito.usoBatalha());
  }

  void clearEfeitosBatalha() {
    efeitos.removeWhere((Efeito efeito) {
      return efeito.interacao == IntecationEfects.batalha;
    });
  }
}
