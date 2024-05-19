import 'package:campanha/Pages/HomePage/Components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:campanha/Pages/DemandasPage/gestao_demandas_page.dart';
import 'package:campanha/Pages/LiderançasPage/liderancas_show_page.dart';
import 'package:campanha/Pages/RegiãoPage/show_region.dart';
import '../DemandasPage/Components/state_navbar.dart';
import '../GastosPage/show_gastos.dart';
import 'Components/navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PageController _pageController;
  bool _showSearchBar = true;

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
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            if (scrollNotification.scrollDelta! < 0 && !_showSearchBar) {
              setState(() {
                _showSearchBar = true;
              });
            } else if (scrollNotification.scrollDelta! > 0 && _showSearchBar) {
              setState(() {
                _showSearchBar = false;
              });
            }
          }
          return false;
        },
        child: Stack(
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
                        FinanceScreen(),
                      ],
                    ),
                  ),
                  SizedBox(height: 60), // Adicionando espaço para a barra de navegação
                ],
              ),
            ),
            if (_showSearchBar)
              Container(
                child: _buildWidgetForIndex(_selectedIndex),
              ),
          ],
        ),
      ),
      floatingActionButton: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        height: 60.0, // Defina a altura desejada aqui
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildWidgetForIndex(int index) {
    switch (index) {
      case 0:
        return SearchBar1(); // Use o widget desejado para o índice 0
      case 1:
        return SearchBar1(); // Widget para o índice 1, adicione conforme necessário
      case 2:
        return StateNavBar(); // Widget para o índice 2, adicione conforme necessário
      default:
        return Container();
    }
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
