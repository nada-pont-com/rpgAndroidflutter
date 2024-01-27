
# RPG flutter

rpg simples

-----------------------------------------

# Plano

- [ ] Tela inicial `27/01/24`
  - [ ] Logo no centro e texto em baixo "Click para iniciar"
  - [ ] Verificar se é primeira vez

- [ ] Tela de Criação `03/02/24`
  - [ ] Nome
    - [ ] Campo input
  - [ ] Classe
    - [ ] Modal com passa para o lado mostrando o que tem na classe
  - [ ] Acessorio `Extra`
    - [ ] Modal com o nome do acessorio e informação `Extra`

- [ ] Tela do jogo
  - [ ] Aba 1 `2 horas`
    - [ ] Personagem
      - [ ] Nome, lv, classe
      - [ ] Vida
  - [ ] Aba 2 `1 horas`
    - [ ] Listar as Dungeons
      - [ ]  Quando clica abar as info e se quer entrar
      - [ ]  Sem clicar tem a dificuldade `Extra`
      - [ ]  Nivel e Andar mais fundo
  - [ ] Aba 3 `1 horas`
    - [ ] Guilda

- [ ] Dungeon
  - [ ] `Extra`, mapa
  - [ ] Lembrar do caminho (Definir tamanho da dungeon) `6 horas`
    - [ ] Ou caminho pre definido `10 horas`
  - [ ] 3 caminhos para seguir, podendo voltar, mas descer
  - [ ] Sala final com boss. `Extra`

- [ ] Jogador
  - [ ] Classe
  - [ ] Status
    - [ ] Elevados de forma procedural com o nivel do Jogador
    - [ ] Fixos
  - [ ] Level
  - [ ] Equipamento
    - [ ] Arma
      - [ ] Tipo
    - [ ] Armadura
    - [ ] Acessorio
- [ ] Dungeon
  - [ ] Rank
  - [ ] Monstros
  - [ ] Andares
  - [ ] Level
    - [ ] Range (ex: level 1 a 5)
  - [ ] Ideia
    - [ ] Entrar tendo um texto de informações do que esta contecendo, dando direções possiveis, se encontrou escadas, monstros ou direção pra seguir.
- [ ] Armas
  - [ ] Tipo
  - [ ] Status
- [ ] Guilda
  - [ ] Rank
  - [ ] Missões
- [ ] Dados
  - [ ] Definição do que precisa ser salvo em banco
    - [ ] Dungeons encontradas
    - [ ] Missões
    - [ ] Jogador
      - [ ] Monstros derrotados
      - [ ] Monstros encontrados
      - [ ] Mortes
      - [ ] Dungeons esploradas
    - [ ] Itens vinculados ao jogador
- [ ] Monstros
  - [ ] Level
  - [ ] Drop Itens
  - [ ] Status
    - [ ] Elevados de forma procedural com o nivel do Monstros

- [ ] Final Um boss

-----------------------------------------

automatico

jogador - equioe

- turno
- nivel
- exp
- rank
- estatisticas - (automatico ou manual)
- habilidades - (automatico ou manual)
- classe

monstros

- nivel/estatisticas
- variação/lugar - nivel

dungeon

- base de calculo - nivel e rank

guilda

- missoes

interações

- batalha
- existencia vs existencia
-

armas:
  tipo
    - espada
    - lança
    - arco
    - faca

dados

- mortes
- monstros derrotados
- quantidade de tipo de atack
- qt habiliadde

----------- classes -------------------
inicio
min - max
60 - 100 - 4
2 - 10   - 8
2 - 10   - 8
2 - 10   - 8
1 - 7    - 6
0 - 5    - 5

aventureiro
type - arma - todas
arma base: faca

base:

- hp 70 - 1
- atk 5 - 3
- def 3 - 1
- agi 5 - 4
- sp 6  - 5
- res 2 - 2

foco:

- nada

guerreiro
type - arme - espada, lança
arma base: espada
base:

- hp 90 - 3
- atk 7 - 5
- def 7 - 5
- agi 2 - 0
- sp 1  - 0
- res 1 - 1

foco:

- atk
- def
- hp

arqueiro
type - arma - arco
arma base: arco
base:

- hp 60 - 0
- atk 6 - 4
- def 2 - 0
- agi 9 - 7
- sp 4  - 3
- res 0 - 0

foco:

- agi
- sp
