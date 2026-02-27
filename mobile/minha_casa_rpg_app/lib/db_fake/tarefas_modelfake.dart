import 'package:minha_casa_rpg_app/shared/enum/status_tarefa.dart';
import 'package:minha_casa_rpg_app/shared/enum/tipo_tarefa.dart';
import 'package:minha_casa_rpg_app/db_fake/usuario_modelfake.dart';

class TarefasModelfake {
  final String texto;
  final UsuarioModelfake usuario;
  final DateTime dataCriada;
  final DateTime dataPrevista;
  final int xp;
  final int coins;
  final TipoTarefa tipoTarefa;
  final StatusTarefa statusTarefa;


  TarefasModelfake({
    required this.texto,
    required this.usuario,
    required this.dataCriada,
    required this.dataPrevista,
    required this.xp,
    required this.coins,
    required this.tipoTarefa,
    required this.statusTarefa
  });
}