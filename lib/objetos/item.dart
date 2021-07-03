import 'package:rpgandroid/application.dart';
import 'package:rpgandroid/objetos/objeto.dart';
import 'package:rpgandroid/objetos/status.dart';

class Item extends Objeto {
  String _raridade;
  int _quantidade;
  Status _status;

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
}
