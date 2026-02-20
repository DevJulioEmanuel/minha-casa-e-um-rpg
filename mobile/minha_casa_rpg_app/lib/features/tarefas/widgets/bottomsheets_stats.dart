import 'package:flutter/material.dart';

class BottomsheetsStats extends StatelessWidget {
  final Icon icon;
  final String texto;
  final double scaleImage;
  const BottomsheetsStats({
    super.key,
    required this.icon,
    required this.texto,
    required this.scaleImage
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon.icon, size: scaleImage*30, color: Theme.of(context).colorScheme.secondary),
        SizedBox(width: scaleImage*15),
        Text(
          texto,
          style: Theme.of(context).textTheme.bodyLarge
        ),
      ],
    );
  }
}