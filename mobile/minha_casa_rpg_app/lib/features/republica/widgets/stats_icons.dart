import 'package:flutter/material.dart';

class StatsIcons extends StatelessWidget {
  final double heightScreen;
  final String path;
  final String texto;
  
  const StatsIcons({
    super.key,
    required this.heightScreen,
    required this.path,
    required this.texto
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(path),
        SizedBox(height: heightScreen*0.005),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Center(
            child: Text(
              texto,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)
            ),
          ),
        )
      ],
    );
  }
}