
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LojaScreen extends ConsumerStatefulWidget{
  const LojaScreen({super.key});

  @override
  ConsumerState<LojaScreen> createState() => _LojaScreenState();
}

class _LojaScreenState extends ConsumerState<LojaScreen> {

  @override
  Widget build(BuildContext context) {
    //final heightScreen = MediaQuery.of(context).size.height;
    //final widthScreen = MediaQuery.of(context).size.width;
    //final scaleBigSprite = widthScreen*0.014;
    //final scaleSmallSprite = widthScreen*0.003;

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

