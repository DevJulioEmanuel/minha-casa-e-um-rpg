import 'package:flutter/material.dart';

class DividerScreens extends StatelessWidget {
  final double heightScreen, widthScreen;
  const DividerScreens({super.key, required this.heightScreen, required this.widthScreen});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.primary,
      height: heightScreen*0.03,
      indent: widthScreen*0.03,
      endIndent: widthScreen*0.03
    );
  }
}