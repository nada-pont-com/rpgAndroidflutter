import 'package:rpg_andriod/objetos/habilidades.dart';
import 'package:rpg_andriod/objetos/status.dart';

class HabilidadesDados {
  final List<Map<String, dynamic>> _habilidades = [
    {
      "nome": "Ataque Forte",
      "nomeKey": "ATK_FORTE",
      "id": 0,
      "extra": Status(),
      "tipo": 1,
      "valor": 50,
      "numberAtks": 1,
      "nocalte": 5,
      "custo": 1,
      "mpCusto": 2,
      "descricao": "Um ataque forte",
      "aumento": 3,
    },
    {
      "nome": "Nocaltear",
      "nomeKey": "NOCALTEAR",
      "id": 1,
      "extra": Status(),
      "tipo": 1,
      "valor": 25,
      "numberAtks": 1,
      "nocalte": 55,
      "custo": 5,
      "mpCusto": 3,
      "descricao": "Um ataque que tem chance de nocaltear",
      "aumento": 3,
    },
    {
      "nome": "Consentrasão",
      "nomeKey": "CONSENTRASAO",
      "id": 2,
      "extra": Status(def: -1, agi: -1, defM: -1),
      "tipo": 2,
      "valor": 10,
      "numberAtks": 0,
      "nocalte": 0,
      "custo": 12,
      "mpCusto": 3,
      "descricao": "Aumenta a concentração do personagem",
      "aumento": 3,
    },
    {
      "nome": "Ataque UP",
      "nomeKey": "ATK_UP",
      "id": 3,
      "extra": Status(atk: -1),
      "tipo": 2,
      "valor": 10,
      "numberAtks": 0,
      "nocalte": 0,
      "custo": 8,
      "mpCusto": 2,
      "descricao": "Aumenta o ataque do personagem no proximo ataque",
      "aumento": 2,
    },
  ];

  Habilidades? getHabilidadeById(int id) {
    if (id >= _habilidades.length) return null;
    return Habilidades(_habilidades[id]);
  }

  List<Habilidades> getHabilidades() {
    List<Habilidades> listHabilidades = <Habilidades>[];
    for (Map<String, dynamic> habilidade in _habilidades) {
      listHabilidades.add(Habilidades(habilidade));
    }
    // print(listHabilidades);
    return listHabilidades;
  }
}
