import 'package:flutter/material.dart';

class ButtomGoogle extends StatelessWidget {
  final String texto;
  final VoidCallback function;

  const ButtomGoogle({
    super.key,
    required this.texto,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size(500, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        elevation: 5
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/images/google_image.png"),
          Text(
            texto,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20
            ),
          ),
        ],
      )
    );
  }
}