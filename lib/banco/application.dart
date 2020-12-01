int dbVersion = 1;

int load;

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
];
