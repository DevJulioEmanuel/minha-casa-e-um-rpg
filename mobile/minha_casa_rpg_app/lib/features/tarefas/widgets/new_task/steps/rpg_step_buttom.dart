import 'package:flutter/material.dart';

class RpgStepButtom extends StatelessWidget {
  final String texto;
  final VoidCallback? function;
  final Color color;

  const RpgStepButtom({
    super.key,
    required this.texto,
    required this.function,
    this.color = const Color(0xFF77B882)
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function, 
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(500, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        elevation: 5
      ),
      child: Center(
        child: Text(
          texto,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)
        ),
      )
    );
  }
}