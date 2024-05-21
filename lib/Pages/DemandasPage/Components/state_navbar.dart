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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      width: MediaQuery.of(context).size.width - 20, // Ajuste a largura aqui
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
            SizedBox(width: 30), // Espaçamento entre os itens
            _buildNavItem("Em Andamento", "Em andamento"),
            SizedBox(width: 25), // Espaçamento entre os itens
            _buildNavItem("Urgentes", "urgentes"),
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
      },
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}