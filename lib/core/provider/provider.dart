import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_flutter/core/main.dart';

class SingleProvider extends StatelessWidget {
  const SingleProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => 10,
        )
      ],
      child: Main(),
    );
  }
}
