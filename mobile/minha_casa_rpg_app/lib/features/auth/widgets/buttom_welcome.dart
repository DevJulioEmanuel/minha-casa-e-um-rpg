import 'package:flutter/material.dart';

class ButtomWelcome extends StatelessWidget {
  final String texto;
  final VoidCallback function;

  const ButtomWelcome({
    super.key,
    required this.texto,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff60A7CD),
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