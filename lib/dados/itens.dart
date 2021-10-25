import 'package:rpg_andriod/objetos/item.dart';
import 'package:rpg_andriod/objetos/status.dart';

class Itens {
  final List<Map<String, dynamic>> _itens = [
    {
      "id": 0,
      "nome": "Gosma",
      "nomeKey": "GOSMA",
      "raridade": "G",
      "estatistica": Status(),
    },
    {
      "id": 1,
      "nome": "Osso",
      "nomeKey": "OSSO",
      "raridade": "G",
      "estatistica": Status(),
    },
    {
      "id": 2,
      "nome": "Poção pequena de HP",
      "nomeKey": "Poção_HP_P",
      "raridade": "G",
      "estatistica": Status(vida: 100),
    },
    {
      "id": 3,
      "nome": "Poção pequena de MP",
      "nomeKey": "Poção_MP_P",
      "raridade": "G",
      "estatistica": Status(mp: 10),
    },
    {
      "id": 4,
      "nome": "Couro",
      "nomeKey": "COURO",
      "raridade": "G",
      "estatistica": Status(),
    },
    {
      "id": 5,
      "nome": "Carne Comun",
      "nomeKey": "COMUN_C",
      "raridade": "G",
      "estatistica": Status(),
    },
    {
      "id": 6,
      "nome": "Ferro",
      "nomeKey": "FERRO",
      "raridade": "F",
      "estatistica": Status(),
    },
    {
      "id": 7,
      "nome": "Ferro2",
      "nomeKey": "FERRO2",
      "raridade": "F",
      "estatistica": Status(),
    },
  ];

  Item? geraItemById(int id) {
    if (id > _itens.length) return null;
    return Item(_itens[id]);
  }

  Item? geraItemByName(String nome) {
    for (int i = 0; i < _itens.length; i++) {
      if (_itens[i]["nomeKey"] == nome) {
        return Item(_itens[i]);
      }
    }
    return null;
  }

  get countItens => _itens.length;
}
