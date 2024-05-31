import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../Models/regiao.dart';
import '../../../Persistência/região_service.dart';
import 'Components/region_card.dart';
import 'Components/search_bar2.dart';

class RegioesPage extends StatefulWidget {
  @override
  _RegioesPageState createState() => _RegioesPageState();
}

class _RegioesPageState extends State<RegioesPage> {
  final RegiaoService _regiaoService = RegiaoService(); // Instância do serviço de regiões
  List<Regiao> regioes = []; // Lista de regiões

  @override
  void initState() {
    super.initState();
    _loadRegioes(); // Carrega as regiões ao iniciar a página
  }

  Future<void> _loadRegioes() async {
    try {
      List<Regiao> regioesFromDB = (await _regiaoService.getAllRegioes()).cast<Regiao>(); // Busca todas as regiões do banco
      setState(() {
        regioes = regioesFromDB; // Atualiza a lista de regiões no estado da página
        print('Regiões do Firebase: $regioesFromDB');
      });
    } catch (e) {
      print('Erro ao carregar regiões: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 16),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 400.0,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          initialPage: 0,
                          autoPlay: false,
                          viewportFraction: 1,
                        ),
                        items: regioes.map((regiao) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: RegiaoCard(regiao: regiao),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: RegionSearchBar(regioes: regioes,),
              ),
            ],
          );
        },
      ),
    );
  }
}
