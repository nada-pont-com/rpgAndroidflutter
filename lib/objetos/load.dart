import 'package:inicio/objetos/objeto.dart';

class Load extends Objeto {
  Load({int id, String nome}) {
    this.id = id;
    this.nome = nome;
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "cobre": 0,
        "prata": 0,
        "ouro": 0,
      };
}
