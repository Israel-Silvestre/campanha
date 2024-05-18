import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final double height;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    this.height = 60.0, // Altura padrão
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0), // Reduzir o padding vertical
          child: GNav(
            gap: 8,
            activeColor: Colors.blue,
            iconSize: 24, // Mantém o tamanho do ícone
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Ajusta o preenchimento para ícones e texto
            duration: Duration(milliseconds: 300),
            tabBackgroundColor: Colors.blue.withOpacity(0.1),
            color: Colors.grey,
            tabs: [
              GButton(
                icon: Icons.people,
                text: 'Lideranças',
                textStyle: TextStyle(fontSize: 14.0), // Mantém o tamanho do texto
              ),
              GButton(
                icon: Icons.location_on,
                text: 'Regiões',
                textStyle: TextStyle(fontSize: 14.0), // Mantém o tamanho do texto
              ),
              GButton(
                icon: Icons.assignment,
                text: 'Demandas',
                textStyle: TextStyle(fontSize: 14.0), // Mantém o tamanho do texto
              ),
              GButton(
                icon: Icons.account_balance_wallet,
                text: 'Financeiro',
                textStyle: TextStyle(fontSize: 14.0), // Mantém o tamanho do texto
              ),
            ],
            selectedIndex: currentIndex,
            onTabChange: onTap,
          ),
        ),
      ),
    );
  }
}
