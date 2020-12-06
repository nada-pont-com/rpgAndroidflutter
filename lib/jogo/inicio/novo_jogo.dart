import 'package:flutter/material.dart';
import 'package:inicio/application.dart';
import 'package:inicio/banco/comandos.dart';
import 'package:inicio/dados/classes_dados.dart';
import 'package:inicio/jogo/inicio/jogo.dart';
import 'package:inicio/objetos/load.dart';
import 'package:inicio/objetos/perso.dart';

class NovoLoad extends StatefulWidget {
  @override
  _NovoLoadState createState() => _NovoLoadState();
}

class _NovoLoadState extends State<NovoLoad> {
  TextEditingController _nomeSave = TextEditingController(text: "");
  TextEditingController _nomePerso = TextEditingController();

  Load _load = new Load();
  Perso _newPerso = new Perso();
  ClassesDados _classesDados = new ClassesDados();

  Comandos comandos = Comandos();

  int refClasse = -1;

  int referencia = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste',
      home: Scaffold(body: _body()),
    );
  }

  Widget _body() {
    List<Widget> conteudo = _conteudo();
    return Container(
      child: Center(
        child: Container(
          width: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: conteudo,
          ),
        ),
      ),
    );
  }

  List<Widget> _conteudo() {
    if (referencia == 0)
      return _nome();
    else if (referencia == 1)
      return _classe();
    else
      return _perso();
  }

  List<Widget> _nome() {
    return [
      Container(
        child: Text(
          "Nome do Save",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      _textoField(_nomeSave, "Nome do Save", () {
        print(_nomeSave.text);
      }),
      Center(
        child: Row(
          children: [
            _raisedButtonOfList(
              "Continuar",
              () {
                String txt = _nomeSave.text;
                if (_validaNome(txt)) {
                  _load.nome = txt;
                  setState(() {
                    referencia++;
                  });
                }
              },
            ),
            _raisedButtonOfList("Cancelar", () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    ];
  }

  List<Widget> _classe() {
    return [
      Container(
        child: Text(
          "Nome do Save",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      Container(
        height: 150,
        child: ListView.builder(
          itemCount: this._classesDados.size(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
              margin: EdgeInsets.all(10),
              width: 80,
              child: ListTile(
                title: Text(this._classesDados.getClasse(index)),
                leading: Radio(
                  value: index,
                  groupValue: refClasse,
                  onChanged: (value) {
                    setState(() {
                      refClasse = value;
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
            _raisedButtonOfList("Continuar", () {
              if (refClasse != -1) {
                setState(() {
                  referencia++;
                });
              }
            }),
            _raisedButtonOfList("Voltar", () {
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

  List<Widget> _perso() {
    _newPerso.toMap();
    return [
      Container(
        child: Text(
          "Nome do Personagem",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      _textoField(_nomePerso, "Insira o nome", () {
        if (_validaNome(_nomePerso.text)) {
          _newPerso.nome = _nomePerso.text;
        }
      }),
      Center(
        child: Row(
          children: [
            _raisedButtonOfList("Continuar", () {
              String txt = _nomePerso.text;
              if (_validaNome(txt)) {
                _newPerso.nome = txt;
                _validador(_nomeSave.text).then((value) {
                  if (value) {
                    comandos.inserirLoad(_load.toMap());
                    _newPerso.loadId = _load.id;
                    _newPerso.setVida = 100;
                    _newPerso.setVidaMax = 100;
                    _newPerso.setMp = 100;
                    _newPerso.setMpMax = 100;
                    comandos.inserirPerso(_newPerso.toMap());
                    loadId = _load.id;
                    persos = List<Perso>();
                    persos.add(_newPerso);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Jogo()));
                  }
                });
              }
            }),
            _raisedButtonOfList("Voltar", () {
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
    Function onEdit,
  ) =>
      TextField(
          controller: controller,
          decoration: InputDecoration(labelText: label),
          maxLength: 25,
          onEditingComplete: onEdit);

  Expanded _raisedButtonOfList(
    String text,
    Function onPress, {
    Color color: Colors.blue,
    Color textColor: Colors.white,
  }) =>
      Expanded(
        flex: 5,
        child: Container(
          margin: EdgeInsets.all(5),
          child: RaisedButton(
              color: color,
              textColor: textColor,
              child: Text(text),
              onPressed: onPress),
        ),
      );

  _alert(String title,
      {String text: "",
      Widget content,
      List<Widget> actions,
      bool barrierDismissible: true}) {
    if (content == null) {
      content = Text(text);
    }

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
    if (txt.length > 0) {
      return true;
    }

    _alert("Alert", text: "Coloque um nome");
    return false;
  }

  Future<bool> _validador(String txt) async {
    List<Load> loads = await comandos.buscaLoad();
    // comandos.close();
    int cont = 0;
    bool nomeRepetido = false;
    for (Load load in loads) {
      if (txt == load.nome) {
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
        FlatButton(
          child: Text("Deletar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("Cancelar"),
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
          cont2 = cont2 - loads[i].id;
        }
      } else if (loads.length != 0) {
        if (loads[0].id == 1) {
          cont2++;
        }
      }
      _load.id = cont2;
      return true;
    }
    return false;
  }
}
