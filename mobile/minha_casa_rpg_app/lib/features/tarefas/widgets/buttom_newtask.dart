import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/newtask_modal.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';

class ButtomNewtask extends StatelessWidget {
  final double heightScreen;
  
  const ButtomNewtask({
    super.key,
    required this.heightScreen
    });

  void _openNewTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromARGB(255, 239, 242, 248),
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: NewtaskModal(heightScreen: heightScreen)
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ElevatedButton(
      onPressed: () {
        _openNewTask(context);
      },
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