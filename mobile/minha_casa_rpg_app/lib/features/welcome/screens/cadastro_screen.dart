import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/buttom_google.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/buttom_welcome.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/textfield_welcome.dart';
import 'package:minha_casa_rpg_app/features/welcome/widgets/titulo_welcome.dart';


class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  
  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void cadastrarSubmit() {
    if (_formKey.currentState!.validate()) {
      final nome = nomeController.text;
      final email = emailController.text;
      final password = passwordController.text;
      final confirm = confirmController.text;
      debugPrint(nome);
      debugPrint(email);
      debugPrint(password);
      debugPrint(confirm);
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
                      SizedBox(height: heightScreen * 0.10),
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
                                        label: "Nome",
                                        controller: nomeController,
                                        keyboardType: TextInputType.name,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Digite o seu nome";
                                          }
                                          return null;
                                        },
                                      ),
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
                                      TextfieldWelcome(
                                        label: "Confirmação",
                                        controller: confirmController,
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
                                ButtomWelcome(texto: "Cadastrar", function: cadastrarSubmit),
                                ButtomGoogle(texto: "Entrar com Google", function: googleSubmit),
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