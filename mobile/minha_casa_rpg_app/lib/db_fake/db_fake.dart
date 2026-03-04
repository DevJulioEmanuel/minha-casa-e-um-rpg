import 'package:minha_casa_rpg_app/features/avatares/data/color_repository.dart';
import 'package:minha_casa_rpg_app/db_fake/tarefas_modelfake.dart';
import 'package:minha_casa_rpg_app/shared/enum/nivel_tarefa.dart';
import 'package:minha_casa_rpg_app/shared/enum/status_tarefa.dart';
import 'package:minha_casa_rpg_app/shared/enum/tipo_tarefa.dart';
import 'package:minha_casa_rpg_app/db_fake/usuario_modelfake.dart';

final List<TarefasModelfake> tarefas = [
  TarefasModelfake(
    id: "0",
    texto: 'Lavar a louça da cozinha',
    usuario: usuarios[0],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now().add(const Duration(days: 1)),
    xp: 60,
    coins: 10,
    tipoTarefa: TipoTarefa.fixa,
    nivelTarefa: NivelTarefa.facil,
    statusTarefa: StatusTarefa.pendente,
  ),

  TarefasModelfake(
    id: "1",
    texto: 'Tirar o lixo da casa',
    usuario: usuarios[2],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now(),
    xp: 40,
    coins: 8,
    tipoTarefa: TipoTarefa.fixa,
    nivelTarefa: NivelTarefa.facil,
    statusTarefa: StatusTarefa.concluida,
  ),

  TarefasModelfake(
    id: "2",
    texto: 'Limpar o banheiro PROFUNDAMENTE, e trocar a tampa do vaso',
    usuario: usuarios[1],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now().add(const Duration(days: 3)),
    xp: 120,
    coins: 25,
    tipoTarefa: TipoTarefa.revezamento,
    nivelTarefa: NivelTarefa.dificil,
    statusTarefa: StatusTarefa.pendente,
  ),

  TarefasModelfake(
    id: "3",
    texto: 'Organizar a geladeira',
    usuario: usuarios[3],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now().add(const Duration(days: 2)),
    xp: 80,
    coins: 15,
    tipoTarefa: TipoTarefa.pontual,
    nivelTarefa: NivelTarefa.medio,
    statusTarefa: StatusTarefa.concluida,
  ),

  TarefasModelfake(
    id: "4",
    texto: 'Faxina geral da sala',
    usuario: usuarios[0],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now().add(const Duration(days: 5)),
    xp: 200,
    coins: 50,
    tipoTarefa: TipoTarefa.coletiva,
    nivelTarefa: NivelTarefa.medio,
    statusTarefa: StatusTarefa.atrasada,
  ),

  TarefasModelfake(
    id: "5",
    texto: 'Cozinhar o almoço de domingo',
    usuario: usuarios[1],
    dataCriada: DateTime.now(),
    dataPrevista: DateTime.now().add(const Duration(days: 4)),
    xp: 90,
    coins: 20,
    tipoTarefa: TipoTarefa.desafio,
    nivelTarefa: NivelTarefa.medio,
    statusTarefa: StatusTarefa.atrasada,
  ),
];



final usuarios = [
  UsuarioModelfake(
    nomeUsuario: "Julio Emanuel",
    xp: 3500,
    pathImage: 'assets/images/avatar/meu_avatar.png',
    corUsuario: ColorRepository.colors[8].color.value,
  ),
  UsuarioModelfake(
    nomeUsuario: "Arthur Lellis",
    xp: 2300,
    pathImage: 'assets/images/avatar/meu_avatar2.png',
    corUsuario: ColorRepository.colors[5].color.value,
  ),
  UsuarioModelfake(
    nomeUsuario: "Kratos",
    xp: 500,
    pathImage: 'assets/images/avatar/meu_avatar3.png',
    corUsuario: ColorRepository.colors[7].color.value,
  ),
  UsuarioModelfake(
    nomeUsuario: "Atreus da Silva",
    xp: 25,
    pathImage: 'assets/images/avatar/meu_avatar4.png',
    corUsuario: ColorRepository.colors[11].color.value,
  )
];