import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/welcome/screens/login_screen.dart';
import 'features/welcome/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha Casa RPG',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Cinzel',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Cinzel_Decorative',
            fontSize: 45,
            fontWeight: FontWeight.w700,
            color: Color(0xFF153968)
          ),
          bodySmall: TextStyle(
            fontSize: 12
          ),
          bodyMedium: TextStyle(
            fontSize: 16
          )
        )
      ),
      home: const LoginScreen(),
    );
  }
}
