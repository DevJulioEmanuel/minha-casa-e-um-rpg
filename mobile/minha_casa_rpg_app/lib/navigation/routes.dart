import 'package:go_router/go_router.dart';
import 'package:minha_casa_rpg_app/features/republica/screens/republica_screen.dart';
import 'package:minha_casa_rpg_app/features/welcome/screens/cadastro_screen.dart';
import 'package:minha_casa_rpg_app/features/welcome/screens/login_screen.dart';
import 'package:minha_casa_rpg_app/features/welcome/screens/welcome_screen.dart';

final routes = GoRouter(
  initialLocation: '/republica',
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
      path: '/republica',
      builder: (context, state) => RepublicaScreen()
    )
  ]
);