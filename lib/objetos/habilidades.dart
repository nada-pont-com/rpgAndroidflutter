// import 'package:rpg_andriod/dados/habilidades.dart';
import 'package:rpg_andriod/objetos/objeto.dart';
import 'package:rpg_andriod/objetos/status.dart';

class Habilidades extends Objeto {
  int? _tipo; //1-Ataque, 2-fortalecimento
  int? _numberAtk; //numero de ataques que habilidade fara;
  int? _valor; // dano, aumento // porcentagem;
  int? _aumento;
  int? _nocalte;
  int? _pontos; //pontos necessarios para adquirir a habilidade;
  String _descricao = "";
  int? _custoMp; //custo de mp
  int level = 1; //custo de mp
  Status? _extra; //tipo de fortalecimento;

  Habilidades(Map<String, dynamic> habilidade) {
    id = habilidade["id"];
    nome = habilidade["nome"];
    _tipo = habilidade["tipo"];
    _numberAtk = habilidade["numberAtks"];
    _valor = habilidade["valor"];
    _aumento = habilidade["aumento"];
    _nocalte = habilidade["nocalte"];
    _extra = habilidade["extra"];
    _pontos = habilidade["custo"];
    _custoMp = habilidade["mpCusto"];
    descricao(habilidade["descricao"]);
  }

  void setTipo(int tipo) {
    _tipo = tipo;
  }

  int? get getTipo {
    return _tipo;
  }

  void setNumberAtk(int numberAtk) {
    _numberAtk = numberAtk;
  }

  int? getNumberAtk() {
    return _numberAtk;
  }

  void setValor(int valor) {
    _valor = valor;
  }

  int? getValor() {
    return _valor;
  }

  void setAumento(int aumento) {
    _aumento = aumento;
  }

  int? getAumento() {
    return _aumento;
  }

  void setNocalte(int nocalte) {
    _nocalte = nocalte;
  }

  int? getNocalte() {
    return _nocalte;
  }

  void setExtra(Status extra) {
    _extra = extra;
  }

  Status? getExtra() {
    return _extra;
  }

  void setPontos(int pontos) {
    _pontos = pontos;
  }

  int? getPontos() {
    return _pontos;
  }

  String? getDescricao() {
    return _descricao;
  }

  void setCusto(int custoMp) {
    _custoMp = custoMp;
  }

  int? get getCusto {
    return _custoMp;
  }

  void descricao(String descricao) {
    _descricao = descricao +
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
      _descricao = _descricao + "\nEfeito:" + extraClone.toString();
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "tipo": _tipo,
      "numberAtks": _numberAtk,
      "valor": _valor,
      "aumento": _aumento,
      "nocalte": _nocalte,
      // "extra": _extra,
      "custo": _pontos,
      "descricao": _descricao,
      "mpCusto": _custoMp,
    };
  }

  Map<String, dynamic> toMapToBanco() {
    return {
      "id": id,
      "level": level,
    };
  }

  @override
  String toString() {
    return nome;
  }
}
