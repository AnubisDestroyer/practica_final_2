import 'package:flutter/material.dart';
import 'package:practica_final_2/src/pages/home_page.dart';
import 'package:practica_final_2/src/pages/personal_page.dart';
import 'package:practica_final_2/src/pages/widget_page.dart';

// Rutas
Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'personal-page': (BuildContext context) => const PersonalPage(),
    'widget-page': (BuildContext context) => const WidgetPage(),
  };
}

// Ruta en caso de errores
MaterialPageRoute goToErrorPage() {
  return MaterialPageRoute(builder: (BuildContext context) => const HomePage());
}

// Listado de rutas
List<Map<String, String>> getRoutesList() {
  return const [
    {
      'route': 'personal-page',
      'text': 'PersonalPage'
    },
    {
      'route': 'widget-page',
      'text': 'WidgetPage'
    },
  ];
}