import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';

class ButtomNewtask extends StatelessWidget {
  const ButtomNewtask({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onError,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        elevation: 8
      ),
      child: Text(
        l10n.tarefasButtomNovaTarefa, 
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)
      )
      );
  }
}