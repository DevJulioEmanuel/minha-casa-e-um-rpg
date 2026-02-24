import 'package:minha_casa_rpg_app/features/republica/data/status_tarefa.dart';
import 'package:minha_casa_rpg_app/features/republica/data/tipo_tarefa.dart';
import 'package:minha_casa_rpg_app/features/republica/data/usuario_modelfake.dart';

class AtividadesModelFake {
  final String texto;
  final UsuarioModelfake usuario;
  final DateTime dataCriada;
  final DateTime dataPrevista;
  final int xp;
  final int coins;
  final TipoTarefa tipoTarefa;
  final StatusTarefa statusTarefa;


  AtividadesModelFake({
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