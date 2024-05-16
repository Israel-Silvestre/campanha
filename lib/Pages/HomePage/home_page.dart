import 'package:flutter/material.dart';
import 'package:campanha/Pages/DemandasPage/gestao_demandas_page.dart';
import 'package:campanha/Pages/LiderançasPage/liderancas_show_page.dart';
import 'package:campanha/Pages/RegiãoPage/show_region.dart';
import 'package:flutter/rendering.dart';
import '../DemandasPage/Components/state_navbar.dart';
import 'Components/navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (_isVisible) setState(() { _isVisible = false; });
    } else {
      if (!_isVisible) setState(() { _isVisible = true; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                _buildPageWithPadding(LeaderManagementPage(scrollController: _scrollController)),
                _buildPageWithPadding(RegioesPage()),
                _buildPageWithPadding(GestaoDemandasPage()),
                // Adicione outras páginas aqui conforme necessário
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0, // Coloca o FAB no topo
            child: Visibility(
              visible: _isVisible,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 10.0), // Adicionado espaçamento no topo
                child: Center(child: _buildTopBarForIndex(_selectedIndex)),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Visibility(
              visible: _isVisible,
              child: CustomBottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildPageWithPadding(Widget page) {
    return Padding(
      padding: EdgeInsets.only(
        top: 90.0, // Ajusta para o espaço da StateNavBar
        bottom: 60.0, // Ajusta para o espaço da CustomBottomNavigationBar
      ),
      child: page,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTopBarForIndex(int index) {
    switch (index) {
      case 0:
        return StateNavBar(); // Chame o widget da barra para a página de Lideranças
      case 1:
        return StateNavBar(); // Chame o widget da barra para a página de Regiões
      case 2:
        return StateNavBar(); // Chame o widget da barra para a página de Gestão de Demandas
    // Adicione mais casos conforme necessário para outras páginas
      default:
        return Container(); // Retorne um container vazio para os casos em que não há barra
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
