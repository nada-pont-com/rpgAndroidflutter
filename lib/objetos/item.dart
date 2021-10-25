import 'package:rpg_andriod/objetos/load.dart';
import 'package:rpg_andriod/objetos/objeto.dart';
import 'package:rpg_andriod/objetos/status.dart';

class Item extends Objeto {
  String? _raridade;
  int quantidade = 0;
  Status? _status;

  Item.item({this.quantidade = 0, String nome = "", int id = 0, String? raridade}) {
    this.nome = nome;
    this.id = id;
    _raridade = raridade;
  }

  Item(Map<String, dynamic> item) {
    id = item["id"];
    nome = item["nome"];
    _raridade = item["raridade"];
    _status = item["status"];
  }

  set raridade(String raridade) => _raridade = raridade;

  String get raridade => _raridade!;

  Status get status => Status.map(_status!.toMap());

  Map<String, dynamic> toMapBanco() {
    Map<String, dynamic> itemMap = {
      "id": id,
      // "nome": nome,
      // "raridade": raridade,
      "quantidade": quantidade,
      "load_id": Load.getInstance.getId,
    };
    return itemMap;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> itemMap = {
      "id": id,
      "nome": nome,
      "raridade": raridade,
      "quantidade": quantidade,
      "load_id": Load.getInstance.getId,
    };
    return itemMap;
  }

  @override
  String toString() {
    return super.toString() +
        ", raridade="+
        raridade +
        ", quantidade=" +
        quantidade.toString();
  }
}
