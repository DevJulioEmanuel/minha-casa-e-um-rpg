import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/tarefas/provider/tarefas_provider.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';
import 'package:minha_casa_rpg_app/shared/enum/status_tarefa.dart';

class FiltroWidgets extends ConsumerWidget {
  final double widthScreen, heightScreen;

  const FiltroWidgets({
    super.key, 
    required this.widthScreen, 
    required this.heightScreen
  });

  void proximo(WidgetRef ref, StatusTarefa atual) {
    final lista = StatusTarefa.values;
    final index = lista.indexOf(atual);
    final novo = lista[(index + 1) % lista.length];

    ref.read(tarefasProvider.notifier).setFiltro(novo);
  }

  void anterior(WidgetRef ref, StatusTarefa atual) {
    final lista = StatusTarefa.values;
    final index = lista.indexOf(atual);
    final novo = lista[(index - 1 + lista.length) % lista.length];
    ref.read(tarefasProvider.notifier).setFiltro(novo);
  }

  String traduzirFiltro(StatusTarefa status, AppLocalizations l10n) {
  switch (status) {
    case StatusTarefa.pendente:
      return l10n.tarefasFiltroPendentes;
    case StatusTarefa.atrasada:
      return l10n.tarefasFiltroAtrasadas;
    case StatusTarefa.concluida:
      return l10n.tarefasFiltroConcluidas;
  }
}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final estado = ref.watch(tarefasProvider);
    final filtroAtual = estado.statusTarefa;
    return Container(
      width: widthScreen*0.8,
      height: heightScreen*0.04,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [ BoxShadow(
          color: Colors.black26,
          blurRadius: 16
        )]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthScreen*0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () { anterior(ref, filtroAtual); },
              child: Icon(Icons.west, size: widthScreen*0.06, color: Colors.white),
            ),
            SizedBox(width: widthScreen*0.05),
            Expanded(
              child: Center(
                child: Text(
                  traduzirFiltro(filtroAtual, l10n),
                  key: ValueKey(filtroAtual),
                  style: Theme.of(context).textTheme.bodyMedium
                    ?.copyWith(fontSize: widthScreen*0.05, color: Colors.white)
                ),
              ),
            ),
            SizedBox(width: widthScreen*0.05),
            GestureDetector(
              onTap: () { proximo(ref, filtroAtual); },
              child: Icon(Icons.east, size: widthScreen*0.06, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
