import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  body(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/registro');
        },
        child: ColoredBox(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Image.asset("assets/sig-512.png", width: 150),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Click para iniciar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
