import 'package:flutter/material.dart';
import '../Demandas/DemandasPage/gestao_demandas_page.dart';
import '../Lideranças/LiderançasPage/liderancas_show_page.dart';
import '../Regiões/RegiãoPage/show_region.dart';
import 'Components/navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Evita que o conteúdo seja redimensionado quando o teclado aparece
      appBar: null,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade900, Colors.blue.shade400],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    children: [
                      LeaderManagementPage(),
                      RegioesPage(),
                      GestaoDemandasPage(),
                    ],
                  ),
                ),
                SizedBox(height: 60), // Adicionando espaço para a barra de navegação
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        height: 60.0, // Defina a altura desejada aqui
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
