import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/db_fake/bd_fake.dart';
import 'package:minha_casa_rpg_app/shared/enum/avatar_size.dart';
import 'package:minha_casa_rpg_app/features/avatares/avatar_view.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/card_atividade.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/card_ranking.dart';
import 'package:minha_casa_rpg_app/shared/widgets/divider_screens.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/stats_icons.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/titulo_republica.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/titulo_secao.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';

class RepublicaScreen extends ConsumerStatefulWidget{
  const RepublicaScreen({super.key});

  @override
  ConsumerState<RepublicaScreen> createState() => _RepublicaScreenState();
}

class _RepublicaScreenState extends ConsumerState<RepublicaScreen> {

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/background_nuvens2.png',
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
                          DividerScreens(heightScreen: heightScreen, widthScreen: widthScreen),
                          SizedBox(height: heightScreen*0.005),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: (widthScreen*0.05)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                StatsIcons(heightScreen: heightScreen, path: 'assets/icons/etiqueta.png', texto: 'LV. 5'),
                                StatsIcons(heightScreen: heightScreen, path: 'assets/icons/xp_estrela.png', texto: '360 xp'),
                                StatsIcons(heightScreen: heightScreen, path: 'assets/icons/coins.png', texto: '120 c.')
                              ],
                            ),
                          ),
                                    
                          // NOME E FOTO DO PERSONAGEM
                          SizedBox(height: heightScreen*0.035),
                          Text(
                            "Kratos",
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 25)
                          ),
                          SizedBox(height: heightScreen*0.015),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: AvatarView(
                                path: 'assets/images/avatar/meu_avatar2.png', 
                                avatarSize: AvatarSize.big
                              ),
                            )
                          ),
                          SizedBox(height: heightScreen*0.02),
                          DividerScreens(heightScreen: heightScreen, widthScreen: widthScreen),

                          //SEÇÃO ATIVIDADES ->
                          
                          TituloSecao(texto: l10n.republicaAtividadesTitle),
                          SizedBox(height: heightScreen*0.01),
                        ]
                      )
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final atividade = atividades[index];
                          return CardAtividade(
                            path: atividade.usuario.pathImage,
                            texto: atividade.texto, 
                            corUsuario: Color(atividade.usuario.corUsuario),
                          );
                        },
                        childCount: atividades.length
                      )
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(height: heightScreen*0.020),
                          DividerScreens(heightScreen: heightScreen, widthScreen: widthScreen),
                          TituloSecao(texto: l10n.republicaRankingTitle),
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
                            cor: usuario.corUsuario,
                            xp: usuario.xp,
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

