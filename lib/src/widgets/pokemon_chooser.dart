import 'package:flutter/material.dart';

// Devuelve una vista con el color de fondo y la imágen pasada al constructor
class PokemonChooser extends StatelessWidget {

  final Color color;
  final String pokemon;

  const PokemonChooser(this.color, this.pokemon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        image: DecorationImage(image: AssetImage(pokemon), fit: BoxFit.cover),
      ),
    );
  }
}