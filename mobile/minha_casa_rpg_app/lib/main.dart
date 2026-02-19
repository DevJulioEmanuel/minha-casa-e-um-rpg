import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/navigation/routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark, 
      statusBarColor: Colors.transparent, // Topo
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    ProviderScope(
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Minha Casa RPG',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Cinzel',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Cinzel_Decorative',
            fontSize: 45,
            fontWeight: FontWeight.w700,
            color: Color(0xFF153968)
          ),
          titleLarge: TextStyle(
            fontFamily: 'Cinzel',
            fontSize: 45,
            fontWeight: FontWeight.w700,
            color: Color(0xFF153968)
          ),
          bodySmall: TextStyle(
            fontSize: 12
          ),
          bodyMedium: TextStyle(
            fontSize: 16
          )
        ),
        colorScheme: const ColorScheme.light(
          //brightness: brightness, 
          primary: Color(0xff60A7CD), 
          //onPrimary: onPrimary,   
          secondary: Color(0xFF153968), 
          //onSecondary: onSecondary, 
          //error: error, 
          onError: Color(0xff60CD64), 
          //surface: surface, 
          //onSurface: onSurface
        )
      ),
      routerConfig: routes,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],  
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
