
import 'package:flutter/material.dart';
import 'package:practica_final_2/src/widgets/pokemon_chooser.dart';

class WidgetPage extends StatefulWidget {
  const WidgetPage({Key? key}) : super(key: key);

  @override
  _WidgetPageState createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  // Índice de BottomNavigator
  int _currentIndex = 0;

  // Lista de las vistas 
  final List _pokemonViews = [
    const PokemonChooser(Colors.green, 'assets/bulbasaur.gif'),
    const PokemonChooser(Colors.red, 'assets/charmander.gif'),
    const PokemonChooser(Colors.blue, 'assets/squirtle.gif')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer & BottomNavigationBar'),
      ),
      drawer: _drawer(),
      body: _pokemonViews[_currentIndex],
      bottomNavigationBar: _bottomNavigator(context)
    );
  }

  // Menú lateral izquierdo swip
  Drawer _drawer() {
    return Drawer(
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.red, Colors.blue, Colors.grey],
                stops: [0.2, 0.5, 0.9, 1],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter
              )
            ),
            child: Column(
              children: [
                _drawerPokemon('assets/bulbasaur.gif', 0.3),
                _drawerPokemon('assets/charmander.gif', 0.3),
                _drawerPokemon('assets/squirtle.gif', 0.3),
                _drawerPokemon('assets/pokeball.png', 0.06),
              ],
            ),
          ),
        ],
      )
    );
  }

  // Secciones del Menú lateral
  SizedBox _drawerPokemon(String pokemonPath, double heigthRatio) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heigthRatio,
      child: DrawerHeader(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pokemonPath)
          ),
        ),
        child: Container(),
      ),
    );
  }

  // Barra de navegación inferior
  BottomNavigationBar _bottomNavigator(context) {
    return BottomNavigationBar(
      items: [
        _bottomItems(Icons.eco, 'Bulbasaur'),
        _bottomItems(Icons.whatshot_sharp, 'Charmander'),
        _bottomItems(Icons.water, 'Squirtle'),
      ],
      currentIndex: _currentIndex,
      selectedItemColor: changeTabColor(),
      onTap: (int index) {
        setState(() => _currentIndex = index);
      }
    );
  }
  
  // Iconos de la barra de navegación inferior
  BottomNavigationBarItem _bottomItems(IconData icon, pokemonName) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 30,
      ),
      label: pokemonName,
    );
  }

  // Cambia los colores de los iconos de la barra de navegación inferior
  changeTabColor() {
    return _currentIndex == 0
      ? Colors.green
      : _currentIndex == 1
        ? Colors.red
        : Colors.blue;
  }
}