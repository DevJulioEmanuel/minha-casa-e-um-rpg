import 'package:flutter/material.dart';

class ButtomWelcome extends StatelessWidget {
  final String texto;
  const ButtomWelcome({
    super.key,
    required this.texto
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){}, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff60A7CD),
        minimumSize: Size(500, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        elevation: 5
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      )
    );
  }
}