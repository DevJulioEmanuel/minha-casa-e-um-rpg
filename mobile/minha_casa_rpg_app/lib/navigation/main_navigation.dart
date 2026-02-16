import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigation extends StatelessWidget {
  final Widget child;
  const MainNavigation({
    super.key,
    required this.child
  });

  int _calculateIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/republica')) return 0;
    if (location.startsWith('/tarefas')) return 1;
    if (location.startsWith('/despesas')) return 2;
    if (location.startsWith('/loja')) return 3;
    if (location.startsWith('/perfil')) return 4;

    return 0;
  }

  @override
  Widget build(BuildContext context) {
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
        type: BottomNavigationBarType.shifting,
        


        currentIndex: _calculateIndex(context),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Republica'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_rtl),
            label: 'Tarefas'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Despesas'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Loja'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil'
          ),
        ],
      ),
    );
  }
}