import 'package:flutter/material.dart';

class ButtomBottomsheets extends StatelessWidget {
  final String texto;
  final Color cor;
  final VoidCallback? function;

  const ButtomBottomsheets({
    super.key,
    required this.texto,
    required this.cor,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: cor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        elevation: 8
      ),
      child: Text(
        texto, 
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)
        )
      );
  }
}