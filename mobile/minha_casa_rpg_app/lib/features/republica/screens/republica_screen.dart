
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/republica/data/atividades_modelfake.dart';
import 'package:minha_casa_rpg_app/features/republica/data/usuario_modelfake.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/card_atividade.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/card_ranking.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/pixel_sprite.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/stats_icons.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/titulo_republica.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/titulo_secao.dart';

class RepublicaScreen extends ConsumerStatefulWidget{
  const RepublicaScreen({super.key});

  @override
  ConsumerState<RepublicaScreen> createState() => _RepublicaScreenState();
}

class _RepublicaScreenState extends ConsumerState<RepublicaScreen> {

  final atividades = [
  AtividadesModelFake(
    pathImage: 'assets/images/meu_avatar.png',
    texto: 'Julio Emanuel lavou a louça da república.',
    corUsuario: Color(0xfff5FA7CD).value,
  ),
  AtividadesModelFake(
    pathImage: 'assets/images/meu_avatar2.png',
    texto: 'Arthur comprou a água',
    corUsuario: Color(0xFFA58FCE).value, 
  ),
  AtividadesModelFake(
    pathImage: 'assets/images/meu_avatar3.png',
    texto: 'Kratos levou o lixo pra lixeira ',
    corUsuario: const Color(0xFF77B882).value,
  ),
  AtividadesModelFake(
    pathImage: 'assets/images/meu_avatar4.png',
    texto: 'Atreus da Silva organizou a limpeza do sábado.',
    corUsuario: Color(0xFFF3E8A8).value, 
  ),
  AtividadesModelFake(
    pathImage: 'assets/images/meu_avatar2.png',
    texto: 'Arthur Lelis fez o café para todo mundo de manhã.',
    corUsuario: Color.fromARGB(255, 165, 143, 206).value,  
  ),
];

  final usuarios = [
    UsuarioModelfake(
      nomeUsuario: "Julio Emanuel",
      xp: 3500,
      pathImage: 'assets/images/meu_avatar.png',
    ),
    UsuarioModelfake(
      nomeUsuario: "Arthur Lellis",
      xp: 2300,
      pathImage: 'assets/images/meu_avatar2.png',
    ),
    UsuarioModelfake(
      nomeUsuario: "Kratos",
      xp: 500,
      pathImage: 'assets/images/meu_avatar3.png',
    ),
    UsuarioModelfake(
      nomeUsuario: "Atreus da Silva",
      xp: 25,
      pathImage: 'assets/images/meu_avatar4.png',
    )
  ];

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    final scaleBigSprite = widthScreen*0.014;
    final scaleSmallSprite = widthScreen*0.003;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/background_nuvens.png',
            fit: BoxFit.cover,
            ) 
          ),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          // TITULO DA REPUBLICA
                          SizedBox(height: heightScreen*0.025),
                          TituloRepublica(nomeRepublica: 'Nerds'),
                                    
                                    
                          // STATS DO USUARIO  
                          Divider(
                            color: Theme.of(context).colorScheme.primary,
                            height: heightScreen*0.03,
                            indent: widthScreen*0.03,
                            endIndent: widthScreen*0.03
                          ),
                          SizedBox(height: heightScreen*0.005),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: (widthScreen*0.05)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                StatsIcons(heightScreen: heightScreen, icon: Icons.shield_outlined, texto: 'LV. 5'),
                                StatsIcons(heightScreen: heightScreen, icon: Icons.star_border_purple500, texto: '360 xp'),
                                StatsIcons(heightScreen: heightScreen, icon: Icons.monetization_on_outlined, texto: '120 c.')
                              ],
                            ),
                          ),
                                    
                          // NOME E FOTO DO PERSONAGEM
                          SizedBox(height: heightScreen*0.035),
                          Text(
                            "Julio Emanuel",
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 25)
                          ),
                          SizedBox(height: heightScreen*0.015),
                          Center(
                            child: PixelSprite(
                              path: 'assets/images/meu_avatar.png',
                              scale: scaleBigSprite,
                            )
                          ),
                          SizedBox(height: heightScreen*0.02),
                          Divider(
                            color: Theme.of(context).colorScheme.primary,
                            height: heightScreen*0.03,
                            indent: widthScreen*0.03,
                            endIndent: widthScreen*0.03
                          ),

                          //SEÇÃO ATIVIDADES ->
                          
                          TituloSecao(texto: "ATIVIDADES"),
                          SizedBox(height: heightScreen*0.01),
                        ]
                      )
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final atividade = atividades[index];
                          return CardAtividade(
                            path: atividade.pathImage,
                            texto: atividade.texto, 
                            corUsuario: Color(atividade.corUsuario),
                            scaleImage: scaleSmallSprite,
                          );
                        },
                        childCount: atividades.length
                    )),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(height: heightScreen*0.020),
                          Divider(
                            color: Theme.of(context).colorScheme.primary,
                            height: heightScreen*0.03,
                            indent: widthScreen*0.03,
                            endIndent: widthScreen*0.03
                          ),
                          TituloSecao(texto: "RANKING"),
                          SizedBox(height: heightScreen*0.01),
                        ]
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final usuario = usuarios[index];
                          return CardRanking(
                            path: usuario.pathImage,
                            nomeUsuario: usuario.nomeUsuario,
                            xp: usuario.xp,
                            scaleImage: scaleSmallSprite,
                          );
                        },
                        childCount: usuarios.length
                    )),
                  ]
                ),
              )
            )
          )
        ],
      )
    );
  }
}

