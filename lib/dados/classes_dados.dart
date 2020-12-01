import 'package:inicio/objetos/perso.dart';

class ClassesDados {
  Map _classes = {
    0: {
      "Classe": "Guerreiro",
      "Status": Perso.status(
        atk: 10,
        def: 10,
        agi: 5,
        atkM: 2,
        defM: 2,
        vit: 1,
        intl: 0,
      ),
    },
    1: {
      "Classe": "Explorador",
      "Status": Perso.status(
        atk: 6,
        def: 7,
        agi: 9,
        atkM: 5,
        defM: 6,
        vit: 0,
        intl: 0,
      ),
    },
  };

  String getClasse(int index) => _classes[index]['Classe'];

  int size() {
    return _classes.length;
  }

  Perso getStatus(int index, {Perso persoAntig}) {
    Map classe = _classes[index];
    print(classe["Status"].toString());
    Perso perso = classe["Status"];
    if (persoAntig != null) {
      perso.nome = persoAntig.nome;
    }
    perso.classe = classe["Classe"];
    return perso;
  }
}
