import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../Models/regiao.dart';
import '../../../Models/lideranca.dart';
import '../../../Persistência/região_service.dart';
import '../../../Persistência/lideranca_service.dart';
import '../CreateRegiaoPage/create_region_page.dart';
import 'Components/region_card.dart';
import 'Components/search_bar2.dart';

class RegioesPage extends StatefulWidget {
  @override
  _RegioesPageState createState() => _RegioesPageState();
}

class _RegioesPageState extends State<RegioesPage> {
  final RegiaoService _regiaoService = RegiaoService(); // Instância do serviço de regiões
  final LiderancaService _liderancaService = LiderancaService(); // Instância do serviço de lideranças
  List<Regiao> regioes = []; // Lista de regiões
  Map<String, int> liderancaCounts = {}; // Mapa para armazenar a contagem de lideranças por região

  @override
  void initState() {
    super.initState();
    _loadRegioes(); // Carrega as regiões ao iniciar a página
  }

  Future<void> _loadRegioes() async {
    try {
      List<Regiao> regioesFromDB = (await _regiaoService.getAllRegioes()).cast<Regiao>(); // Busca todas as regiões do banco
      Map<String, int> counts = {};
      for (Regiao regiao in regioesFromDB) {
        List<Lideranca> liderancas = await _liderancaService.getLiderancasByRegiaoId(int.parse(regiao.id));
        counts[regiao.id] = liderancas.length;
      }
      setState(() {
        regioes = regioesFromDB; // Atualiza a lista de regiões no estado da página
        liderancaCounts = counts; // Atualiza a contagem de lideranças
        print('Regiões do Firebase: $regioesFromDB');
        print('Contagem de lideranças: $counts');
      });
    } catch (e) {
      print('Erro ao carregar regiões: $e');
    }
  }

  void _navigateToCreateRegiaoScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateRegiaoScreen()),
    );
    _loadRegioes(); // Recarrega as regiões ao retornar da tela de criação
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
                                child: RegiaoCard(
                                  regiao: regiao,
                                  liderancaCount: liderancaCounts[regiao.id] ?? 0,
                                ),
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
                child: RegionSearchBar(regioes: regioes),
              ),
              Positioned(
                bottom: 30,
                right: 16,
                child: FloatingActionButton(
                  onPressed: _navigateToCreateRegiaoScreen,
                  backgroundColor: Colors.yellowAccent,
                  child: Icon(Icons.add, color: Colors.blue),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
