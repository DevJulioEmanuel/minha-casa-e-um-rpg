import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/buttom_google.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/buttom_welcome.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/textfield_welcome.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/titulo_welcome.dart';
import 'package:flutter/gestures.dart';


class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;
      print(email);
      print(password);
    }
  }

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
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      TituloWelcome(texto: "BEM VINDO DE VOLTA GUERREIRO!", size: 35.0,),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.25),
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
                                TextfieldWelcome(
                                  key: _formKey,
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
                                  key: _formKey,
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
                                ButtomWelcome(texto: "Entrar", function: submit),
                                ButtomGoogle(texto: "Entrar com Google", function: () {}),
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: [
                                      const TextSpan(
                                        text: "Esqueceu sua senha?"
                                      ),
                                      TextSpan(
                                        text: "Recuperar",
                                        recognizer: TapGestureRecognizer()..onTap = () {}
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