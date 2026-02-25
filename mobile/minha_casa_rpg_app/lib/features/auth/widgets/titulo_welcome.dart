import 'package:flutter/material.dart';

class TituloWelcome extends StatelessWidget{
  final String texto;
  final double size;

  const TituloWelcome({
    super.key,
    required this.texto,
    required this.size
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: size),
      textAlign: TextAlign.center,
    );
  }
}