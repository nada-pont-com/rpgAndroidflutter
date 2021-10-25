import 'package:flutter/material.dart';
import 'package:rpg_andriod/banco/comandos.dart';
import 'package:rpg_andriod/dados/classes_dados.dart';
import 'package:rpg_andriod/jogo/inicio/jogo.dart';
import 'package:rpg_andriod/objetos/load.dart';
import 'package:rpg_andriod/objetos/perso.dart';

class NovoJogo extends StatefulWidget {
  const NovoJogo({Key? key}) : super(key: key);

  @override
  _NovoJogoState createState() => _NovoJogoState();
}

class _NovoJogoState extends State<NovoJogo> {
  final TextEditingController _nomeSave = TextEditingController(text: "");
  final TextEditingController _nomePerso = TextEditingController();

  late BuildContext _context;

  final Load _load = Load();
  Perso _newPerso = Perso();
  final ClassesDados _classesDados = ClassesDados();

  Comandos comandos = Comandos();

  int refClasse = -1;

  int referencia = 0;
  @override
  Widget build(BuildContext context) {
    // print("chegou aqui");
    _context = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Novo Jogo"),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    List<Widget> conteudo = _conteudo();
    return Center(
      child: SizedBox(
        width: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: conteudo,
        ),
      ),
    );
  }

  List<Widget> _conteudo() {
    if (referencia == 0) {
      return _nome();
    } else if (referencia == 1) {
      return _classe();
    } else {
      return _perso();
    }
  }

  List<Widget> _nome() {
    return [
      const Text(
        "Nome do Save",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      _textoField(_nomeSave, "Nome do Save", () {}),
      Center(
        child: Row(
          children: [
            _elevatedButtonOfList(
              "Continuar",
              () {
                String txt = _nomeSave.text;
                if (_validaNome(txt)) {
                  _load.setNome = txt;
                  setState(() {
                    referencia++;
                  });
                }
              },
            ),
            _elevatedButtonOfList("Cancelar", () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    ];
  }

  List<Widget> _classe() {
    return [
      const Text(
        "Nome do Save",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: _classesDados.size(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
              margin: const EdgeInsets.all(10),
              width: 80,
              child: ListTile(
                title: Text(_classesDados.getClasse(index)),
                leading: Radio<int>(
                  value: index,
                  groupValue: refClasse,
                  onChanged: (value) {
                    setState(() {
                      refClasse = value!;
                      _newPerso =
                          _classesDados.getStatus(value, persoAntig: _newPerso);
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
      Center(
        child: Row(
          children: [
            _elevatedButtonOfList("Continuar", () {
              if (refClasse != -1) {
                setState(() {
                  referencia++;
                });
              }
            }),
            _elevatedButtonOfList("Voltar", () {
              setState(() {
                referencia--;
              });
            }),
          ],
        ),
      ),
    ];
  }

  List<Widget> _perso() {
    _newPerso.toMap();
    return [
      const Text(
        "Nome do Personagem",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      _textoField(_nomePerso, "Insira o nome", () {
        if (_validaNome(_nomePerso.text)) {
          _newPerso.setNome = _nomePerso.text;
        }
      }),
      Center(
        child: Row(
          children: [
            _elevatedButtonOfList("Continuar", () {
              String txt = _nomePerso.text;
              if (_validaNome(txt)) {
                _newPerso.setNome = txt;
                comandos.buscaLoad().then((value) {
                  // print("aqui3");
                  bool valida = _validador(_nomeSave.text, value);
                  // print("aqui4");

                  if (valida) {
                    // print(_load.toMap());
                    comandos.inserirLoad(_load.toMap());
                    _newPerso.loadId = _load.getId;
                    _newPerso.setVida = 100;
                    _newPerso.setVidaMax = 100;
                    _newPerso.setMp = 10;
                    _newPerso.setMpMax = 10;
                    comandos.inserirPerso(_newPerso.toMap());
                    // loadId = _load.getId;

                    List<Perso> persos = <Perso>[];
                    persos.add(_newPerso);
                    Load.setInstance(
                        id: _load.getId, nome: _load.getNome, persos: persos);

                    Navigator.pushNamed(context, '/jogo');
                  }
                });
              }
            }),
            _elevatedButtonOfList("Voltar", () {
              setState(() {
                referencia--;
              });
              // Navigator.pop(context);
            }),
          ],
        ),
      ),
    ];
  }

  TextField _textoField(
    TextEditingController controller,
    String label,
    void Function() onEdit,
  ) =>
      TextField(
          controller: controller,
          decoration: InputDecoration(labelText: label),
          maxLength: 25,
          onEditingComplete: onEdit);

  Expanded _elevatedButtonOfList(
    String text,
    void Function() onPress, {
    Color color = Colors.blue,
    Color textColor = Colors.white,
  }) =>
      Expanded(
        flex: 5,
        child: Container(
          margin: const EdgeInsets.all(5),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(color),
                textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(color: textColor)),
              ),
              child: Text(text),
              onPressed: onPress),
        ),
      );

  _alert(String title,
      {String text = "",
      Widget? content,
      List<Widget>? actions,
      bool barrierDismissible = true}) {
    content ??= Text(text);

    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: actions,
        );
      },
    );
  }

  _validaNome(String txt) {
    if (txt.isNotEmpty) {
      return true;
    }

    _alert("Alert", text: "Coloque um nome");
    return false;
  }

  bool _validador(String txt, List<Load> loads) {
    // List<Load> loads = <Load>[];
    // comandos.close();
    int cont = 0;
    bool nomeRepetido = false;
    for (Load load in loads) {
      if (txt == load.getNome) {
        nomeRepetido = true;
      }
      cont++;
    }

    if (cont >= 3) {
      /*// ArrayAdapter<LoadTable> adapter = new ArrayAdapter<>(this,
      //         android.R.layout.simple_list_item_1, loads);
      // lista.setAdapter(adapter);
      // lista.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
      
            alert.setNeutralButton("Deletar Salve", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    VisibleInviseble(true);
                    lista.setVisibility(View.VISIBLE);
                }*/
      List<Widget> action = [
        TextButton(
          child: const Text("Deletar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
      ];
      _alert("Alerta", text: "Numero maximo de saves", actions: action);
    } else if (nomeRepetido) {
      _alert("Alerta", text: "Nome de salve Repetido");
    } else {
      int cont2 = 1;
      if (loads.length == 2) {
        cont2 = 6;
        for (int i = 0; i < loads.length; i++) {
          cont2 = cont2 - loads[i].getId;
        }
      } else if (loads.isNotEmpty) {
        if (loads[0].getId == 1) {
          cont2++;
        }
      }
      _load.setId = cont2;
      return true;
    }
    return false;
  }
}
