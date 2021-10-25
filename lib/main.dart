import 'package:flutter/material.dart';
import 'package:rpg_andriod/objetos/notificacao.dart';
import 'package:provider/provider.dart';
import 'package:rpg_andriod/rotas/rotas.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SingleNotifier>(
        create: (_) => SingleNotifier(),
      )
    ],
    child:  MaterialApp(
        title: 'RPG Android',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: Rotas.rotas,
        onGenerateRoute: Rotas.onGenerateRoute,
    ),
  ));
}

