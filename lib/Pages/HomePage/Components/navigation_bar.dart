import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final double marginLeft;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    this.marginLeft = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(left: marginLeft, bottom: 5.0, right: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  onTap(0); // Navega para a tela de gestão de lideranças
                },
                icon: Icon(Icons.people),
                color: currentIndex == 0 ? Colors.blue : Colors.grey, // Altera a cor do ícone com base no índice selecionado
              ),
              IconButton(
                onPressed: () {
                  onTap(1); // Navega para a tela de gestão de regiões
                },
                icon: Icon(Icons.location_on),
                color: currentIndex == 1 ? Colors.blue : Colors.grey, // Altera a cor do ícone com base no índice selecionado
              ),
              IconButton(
                onPressed: () {
                  onTap(2); // Navega para a tela de gestão de demandas
                },
                icon: Icon(Icons.assignment),
                color: currentIndex == 2 ? Colors.blue : Colors.grey, // Altera a cor do ícone com base no índice selecionado
              ),
              IconButton(
                onPressed: () {
                  onTap(3); // Navega para a tela de administração de contas
                },
                icon: Icon(Icons.account_balance_wallet),
                color: currentIndex == 3 ? Colors.blue : Colors.grey, // Altera a cor do ícone com base no índice selecionado
              ),
            ],
          ),
        ),
      ),
    );
  }
}
