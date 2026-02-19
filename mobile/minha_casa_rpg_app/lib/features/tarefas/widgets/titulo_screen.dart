import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';

class TituloScreen extends StatelessWidget {
  const TituloScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Text(
      l10n.tarefasTitle,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 35),
      textAlign: TextAlign.center,
    );
  }
}