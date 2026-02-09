import 'package:flutter/material.dart';

class TituloWelcome extends StatelessWidget{
  final String texto;
  const TituloWelcome({
    super.key,
    required this.texto
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: Theme.of(context).textTheme.headlineLarge,
      textAlign: TextAlign.center,
    );
  }
}