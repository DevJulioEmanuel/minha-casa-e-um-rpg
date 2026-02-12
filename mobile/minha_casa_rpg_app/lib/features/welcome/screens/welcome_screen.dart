import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/buttom_welcome.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    TituloWelcome(texto: "MINHA CASA É UM RPG", size: 40.0),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.34),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(246, 34, 62, 82),
                          borderRadius: BorderRadius.circular(20.0) 
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            spacing: 20,
                            children: [
                              Text(
                                "Transforme tarefas e contas da república em uma aventura divertida, com XP, níveis e recompensas.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                  
                                ),
                                ),
                              ButtomWelcome(texto: "Entrar", function: () {} ),
                              ButtomWelcome(texto: "Cadastrar", function: () {}),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          )
        ]
       ),
    );
  }
}