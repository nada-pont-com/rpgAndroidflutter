import 'package:rpg_flutter/core/objs/status.dart';

enum TypeEfects { porcento, inteiro }

enum IntecationEfects { batalha, instantanio, ateOFim }

class Efeito extends Status {
  Efeito({
    this.turnos = 0,
    this.tipo = TypeEfects.porcento,
    this.interacao = IntecationEfects.batalha,
    double hp = 0,
    double atk = 0,
    double def = 0,
    double agi = 0,
    double res = 0,
    int sp = 0,
  }) : super(hp: hp, atk: atk, def: def, agi: agi, res: res, sp: sp);

  TypeEfects tipo;
  IntecationEfects interacao;
  int turnos;

  bool get ativo => turnos != 0;

  usoBatalha() {
    if (interacao == IntecationEfects.batalha) {
      turnos--;
    }
  }

  uso() {
    turnos--;
  }
}
