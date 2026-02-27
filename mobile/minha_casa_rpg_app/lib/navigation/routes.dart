import 'package:go_router/go_router.dart';
import 'package:minha_casa_rpg_app/features/despesas/screens/despesas_screen.dart';
import 'package:minha_casa_rpg_app/features/loja/screens/loja_screen.dart';
import 'package:minha_casa_rpg_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:minha_casa_rpg_app/features/perfil/screens/perfil_screen.dart';
import 'package:minha_casa_rpg_app/features/republica/screens/republica_screen.dart';
import 'package:minha_casa_rpg_app/features/tarefas/screens/tarefas_screen.dart';
import 'package:minha_casa_rpg_app/features/auth/screens/cadastro_screen.dart';
import 'package:minha_casa_rpg_app/features/auth/screens/login_screen.dart';
import 'package:minha_casa_rpg_app/features/auth/screens/welcome_screen.dart';
import 'package:minha_casa_rpg_app/navigation/main_navigation.dart';

final routes = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      builder: (context, state) => WelcomeScreen(),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) => LoginScreen()
        ),
        GoRoute(
          path: 'cadastro',
          builder: (context, state) => CadastroScreen()
        ),
      ]
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnboardingScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return MainNavigation(location: state.matchedLocation, child: child,);
      },
      routes: [
        GoRoute(
          path: '/republica',
          builder: (context, state) => RepublicaScreen()
        ),
        GoRoute(
          path: '/tarefas',
          builder: (context, state) => TarefasScreen()
        ),
        GoRoute(
          path: '/despesas',
          builder: (context, state) => DespesasScreen()
        ),
        GoRoute(
          path: '/loja',
          builder: (context, state) => LojaScreen()
        ),
        GoRoute(
          path: '/perfil',
          builder: (context, state) => PerfilScreen()
        )
      ]
    ),
  ]
);