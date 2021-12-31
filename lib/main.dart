import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:practica_final_2/src/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica Final 2',
      debugShowCheckedModeBanner: false,

      // Rutas
      initialRoute: '/',
      routes: getRoutes(),
      onGenerateRoute: (RouteSettings settings) => goToErrorPage(),

      // Locations (Para DatePicker en PersonalPage)
      supportedLocales: const [Locale('es', 'ES')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      // Tema Oscuro y rosa
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
      ),
    );
  }
}
