import 'package:inicio/application.dart';
import 'package:inicio/objetos/objeto.dart';
import 'package:inicio/objetos/status.dart';

class Item extends Objeto {
  String _raridade;
  int _quantidade;
  Status _status;

  Item.item({int quantidade: 0, String nome: "", int id, String raridade}) {
    this.nome = nome;
    this._quantidade = quantidade;
    this.id = id;
    this._raridade = raridade;
  }

  Item(Map<String, dynamic> item) {
    this.id = item["id"];
    this.nome = item["nome"];
    this._raridade = item["raridade"];
    this._status = item["status"];
  }

  set raridade(String raridade) => this._raridade = raridade;

  String get raridade => _raridade;

  int get quantidade => _quantidade;

  set quantidade(int quantidade) => this._quantidade = quantidade;

  Status get status => Status.map(_status.toMap());

  Map<String, dynamic> toMapBanco() {
    Map<String, dynamic> itemMap = {
      "id": id,
      // "nome": nome,
      // "raridade": raridade,
      "quantidade": quantidade,
      "load_id": loadId,
    };
    return itemMap;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> itemMap = {
      "id": id,
      "nome": nome,
      "raridade": raridade,
      "quantidade": quantidade,
      "load_id": loadId,
    };
    return itemMap;
  }

  String toString() {
    return super.toString() +
        ", raridade=" +
        raridade +
        ", quantidade=" +
        quantidade.toString();
  }
}
