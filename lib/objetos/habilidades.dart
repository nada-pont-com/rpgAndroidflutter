// import 'package:rpg_flutter/dados/habilidades.dart';
import 'package:rpg_flutter/objetos/objeto.dart';
import 'package:rpg_flutter/objetos/status.dart';

class Habilidades extends Objeto {
  int? _tipo; //1-Ataque, 2-fortalecimento
  int? _numberAtk; //numero de ataques que habilidade fara;
  int? _valor; // dano, aumento // porcentagem;
  int? _aumento;
  int? _nocalte;
  int? _pontos; //pontos necessarios para adquirir a habilidade;
  String _descricao = "";
  int? _custoMp; //custo de mp
  int _level = 1; //custo de mp
  Status? _extra; //tipo de fortalecimento;

  Habilidades(Map<String, dynamic> habilidade) {
    this.id = habilidade["id"];
    this.nome = habilidade["nome"];
    this._tipo = habilidade["tipo"];
    this._numberAtk = habilidade["numberAtks"];
    this._valor = habilidade["valor"];
    this._aumento = habilidade["aumento"];
    this._nocalte = habilidade["nocalte"];
    this._extra = habilidade["extra"];
    this._pontos = habilidade["custo"];
    this._custoMp = habilidade["mpCusto"];
    this.descricao(habilidade["descricao"]);
  }

  void setTipo(int tipo) {
    this._tipo = tipo;
  }

  int? get getTipo {
    return _tipo;
  }

  void setNumberAtk(int numberAtk) {
    this._numberAtk = numberAtk;
  }

  int? getNumberAtk() {
    return _numberAtk;
  }

  void setValor(int valor) {
    this._valor = valor;
  }

  int? getValor() {
    return _valor;
  }

  void setAumento(int aumento) {
    this._aumento = aumento;
  }

  int? getAumento() {
    return _aumento;
  }

  void setNocalte(int nocalte) {
    this._nocalte = nocalte;
  }

  int? getNocalte() {
    return _nocalte;
  }

  void setExtra(Status extra) {
    this._extra = extra;
  }

  Status? getExtra() {
    return _extra;
  }

  void setPontos(int pontos) {
    this._pontos = pontos;
  }

  int? getPontos() {
    return _pontos;
  }

  String? getDescricao() {
    return _descricao;
  }

  void setCusto(int custoMp) {
    this._custoMp = custoMp;
  }

  int? get getCusto {
    return _custoMp;
  }

  int get level => _level;
  set level(int level) => this._level = level;

  void descricao(String descricao) {
    this._descricao = descricao +
        "\nValor: " +
        _valor.toString() +
        "%\n Aumento por level " +
        _aumento.toString() +
        "\nCusto Mp: " +
        _custoMp.toString() +
        " MP";
    bool valida = false;
    _extra!.toMap().forEach((key, value) {
      if (value == -1) {
        valida = true;
      }
    });

    if (valida) {
      Status extraClone = Status();
      if (_extra != null) {
        extraClone.extra(_valor!.toDouble(), null, _extra, type: 2);
      }
      this._descricao = this._descricao + "\nEfeito:" + extraClone.toString();
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "nome": this.nome,
      "tipo": this._tipo,
      "numberAtks": this._numberAtk,
      "valor": this._valor,
      "aumento": this._aumento,
      "nocalte": this._nocalte,
      // "extra": this._extra,
      "custo": this._pontos,
      "descricao": this._descricao,
      "mpCusto": this._custoMp,
    };
  }

  Map<String, dynamic> toMapToBanco() {
    return {
      "id": this.id,
      "level": this._level,
    };
  }

  String toString() {
    return nome;
  }
}
