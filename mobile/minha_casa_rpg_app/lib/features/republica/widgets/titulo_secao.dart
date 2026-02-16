import 'package:flutter/material.dart';

class TituloSecao extends StatelessWidget {
  final String texto;
  const TituloSecao({
    super.key,
    required this.texto
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25)
    );
  }
}