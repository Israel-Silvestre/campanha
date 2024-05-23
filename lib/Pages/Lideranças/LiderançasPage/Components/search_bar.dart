import 'package:flutter/material.dart';
import '../../../../../Models/lideranca.dart';

class SearchBar1 extends StatefulWidget {
  final List<Lideranca> liderancas; // Lista de todas as lideranças

  SearchBar1({required this.liderancas});

  @override
  _SearchBar1State createState() => _SearchBar1State();
}

class _SearchBar1State extends State<SearchBar1> {
  List<Lideranca> searchResults = []; // Lista de resultados da pesquisa

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 10,
      right: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Container(
            height: 50, // Defina a altura desejada para a barra de pesquisa
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      // Chamada da função de pesquisa ao alterar o texto
                      setState(() {
                        searchResults = widget.liderancas
                            .where((lideranca) => lideranca.nome.toLowerCase().contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Pesquisar',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.blue, // Cor azul para o ícone de pesquisa
                  onPressed: () {
                    // Lógica de pesquisa aqui (opcional)
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
