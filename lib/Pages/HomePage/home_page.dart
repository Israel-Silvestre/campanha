import 'package:campanha/Pages/Regi%C3%A3oPage/show_region.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../LiderançasPage/liderancas_show_page.dart';
import 'Components/navigation_bar.dart'; // Importe o componente CustomBottomNavigationBar

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
      if (_isVisible)
        setState(() {
          _isVisible = false;
        });
    } else {
      if (!_isVisible)
        setState(() {
          _isVisible = true;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Removendo a appbar
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
                LeaderManagementPage(scrollController: _scrollController),
                RegioesPage()
                // Adicione outras páginas aqui conforme necessário
              ],
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
