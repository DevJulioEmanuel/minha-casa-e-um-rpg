import 'package:minha_casa_rpg_app/shared/enum/nivel_tarefa.dart';
import 'package:minha_casa_rpg_app/shared/enum/status_tarefa.dart';
import 'package:minha_casa_rpg_app/shared/enum/tipo_tarefa.dart';
import 'package:minha_casa_rpg_app/db_fake/usuario_modelfake.dart';

class TarefasModelfake {
  final String id;
  final String texto;
  final UsuarioModelfake usuario;
  final DateTime dataCriada;
  final DateTime dataPrevista;
  final int xp;
  final int coins;
  final NivelTarefa nivelTarefa;
  final TipoTarefa tipoTarefa;
  final StatusTarefa statusTarefa;


  TarefasModelfake({
    required this.id,
    required this.texto,
    required this.usuario,
    required this.dataCriada,
    required this.dataPrevista,
    required this.xp,
    required this.coins,
    required this.nivelTarefa,
    required this.tipoTarefa,
    required this.statusTarefa
  });

  TarefasModelfake copyWith({
    String? texto,
    DateTime? dataPrevista,
    NivelTarefa? nivelTarefa,
    StatusTarefa? statusTarefa,
  }) {
    return TarefasModelfake(
      id: id, 
      texto: texto ?? this.texto, 
      usuario: usuario, 
      dataCriada: dataCriada, 
      dataPrevista: dataPrevista ?? this.dataPrevista, 
      xp: xp, 
      coins: coins, 
      tipoTarefa: tipoTarefa, 
      nivelTarefa: nivelTarefa ?? this.nivelTarefa,
      statusTarefa: statusTarefa ?? this.statusTarefa
    );
  }

}