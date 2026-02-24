import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/republica/data/atividades_modelfake.dart';
import 'package:minha_casa_rpg_app/features/republica/data/status_tarefa.dart';
import 'package:minha_casa_rpg_app/features/republica/data/tipo_tarefa.dart';
import 'package:minha_casa_rpg_app/features/republica/data/usuario_modelfake.dart';

final atividades = [
  AtividadesModelFake(
    texto: 'Lavar a louça da cozinha',
    usuario: usuarios[0],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now().add(const Duration(days: 1)),
    xp: 60,
    coins: 10,
    tipoTarefa: TipoTarefa.fixa,
    statusTarefa: StatusTarefa.pendente,
  ),

  AtividadesModelFake(
    texto: 'Tirar o lixo da casa',
    usuario: usuarios[2],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now(),
    xp: 40,
    coins: 8,
    tipoTarefa: TipoTarefa.fixa,
    statusTarefa: StatusTarefa.pendente,
  ),

  AtividadesModelFake(
    texto: 'Limpar o banheiro',
    usuario: usuarios[1],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now().add(const Duration(days: 3)),
    xp: 120,
    coins: 25,
    tipoTarefa: TipoTarefa.revezamento,
    statusTarefa: StatusTarefa.pendente,
  ),

  AtividadesModelFake(
    texto: 'Organizar a geladeira',
    usuario: usuarios[3],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now().add(const Duration(days: 2)),
    xp: 80,
    coins: 15,
    tipoTarefa: TipoTarefa.pontual,
    statusTarefa: StatusTarefa.pendente,
  ),

  AtividadesModelFake(
    texto: 'Faxina geral da sala',
    usuario: usuarios[0],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now().add(const Duration(days: 5)),
    xp: 200,
    coins: 50,
    tipoTarefa: TipoTarefa.coletiva,
    statusTarefa: StatusTarefa.pendente,
  ),

  AtividadesModelFake(
    texto: 'Cozinhar o almoço de domingo',
    usuario: usuarios[1],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now().add(const Duration(days: 4)),
    xp: 90,
    coins: 20,
    tipoTarefa: TipoTarefa.desafio,
    statusTarefa: StatusTarefa.pendente,
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
    corUsuario: Color(0xFFA58FCE).value,
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