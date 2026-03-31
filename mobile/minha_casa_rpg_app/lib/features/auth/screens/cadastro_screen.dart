import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:minha_casa_rpg_app/features/auth/provider/auth_controller.dart'; // Importado
import 'package:minha_casa_rpg_app/features/auth/widgets/buttom_google.dart';
import 'package:minha_casa_rpg_app/features/auth/widgets/buttom_welcome.dart';
import 'package:minha_casa_rpg_app/features/auth/widgets/textfield_welcome.dart';
import 'package:minha_casa_rpg_app/features/auth/widgets/titulo_welcome.dart';

class CadastroScreen extends ConsumerStatefulWidget {
  const CadastroScreen({super.key});

  @override
  ConsumerState<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends ConsumerState<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  Future<void> cadastrarSubmit() async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(authControllerProvider.notifier)
          .register(emailController.text, passwordController.text);
    }
  }

  void googleSubmit() {
    debugPrint("Entrar com Google!");
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider); // Monitorando o estado
    final heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_pixelart_4.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.none,
            ),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: () => context.pop(),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: heightScreen * 0.01),
                              const TituloWelcome(
                                texto: "BEM VINDO GUERREIRO!",
                                size: 35.0,
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      246,
                                      34,
                                      62,
                                      82,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              TextfieldWelcome(
                                                label: "E-mail",
                                                controller: emailController,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Digite o seu e-mail";
                                                  }
                                                  if (!value.contains("@")) {
                                                    return "E-mail inválido";
                                                  }
                                                  return null;
                                                },
                                              ),
                                              const SizedBox(height: 20),
                                              TextfieldWelcome(
                                                label: "Senha",
                                                controller: passwordController,
                                                obscureText: true,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.length < 6) {
                                                    return "Senha muito curta";
                                                  }
                                                  return null;
                                                },
                                              ),
                                              const SizedBox(height: 20),
                                              TextfieldWelcome(
                                                label: "Confirmação",
                                                controller: confirmController,
                                                obscureText: true,
                                                validator: (value) {
                                                  if (value !=
                                                      passwordController.text) {
                                                    return "As senhas não conferem";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 25),
                                        ButtomWelcome(
                                          texto: authState.isLoading
                                              ? "Carregando"
                                              : "Cadastrar",
                                          function: authState.isLoading
                                              ? () {}
                                              : cadastrarSubmit,
                                        ),
                                        const SizedBox(height: 25),
                                        ButtomGoogle(function: googleSubmit),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
