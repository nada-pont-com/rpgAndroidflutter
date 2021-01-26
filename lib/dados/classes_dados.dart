import 'package:inicio/objetos/perso.dart';
import 'package:inicio/objetos/status.dart';

class ClassesDados {
  Map _classes = {
    0: {
      "Classe": "Guerreiro",
      "Status": Status(
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
      "Status": Status(
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
    Perso perso = Perso();
    perso.cloneByStatus(classe["Status"]);
    if (persoAntig != null) {
      perso.setNome = persoAntig.getNome;
    }
    perso.classe = classe["Classe"];
    return perso;
  }
}
