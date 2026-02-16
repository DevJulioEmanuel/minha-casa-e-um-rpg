import 'package:flutter/material.dart';

class PixelSprite extends StatelessWidget {
  final String path;
  final double scale;

  const PixelSprite({
    super.key,
    required this.path,
    this.scale = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        path,
        width: 48 * scale,
        height: 48 * scale,
        filterQuality: FilterQuality.none,
        fit: BoxFit.fill,
      ),
    );
  }
}
