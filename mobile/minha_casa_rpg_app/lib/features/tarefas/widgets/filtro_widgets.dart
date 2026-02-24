import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';

class FiltroWidgets extends StatefulWidget {
  final double widthScreen, heightScreen;

  const FiltroWidgets({super.key, required this.widthScreen, required this.heightScreen});

  @override
  State<StatefulWidget> createState() => _FiltroWidgets();
}

class _FiltroWidgets extends State<FiltroWidgets> {

  int indexAtual = 0;
  int direcao = 1;

  final List<TipoFiltro> filtros = [
    TipoFiltro.pendentes,
    TipoFiltro.atrasadas,
    TipoFiltro.concluidas,
  ];

  void proximo() {
    setState(() {
      direcao = 1;
      indexAtual++;
      if (indexAtual>2) {
        indexAtual = 0;
      }
    });
  }

  void anterior() {
    setState(() {
      direcao = -1;
      indexAtual--;
      if (indexAtual<0) {
        indexAtual = 2;
      }
    });
  }

  String traduzirFiltro(TipoFiltro filtro, AppLocalizations l10n) {
  switch (filtro) {
    case TipoFiltro.pendentes:
      return l10n.tarefasFiltroPendentes;
    case TipoFiltro.atrasadas:
      return l10n.tarefasFiltroAtrasadas;
    case TipoFiltro.concluidas:
      return l10n.tarefasFiltroConcluidas;
  }
}

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: widget.widthScreen*0.8,
      height: widget.heightScreen*0.04,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [ BoxShadow(
          color: Colors.black26,
          blurRadius: 16
        )]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.widthScreen*0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: anterior,
              child: Icon(Icons.west, size: widget.widthScreen*0.06, color: Colors.white),
            ),
            SizedBox(width: widget.widthScreen*0.05),
            Expanded(
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  transitionBuilder: (child, animation) {
                    final isEntering = child.key == ValueKey(filtros[indexAtual]);
                
                    final offsetAnimation = Tween<Offset>(
                      begin: Offset(
                        isEntering ? direcao.toDouble() : -direcao.toDouble(), 0
                      ),
                      end: Offset.zero
                    ).animate(animation);
                    return ClipRect(
                      child: SlideTransition(
                        position: offsetAnimation,
                        child: FadeTransition(opacity: animation, child: child),
                      ),
                    );
                  },
                  child: Text(
                    traduzirFiltro(filtros[indexAtual], l10n),
                    key: ValueKey(filtros[indexAtual]),
                    style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(fontSize: widget.widthScreen*0.05, color: Colors.white)
                  )
                ),
              ),
            ),
            SizedBox(width: widget.widthScreen*0.05),
            GestureDetector(
              onTap: proximo,
              child: Icon(Icons.east, size: widget.widthScreen*0.06, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

enum TipoFiltro {
  pendentes,
  atrasadas,
  concluidas,
}
