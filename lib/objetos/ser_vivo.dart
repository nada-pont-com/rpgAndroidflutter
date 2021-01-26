import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:inicio/application.dart';
import 'package:inicio/objetos/habilidades.dart';
import 'package:inicio/objetos/status.dart';
import 'package:inicio/objetos/objeto.dart';

class SerVivo extends Status with Objeto {
  @protected
  int level = 1;
  @protected
  int experiencia = 0;
  @protected
  String rank = "G";
  @protected
  List<Habilidades> habilidades;

  int get getLevel => level;
  set setLevel(level) => this.level = level;

  int get getExperiencia => experiencia;
  set setExperiencia(experiencia) => this.experiencia = experiencia;

  String get getRank => rank;
  set setRank(rank) => this.rank = rank;

  List<Habilidades> get getHabilidades => habilidades;
  set setHabilidades(habilidades) => this.habilidades = habilidades;

  SerVivo({
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
    this.extraStatus = Status();
  }

  SerVivo.map(Map<String, dynamic> serVivo) : super.map(serVivo) {
    experiencia = serVivo['experiencia'];
    nome = serVivo['nome'];
    id = serVivo['id'];
    rank = serVivo['rank'];
    level = serVivo['level'];
    this.extraStatus = Status();
  }

  int useHabilidade(Habilidades habilidade) {
    if (nocalteado == 0) {
      int tipo = habilidade.getTipo;
      int custo = habilidade.getCusto;
      if (mp >= custo) {
        setMp = (mp - custo);
        if (tipo == 2) {
          extraStatus.extra(
              habilidade.getValor().toDouble(), this, habilidade.getExtra());
        } else if (tipo == 1) {}
        return HabilidadeStatus.ok.index;
      } else
        return HabilidadeStatus.semMp.index;
    } else {
      nocalteado--;
      return HabilidadeStatus.nocalteado.index;
    }
  }

  bool isVivo() {
    return !(getVida == 0);
  }

  List<String> atkInimigo(SerVivo voce, SerVivo inimigo,
      {Habilidades habilidade}) {
    List<String> acoes = <String>[];
    if (nocalteado == 0) {
      int valor = 1, nocalteValor = 0, atks = 1;
      if (habilidade != null) {
        valor = habilidade.getValor();
        nocalteValor = habilidade.getNocalte();
        atks = habilidade.getNumberAtk();
      }

      for (int i = 0; i < atks; i++) {
        double atk = getAtk * valor * 0.01 + (getAtk) + extraStatus.getAtk;
        double atkReal =
            atk - ((inimigo.getDef + inimigo.getExtraStatus.getDef) / 5);
        if (atkReal < 0) {
          atkReal = 0;
        }
        // print("atkR:" + atkReal.toString());
        int dano = atkReal.toInt();
        int validador = inimigo.getVidaReal - dano; // 399
        String acao = "";
        if (habilidade != null) {
          acao = voce.getNome +
              ": usou a habilidade " +
              habilidade.getNome +
              " e causou " +
              dano.toString() +
              " de dano " +
              (nocalteValor != 0
                  ? " com " + nocalteValor.toString() + "% de nocalte"
                  : "");
        } else {
          acao = voce.getNome +
              ": Atacou e causou " +
              dano.toString() +
              " de dano";
        }
        acoes.add(acao);
        if (validador <= 0) {
          validador = 0;
        } else {
          int rand = Random().nextInt(100) + 1;
          if ((rand <= nocalteValor) && (inimigo.nocalteado == 0)) {
            inimigo.setNocalteado = 3;
            acao = inimigo.getNome + " foi nocalteado por 3 rodadas";
            acoes.add(acao);
          }
        }
        inimigo.setVida = (validador);
      }
    } else {
      nocalteado--;
    }
    this.clearExtraStatus();
    return acoes;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> serVivoMap = {
      "nome": nome,
      "id": id,
      "rank": rank,
      "experiencia": experiencia,
      "level": level,
    };
    serVivoMap.addAll(super.toMap());
    return serVivoMap;
  }
}
