import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/republica/data/atividades_modelfake.dart';
import 'package:minha_casa_rpg_app/features/republica/data/usuario_modelfake.dart';

final atividades = [
  AtividadesModelFake(
    texto: 'Julio Emanuel lavou a louça da república.',
    usuario: usuarios[0]
  ),
  AtividadesModelFake(
    texto: 'Arthur comprou a água',
    usuario: usuarios[1]
  ),
  AtividadesModelFake(
    texto: 'Kratos levou o lixo pra lixeira ',
    usuario: usuarios[2]
  ),
  AtividadesModelFake(
    texto: 'Atreus da Silva organizou a limpeza do sábado.',
    usuario: usuarios[3]
  ),
  AtividadesModelFake(
    texto: 'Arthur Lelis fez o café para todo mundo de manhã.',
    usuario: usuarios[1]
  ),
];

final usuarios = [
  UsuarioModelfake(
    nomeUsuario: "Julio Emanuel",
    xp: 3500,
    pathImage: 'assets/images/meu_avatar.png',
    corUsuario: Color(0xfff5FA7CD).value,
  ),
  UsuarioModelfake(
    nomeUsuario: "Arthur Lellis",
    xp: 2300,
    pathImage: 'assets/images/meu_avatar2.png',
    corUsuario: Color.fromARGB(255, 165, 143, 206).value,
  ),
  UsuarioModelfake(
    nomeUsuario: "Kratos",
    xp: 500,
    pathImage: 'assets/images/meu_avatar3.png',
    corUsuario: const Color(0xFF77B882).value, 
  ),
  UsuarioModelfake(
    nomeUsuario: "Atreus da Silva",
    xp: 25,
    pathImage: 'assets/images/meu_avatar4.png',
    corUsuario: Color(0xFFB1A043).value, 
  )
];