import 'package:rpg_andriod/objetos/item.dart';
import 'package:rpg_andriod/objetos/objeto.dart';
import 'package:rpg_andriod/objetos/perso.dart';

class Load extends Objeto {
  final List<Item> _itens = [];
  List<Perso> persos = [];

  static Load? _this;

  Load.setInstance(
      {int id = 0, String nome = "", this.persos = const <Perso>[]}) {
    populate(id, nome);
    _this = this;
  }

  Load({int id = 0, String nome = ""}) {
    populate(id, nome);
  }

  static Load get getInstance => _this ?? Load();
  static bool get isActive => _this == null;
  static void resetLoad() {
    _this = null;
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

  int removeItem(Item item, {int? id, int? indice}) {
    int retorn = size();
    if (id != null) {
      for (int i = 0; i < size(); i++) {
        if (_itens[i].getId == item.getId) {
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

  void populate(int id, String nome) {
    this.id = id;
    this.nome = nome;
  }

  void populateByLoad(Load load) {
    id = load.id;
    nome = load.nome;
    persos = load.persos;
  }
}
