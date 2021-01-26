import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/objetos/perso.dart';

int dbVersion = 1;

int loadId = 1;

List<Perso> persos;

List<String> ranks = ["G", "F", "E", "D", "C", "B", "A", "S"];

bool validaRank(String rankMax, String rankValidar) {
  int rank = -1;
  for (int i = 0; i < ranks.length; i++) {
    if (ranks[i] == rankValidar) return (rank == -1 ? true : false);

    if (ranks[i] == rankMax) rank = i;
  }

  return false;
}

dynamic convertRank({String rankS, int rankInt}) {
  if (rankS == null) return ranks[rankInt];
  for (var i = 0; i < ranks.length; i++) {
    if (ranks[i] == rankS) return i;
  }
}

Widget raisedButtonOfList(String text, Function onPress,
    {Color color: Colors.blue, Color textColor: Colors.white, Widget texto}) {
  if (texto == null) {
    texto = Text(text);
  }
  return Container(
    margin: EdgeInsets.all(5),
    child: RaisedButton(
        padding: EdgeInsets.all(0),
        color: color,
        textColor: textColor,
        child: texto,
        onPressed: onPress),
  );
}

enum HabilidadeStatus { ok, nocalteado, semMp }

String dbName = "rpg.db";
// tempo VARCHAR(255) NOT NULL,
List<String> tablesCriat = [
  """CREATE TABLE IF NOT EXISTS load (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(45) NOT NULL UNIQUE,
      
      cobre INT UNSIGNED NOT NULL,
      prata INT UNSIGNED NOT NULL,
      ouro INT UNSIGNED NOT NULL
  )""",
  """CREATE TABLE IF NOT EXISTS perso(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(40) NOT NULL,
      level INT UNSIGNED NOT NULL,
      experiencia INT UNSIGNED NOT NULL,
      pontosExp INT UNSIGNED NOT NULL,
      pontosHab INT UNSIGNED NOT NULL,
      load_id INTEGER NOT NULL,
      classe VARCHAR(20) NOT NULL,
      rank CHAR(1) NOT NULL,
      rankExp INT UNSIGNED  NOT NULL,
      vida INT UNSIGNED NOT NULL,
      vidaMax INT UNSIGNED NOT NULL,
      mp INT UNSIGNED NOT NULL,
      mpMax INT UNSIGNED NOT NULL,
      atk INT UNSIGNED NOT NULL,
      def INT UNSIGNED NOT NULL,
      agi INT UNSIGNED NOT NULL,
      atkM INT UNSIGNED NOT NULL,
      defM INT UNSIGNED NOT NULL,
      vit INT UNSIGNED NOT NULL,
      inteli INT UNSIGNED NOT NULL,
      FOREIGN KEY (load_id)
      REFERENCES load (id)
  )""",
  """CREATE TABLE IF NOT EXISTS dungeons_tem_loads (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        nome VARCHAR(20) NOT NULL,
        andares VARCHAR(7) NOT NULL,
        load_id INT UNSIGNED NOT NULL,
        rank CHAR(1) NOT NULL,
        FOREIGN KEY (load_id)
        REFERENCES load (id)
  )""",
  // Id referente a posição do item na lista;
  """CREATE TABLE IF NOT EXISTS itens_perso  (
        id INT NOT NULL, 
        load_id INT UNSIGNED NOT NULL,
        quantidade INT UNSIGNED NOT NULL,
        FOREIGN KEY (load_id)
        REFERENCES load (id), 
        PRIMARY KEY (id,load_id)
  )""",
  """CREATE TABLE IF NOT EXISTS perso_tem_habilidades (
        id INT UNSIGNED NOT NULL,
        perso_id INT UNSIGNED NOT NULL,
        level INT UNSIGNED  NOT NULL,
        FOREIGN KEY (perso_id) 
        REFERENCES perso (id),
        PRIMARY KEY (id,perso_id)
  )""",
];
