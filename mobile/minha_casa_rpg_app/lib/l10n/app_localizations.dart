import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// No description provided for @republicaRepublicaTitle.
  ///
  /// In pt, this message translates to:
  /// **'A REPUBLICA'**
  String get republicaRepublicaTitle;

  /// No description provided for @republicaAtividadesTitle.
  ///
  /// In pt, this message translates to:
  /// **'ATIVIDADES'**
  String get republicaAtividadesTitle;

  /// No description provided for @republicaRankingTitle.
  ///
  /// In pt, this message translates to:
  /// **'RANKING'**
  String get republicaRankingTitle;

  /// No description provided for @navHome.
  ///
  /// In pt, this message translates to:
  /// **'República'**
  String get navHome;

  /// No description provided for @navTasks.
  ///
  /// In pt, this message translates to:
  /// **'Tarefas'**
  String get navTasks;

  /// No description provided for @navExpenses.
  ///
  /// In pt, this message translates to:
  /// **'Despesas'**
  String get navExpenses;

  /// No description provided for @navShop.
  ///
  /// In pt, this message translates to:
  /// **'Loja'**
  String get navShop;

  /// No description provided for @navProfile.
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get navProfile;

  /// No description provided for @tarefasTitle.
  ///
  /// In pt, this message translates to:
  /// **'TAREFAS'**
  String get tarefasTitle;

  /// No description provided for @tarefasButtomNovaTarefa.
  ///
  /// In pt, this message translates to:
  /// **'+ NOVA TAREFA'**
  String get tarefasButtomNovaTarefa;

  /// No description provided for @tarefasFiltroPendentes.
  ///
  /// In pt, this message translates to:
  /// **'PENDENTES'**
  String get tarefasFiltroPendentes;

  /// No description provided for @tarefasFiltroAtrasadas.
  ///
  /// In pt, this message translates to:
  /// **'ATRASADAS'**
  String get tarefasFiltroAtrasadas;

  /// No description provided for @tarefasFiltroConcluidas.
  ///
  /// In pt, this message translates to:
  /// **'CONCLUIDAS'**
  String get tarefasFiltroConcluidas;

  /// No description provided for @onboardingTitle.
  ///
  /// In pt, this message translates to:
  /// **'Bem-vindo ao seu novo capítulo!'**
  String get onboardingTitle;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Antes de entrar na república, precisamos saber como você quer ser conhecido.'**
  String get onboardingSubtitle;

  /// No description provided for @warriorName.
  ///
  /// In pt, this message translates to:
  /// **'Nome do guerreiro'**
  String get warriorName;

  /// No description provided for @nameError.
  ///
  /// In pt, this message translates to:
  /// **'O nome deve ter no mínimo 3 caracteres.'**
  String get nameError;

  /// No description provided for @next.
  ///
  /// In pt, this message translates to:
  /// **'PRÓXIMO'**
  String get next;

  /// No description provided for @chooseAvatar.
  ///
  /// In pt, this message translates to:
  /// **'Escolha seu avatar!'**
  String get chooseAvatar;

  /// No description provided for @avatarIdentity.
  ///
  /// In pt, this message translates to:
  /// **'Essa será sua identidade dentro da república.'**
  String get avatarIdentity;

  /// No description provided for @back.
  ///
  /// In pt, this message translates to:
  /// **'VOLTAR'**
  String get back;

  /// No description provided for @chooseEssence.
  ///
  /// In pt, this message translates to:
  /// **'Escolha sua essência!'**
  String get chooseEssence;

  /// No description provided for @colorsSayAboutYou.
  ///
  /// In pt, this message translates to:
  /// **'As cores dizem muito sobre você.'**
  String get colorsSayAboutYou;

  /// No description provided for @finishWarriorQuestion.
  ///
  /// In pt, this message translates to:
  /// **'Deseja concluir seu guerreiro?'**
  String get finishWarriorQuestion;

  /// No description provided for @finish.
  ///
  /// In pt, this message translates to:
  /// **'CONCLUIR'**
  String get finish;

  /// No description provided for @chooseHouseTitle.
  ///
  /// In pt, this message translates to:
  /// **'Agora escolha onde vai morar'**
  String get chooseHouseTitle;

  /// No description provided for @chooseHouseSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Você pode fundar uma nova república ou entrar em uma já existente.'**
  String get chooseHouseSubtitle;

  /// No description provided for @create.
  ///
  /// In pt, this message translates to:
  /// **'CRIAR'**
  String get create;

  /// No description provided for @join.
  ///
  /// In pt, this message translates to:
  /// **'ENTRAR'**
  String get join;

  /// No description provided for @foundHouseTitle.
  ///
  /// In pt, this message translates to:
  /// **'Fundar uma nova República'**
  String get foundHouseTitle;

  /// No description provided for @foundHouseDescription.
  ///
  /// In pt, this message translates to:
  /// **'Define o nome. Toda grande história começa com alguém que decidiu dar o primeiro passo.'**
  String get foundHouseDescription;

  /// No description provided for @houseName.
  ///
  /// In pt, this message translates to:
  /// **'Nome da república'**
  String get houseName;

  /// No description provided for @joinHouseTitle.
  ///
  /// In pt, this message translates to:
  /// **'Juntar-se a uma República'**
  String get joinHouseTitle;

  /// No description provided for @joinHouseDescription.
  ///
  /// In pt, this message translates to:
  /// **'Alguém te enviou um código? Use-o para entrar e começar sua jornada.'**
  String get joinHouseDescription;

  /// No description provided for @houseCode.
  ///
  /// In pt, this message translates to:
  /// **'Código da república'**
  String get houseCode;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
