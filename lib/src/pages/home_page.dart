import 'package:flutter/material.dart';
import 'package:practica_final_2/src/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  // Lista de las rutas
  static List<Map<String, String>> routes = getRoutesList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SPPMMD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _centralText(),
            _buttons(context),
          ],
        )
      ),
    );
  }

  // Texto Central
  Container _centralText() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Text(
        'He llegado a odiar mi propia creación, ahora sé cómo se siente Dios',
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      )
    );
  }

  // Fila de los botones
  Row _buttons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      _createButton(0, context),
      const SizedBox(width: 11),
      _createButton(1, context),
    ],
    );
  }

  // Creación de los botones
  SizedBox _createButton(int buttonIndex, BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextButton(
        child: Text(routes[buttonIndex]['text'].toString()),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.pink,
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          final route = routes[buttonIndex]['route'].toString();
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
