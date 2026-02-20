import 'package:flutter/material.dart';

class ButtomGoogle extends StatelessWidget {
  final VoidCallback function;

  const ButtomGoogle({
    super.key,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ENTRAR COM    ",
            style: Theme.of(context).textTheme.bodyLarge
          ),
          Image.asset("assets/images/google_image.png", scale: 1.5),
        ],
      )
    );
  }
}