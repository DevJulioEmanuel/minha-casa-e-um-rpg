import 'package:flutter/material.dart';

class TituloScreen extends StatelessWidget {
  final String texto;
  const TituloScreen({
    super.key,
    required this.texto
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 35),
      textAlign: TextAlign.center,
    );
  }
}