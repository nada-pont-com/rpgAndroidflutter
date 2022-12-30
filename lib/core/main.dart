import 'package:flutter/material.dart';
import 'package:rpg_flutter/core/router/router.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routers.routers,
      initialRoute: '/',
    );
  }
}
