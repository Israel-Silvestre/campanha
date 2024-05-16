import 'package:flutter/material.dart';

class StateNavBar extends StatefulWidget {
  @override
  _StateNavBarState createState() => _StateNavBarState();
}

class _StateNavBarState extends State<StateNavBar> {
  String _selectedTab = "recebidas";
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollToSelectedTab();
    });

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: MediaQuery.of(context).size.width * 0.9, // Ajuste a largura aqui
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Row(
          children: [
            SizedBox(width: 20), // Espaçamento no início
            _buildNavItem("Recebidas", "recebidas"),
            SizedBox(width: 20), // Espaçamento entre os itens
            _buildNavItem("Planejamento", "planejamento"),
            SizedBox(width: 20), // Espaçamento entre os itens
            _buildNavItem("Andamento", "andamento"),
            SizedBox(width: 20), // Espaçamento entre os itens
            _buildNavItem("Concluídas", "concluidas"),
            SizedBox(width: 20), // Espaçamento no final
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String text, String tabName) {
    final isSelected = _selectedTab == tabName;
    final color = isSelected ? Colors.blue : Colors.grey;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = tabName;
        });
        _scrollToSelectedTab();
      },
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _scrollToSelectedTab() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final tabWidth = renderBox.size.width / 5; // Divide pelo número de tabs
    final selectedTabIndex = ["recebidas", "planejamento", "andamento", "concluidas"].indexOf(_selectedTab);
    final scrollTo = tabWidth * selectedTabIndex;
    _scrollController.animateTo(scrollTo, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
