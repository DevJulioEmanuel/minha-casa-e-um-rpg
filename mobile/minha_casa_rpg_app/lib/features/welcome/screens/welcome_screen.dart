import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/titulo_welcome.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('lib/assets/images/panteao_grego.png',
            fit: BoxFit.cover,
            )
          ),
          Positioned.fill(
            child: SafeArea(child: 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      TituloWelcome(texto: "MINHA CASA É UM RPG")
                    ],
                  ),
                ),
              )
            )
          )
        ]
       ),
    );
  }
}