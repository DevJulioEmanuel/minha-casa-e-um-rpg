import 'package:flutter/material.dart';

class CardAtividade extends StatelessWidget {
  final String path;
  final String texto;
  final Color corUsuario;
  final double scaleImage;

  const CardAtividade({
    super.key,
    required this.path,
    required this.texto,
    required this.corUsuario,
    required this.scaleImage
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      color: corUsuario,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              path,
              width: 48 * scaleImage,
              height: 48 * scaleImage,
              filterQuality: FilterQuality.none,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Text(
                texto,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            )
          ]
        ),
      ),
    );
  }
}