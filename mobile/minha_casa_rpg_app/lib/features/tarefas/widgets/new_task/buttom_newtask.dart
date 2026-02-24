import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/dialog_newtask.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';

class ButtomNewtask extends StatelessWidget {
  final double heightScreen;
  
  const ButtomNewtask({
    super.key,
    required this.heightScreen
    });

  void _openNewTask(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 320,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Color(0xFFF3EFE6),
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: AssetImage("assets/texture/textura_papel.png") ,
                fit: BoxFit.cover,
                opacity: 0.2
              ),
            ),
            child: DialogNewtask(),
          ),
        );
      }
    );
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