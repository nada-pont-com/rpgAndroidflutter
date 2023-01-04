import 'dart:math';

import 'package:rpg_flutter/core/objs/efeito.dart';
import 'package:rpg_flutter/core/objs/status.dart';

abstract class Servivo {
  Servivo({Status? status}) {
    _status = status ?? Status();
  }

  late Status _status;

  List<Efeito> efeitos = [];

  bool get vivo => _status.hp > 0;

  double get getHp =>
      _status.hp +
      efeitos.fold<double>(0, (previousValue, efeito) {
        double vl = efeito.hp;
        if (efeito.tipo == TypeEfects.porcento) {
          vl = efeito.hp * _status.hpMax;
        }
        return vl + previousValue;
      });
  double get getHpMax => _status.hpMax;

  double get getAtk =>
      _status.atk +
      efeitos.fold<double>(0, (previousValue, efeito) {
        double vl = efeito.atk;
        if (efeito.tipo == TypeEfects.porcento) {
          vl = efeito.atk * _status.atk;
        }
        return vl + previousValue;
      });

  double get getDef =>
      _status.def +
      efeitos.fold<double>(0, (previousValue, efeito) {
        double vl = efeito.def;
        if (efeito.tipo == TypeEfects.porcento) {
          vl = efeito.def * _status.def;
        }
        return vl + previousValue;
      });

  double get getRes =>
      _status.res +
      efeitos.fold<double>(0, (previousValue, efeito) {
        double vl = efeito.res;
        if (efeito.tipo == TypeEfects.porcento) {
          vl = efeito.res * _status.res;
        }
        return vl + previousValue;
      });

  double get getAgi =>
      _status.agi +
      efeitos.fold<double>(0, (previousValue, efeito) {
        double vl = efeito.agi;
        if (efeito.tipo == TypeEfects.porcento) {
          vl = efeito.agi * _status.agi;
        }
        return vl + previousValue;
      });

  int get getSp => _status.sp;
  int get getSpMax => _status.spMax;

  set addHp(double hp) => _status.hp = min(_status.hp + hp, _status.hpMax);
  set removeHp(double hp) => _status.hp = max(_status.hp - hp, _status.hpMax);

  set efeito(Efeito efeito) {
    if (efeito.interacao == IntecationEfects.instantanio) {
      addHp = efeito.hp;
      _status.sp += efeito.sp;
    } else
      efeitos.add(efeito);
  }

  void ataque(Servivo alvo) {
    double dano = getAtk - alvo.getDef / 5;
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
