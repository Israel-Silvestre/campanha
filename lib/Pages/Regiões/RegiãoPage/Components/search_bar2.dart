import 'package:flutter/material.dart';
import '../../../../../Models/regiao.dart';

class RegionSearchBar extends StatefulWidget {
  final List<Regiao> regioes; // Lista de todas as regiões

  RegionSearchBar({required this.regioes});

  @override
  _RegionSearchBarState createState() => _RegionSearchBarState();
}

class _RegionSearchBarState extends State<RegionSearchBar> {
  List<Regiao> searchResults = []; // Lista de resultados da pesquisa

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
                        searchResults = widget.regioes
                            .where((regiao) => regiao.nome.toLowerCase().contains(value.toLowerCase()))
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
