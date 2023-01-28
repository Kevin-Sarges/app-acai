import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/features/carrinho/presenter/screen/carrinho_screen.dart';
import 'package:app_acai/app/features/lista_produtos/presenter/screen/produtos_screen.dart';
import 'package:app_acai/app/features/registro/presenter/screen/registro_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;

  static final _screens = <Widget>[
    const ProdutosScreen(),
    const CarrinhoScreen(),
    const RegistroScreen(),
  ];

  void _onScreenTapped(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedScreenIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorsApp.purplePrimary,
        currentIndex: _selectedScreenIndex,
        onTap: _onScreenTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Registro',
          )
        ],
      ),
    );
  }
}
