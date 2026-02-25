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
            fontSize: 42,
            fontWeight: FontWeight.w700,
            color: Color(0xFF153968),
          ),
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color(0xFF153968),
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
          ),
          bodySmall: TextStyle(
            fontSize: 13,
          ),
        ).apply(
          bodyColor: Color(0xFF153968)
        ),
        colorScheme: const ColorScheme.light(
          //brightness: brightness, 
          primary: Color(0xFF7CA391), 
          //onPrimary: onPrimary,   
          secondary: Color(0xFF153968), 
          //onSecondary: onSecondary, 
          error: Color.fromARGB(255, 255, 124, 124), 
          onError: Color(0xFF77B882), 
          //surface: surface, 
          //onSurface: onSurface
        ),
        bottomSheetTheme: const BottomSheetThemeData(
            dragHandleColor: Color(0xFF153968)  
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
