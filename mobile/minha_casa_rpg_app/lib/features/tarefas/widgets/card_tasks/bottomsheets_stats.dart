import 'package:flutter/material.dart';

class BottomsheetsStats extends StatelessWidget {
  final String path;
  final String texto;
  final double scaleImage;
  const BottomsheetsStats({
    super.key,
    required this.path,
    required this.texto,
    required this.scaleImage
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(path),
        SizedBox(width: scaleImage*15),
        Text(
          texto,
          style: Theme.of(context).textTheme.bodyLarge
        ),
      ],
    );
  }
}