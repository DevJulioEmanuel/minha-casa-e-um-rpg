import 'package:flutter/material.dart';

class ButtomFiltros extends StatelessWidget {
  final String texto;
  final Color corButtom;
  final double heightScreen, widthScreen;
  const ButtomFiltros({
    super.key, 
    required this.texto, 
    required this.heightScreen, 
    required this.widthScreen, 
    required this.corButtom
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: corButtom,
        minimumSize: Size(widthScreen*0.06, heightScreen*0.04),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        elevation: 8
      ),
      child: Text(
        texto,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontSize: heightScreen*0.0115),
      )
    );
  }
}