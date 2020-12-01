class Load {
  int _id;
  String _nome = "";

  Load({int id, String nome}) {
    _id = id;
    _nome = nome;
  }

  get nome => _nome;
  set nome(nome) => _nome = nome;

  get id => _id;
  set id(id) => _id = id;

  Map<String, dynamic> toMap() => {
        "id": _id,
        "nome": _nome,
        "cobre": 0,
        "prata": 0,
        "ouro": 0,
      };
}
