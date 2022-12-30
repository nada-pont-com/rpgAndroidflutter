import 'package:flutter/material.dart';

class Infos extends StatelessWidget {
  const Infos({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Nome',
          ),
        )
      ],
    );
  }
}
