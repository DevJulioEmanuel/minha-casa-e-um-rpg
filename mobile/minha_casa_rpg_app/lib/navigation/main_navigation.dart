import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';

class MainNavigation extends StatelessWidget {
  final Widget child;
  final String location;
  const MainNavigation({
    super.key,
    required this.child,
    required this.location
  });

  int _calculateIndex() {

  if (location.startsWith('/republica')) return 0;
  if (location.startsWith('/tarefas')) return 1;
  if (location.startsWith('/despesas')) return 2;
  if (location.startsWith('/loja')) return 3;
  if (location.startsWith('/perfil')) return 4;

  return 0;
}


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        elevation: 20,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _calculateIndex(),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/republica');
              break;
            case 1:
              context.go('/tarefas');
              break;
            case 2:
              context.go('/despesas');
              break;
            case 3:
              context.go('/loja');
              break;
            case 4:
              context.go('/perfil');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: l10n.navHome
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_rtl),
            label: l10n.navTasks
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: l10n.navExpenses
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: l10n.navShop
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: l10n.navProfile
          ),
        ],
      ),
    );
  }
}