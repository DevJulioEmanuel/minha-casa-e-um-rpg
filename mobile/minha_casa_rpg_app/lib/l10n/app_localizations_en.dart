// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get republicaRepublicaTitle => 'THE HOUSE OF';

  @override
  String get republicaAtividadesTitle => 'ACTIVITY';

  @override
  String get republicaRankingTitle => 'LEADERBOARD';

  @override
  String get navHome => 'House';

  @override
  String get navTasks => 'Tasks';

  @override
  String get navExpenses => 'Expenses';

  @override
  String get navShop => 'Shop';

  @override
  String get navProfile => 'Profile';

  @override
  String get tarefasTitle => 'TASKS';

  @override
  String get tarefasButtomNovaTarefa => '+ NEW TASK';

  @override
  String get tarefasFiltroPendentes => 'PENDING';

  @override
  String get tarefasFiltroAtrasadas => 'OVERDUE';

  @override
  String get tarefasFiltroConcluidas => 'COMPLETED';
}
