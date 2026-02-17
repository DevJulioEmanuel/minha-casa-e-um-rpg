import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';

class TituloRepublica extends StatelessWidget {
  final String nomeRepublica;
  const TituloRepublica({
    super.key,
    required this.nomeRepublica
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return RichText(
      textAlign: TextAlign.center,
      text: 
      TextSpan(
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 35),
        children: [
          TextSpan(
            text: l10n.republicaRepublicaTitle,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary
            )
          ),
          TextSpan(
            text: '\n$nomeRepublica',
          )
        ]
      ),
    );
  }
}