import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:minha_casa_rpg_app/features/auth/provider/auth_controller.dart';
import 'package:minha_casa_rpg_app/features/auth/widgets/buttom_google.dart';
import 'package:minha_casa_rpg_app/features/auth/widgets/buttom_welcome.dart';
import 'package:minha_casa_rpg_app/features/auth/widgets/textfield_welcome.dart';
import 'package:minha_casa_rpg_app/features/auth/widgets/titulo_welcome.dart';
import 'package:flutter/gestures.dart';


class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState(); 
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> entrarSubmit() async {
    if (_formKey.currentState!.validate()) {
      await ref
        .read(authControllerProvider.notifier)
        .login(emailController.text, passwordController.text
      );
      
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
    final authState = ref.watch(authControllerProvider);
    final heightScreen = MediaQuery.of(context).size.height;

    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (user) {
          if (user!=null) {
            context.go('/republica');
          }
        },
        error: (error, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString()))
          );
        }
      );
    });
    
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/panteao_grego.png',
            fit: BoxFit.cover,
            )
          ),
          Positioned.fill(
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    onPressed: () => context.pop(), 
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 40.0,
                                      )
                                    ),
                                ),
                              ),
                              SizedBox(height: heightScreen * 0.01),
                              TituloWelcome(texto: "BEM VINDO DE VOLTA GUERREIRO!", size: 35.0),
                              const Spacer(),
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
                                        ButtomWelcome(
                                          texto: authState.isLoading? "Carregando" : "Entrar",
                                          function: authState.isLoading? () {} : entrarSubmit
                                        ),
                                        ButtomGoogle(function: googleSubmit),
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
                          )
                        )
                      )
                    )
                  );
                }
              )
            )
          )
        ]
    )
  );
  }
}