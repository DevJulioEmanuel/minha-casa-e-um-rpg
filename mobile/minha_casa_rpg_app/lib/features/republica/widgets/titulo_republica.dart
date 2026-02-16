import 'package:flutter/material.dart';

class TituloRepublica extends StatelessWidget {
  final String nomeRepublica;
  const TituloRepublica({
    super.key,
    required this.nomeRepublica
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: 
      TextSpan(
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 35),
        children: [
          TextSpan(
            text: "Republica dos",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary
            )
          ),
          TextSpan(
            text: '\n$nomeRepublica',
          )
        ]
      ),
    );
  }
}