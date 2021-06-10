import 'package:inicio/objetos/item.dart';
import 'package:inicio/objetos/objeto.dart';

class Load extends Objeto {
  List<Item> _itens;
  Load({int id, String nome}) {
    this.id = id;
    this.nome = nome;
    _itens = <Item>[];
  }

  List<Item> get itens => _itens;
  // set itens(List<Item> itens) => _itens = itens;

  void atualizaItens(List<Item> itens) {
    bool existe = false;
    for (Item item in itens) {
      existe = false;
      for (int i = 0; i < _itens.length; i++) {
        if (_itens[i].getId == item.getId) {
          existe = true;
          _itens[i].quantidade += item.quantidade;
          break;
        }
      }
      if (!existe) {
        _itens.add(item);
      }
    }
  }

  int subtraiItem(Item item) {
    bool existe = false;
    bool valida = false;
    for (var i = 0; i < _itens.length; i++) {
      if (item.getId == _itens[i].getId) {
        existe = true;
        int quantidade = (item.quantidade - _itens[i].quantidade);
        if (quantidade >= 0) {
          valida = true;
          _itens[i].quantidade = quantidade;
          break;
        }
      }
    }

    return existe
        ? valida
            ? 1
            : -2
        : -1;
  }

  int removeItem(Item item, {id, indice}) {
    int retorn = size();
    if (item != null || id != null) {
      for (int i = 0; i < size(); i++) {
        if (_itens[i].getId == (itens != null ? item.getId : id)) {
          _itens.removeAt(i);
          break;
        }
      }
    }
    if (indice != null) {
      _itens.removeAt(indice);
    }
    return size() - retorn == 0 ? -1 : 0;
  }

  int size() {
    return _itens.length;
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "cobre": 0,
        "prata": 0,
        "ouro": 0,
      };

  String toString() => super.toString();
}
