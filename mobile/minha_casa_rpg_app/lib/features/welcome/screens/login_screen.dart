import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/buttom_google.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/buttom_welcome.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/textfield_welcome.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/titulo_welcome.dart';
import 'package:flutter/gestures.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void entrarSubmit() {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;
      debugPrint(email);
      debugPrint(password);
    }
  }

  void googleSubmit() {
    debugPrint("Entrar com Google!");
  }

  void recuperarSubmit() {
    debugPrint("Recuperar senha!");
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
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
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      SizedBox(height: heightScreen * 0.05),
                      TituloWelcome(texto: "BEM VINDO DE VOLTA GUERREIRO!", size: 35.0,),
                      SizedBox(height: heightScreen * 0.22),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(246, 34, 62, 82),
                            borderRadius: BorderRadius.circular(20.0) 
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              spacing: 25,
                              children: [
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    spacing: 20,
                                    children: [
                                      TextfieldWelcome(
                                        label: "E-mail",
                                        controller: emailController,
                                        keyboardType: TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Digite o seu e-mail";
                                          } 
                                          if (!value.contains("@")) {
                                            return "E-mail inválido";
                                          }
                                          return null;
                                        },
                                      ),
                                      TextfieldWelcome(
                                        label: "Senha",
                                        controller: passwordController,
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null || value.length < 6) {
                                            return "Senha muito curta";
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                ButtomWelcome(texto: "Entrar", function: entrarSubmit),
                                ButtomGoogle(texto: "Entrar com Google", function: googleSubmit),
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    children: [
                                      const TextSpan(
                                        text: "Esqueceu sua senha?",
                                        style: TextStyle(
                                          color: Colors.white
                                        )
                                      ),
                                      TextSpan(
                                        text: " Recuperar",
                                        style: TextStyle(
                                          color: Color(0xff60A7CD)
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap = recuperarSubmit
                                      )
                                    ]
                                  ) 
                                )
                              ],
                            ),
                          ),
                        ),
                      )
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