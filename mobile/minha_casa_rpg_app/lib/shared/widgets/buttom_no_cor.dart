import 'package:flutter/material.dart';

class ButtomNoCor extends StatelessWidget {
  final String texto;
  final VoidCallback? function;
  final Color color;

  const ButtomNoCor({
    super.key,
    required this.texto,
    required this.function,
    this.color = const Color(0xFF77B882)
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function, 
      child: Center(
        child: Text(
          texto,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color)
        ),
      )
    );
  }
}