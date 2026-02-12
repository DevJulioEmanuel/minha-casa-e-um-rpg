import 'package:go_router/go_router.dart';
import 'package:minha_casa_rpg_app/features/welcome/screens/cadastro_screen.dart';
import 'package:minha_casa_rpg_app/features/welcome/screens/login_screen.dart';
import 'package:minha_casa_rpg_app/features/welcome/screens/welcome_screen.dart';

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
  ]
);