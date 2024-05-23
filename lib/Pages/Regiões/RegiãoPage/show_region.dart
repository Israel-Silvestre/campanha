import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../Models/regiao.dart';
import '../../Lideranças/LiderançasPage/Components/search_bar.dart';
import 'Components/region_card.dart';
import 'Components/search_bar2.dart';

class RegioesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Criando algumas regiões sem lideranças
    Regiao regiao1 = Regiao(
      nome: 'Moinho dos Ventos',
      liderancas: [],
      votos: 100,
      demandas: 10,
      pendencias: 5,
      imageUrl: 'assets/region.png',
      id: '1',
    );

    Regiao regiao2 = Regiao(
      nome: 'Centro',
      liderancas: [],
      votos: 150,
      demandas: 20,
      pendencias: 7,
      imageUrl: 'assets/centro.png',
      id: '2',
    );

    Regiao regiao3 = Regiao(
      nome: 'Vila de Fátima',
      liderancas: [],
      votos: 200,
      demandas: 15,
      pendencias: 10,
      imageUrl: 'assets/vila.png',
      id: '3',
    );

    List<Regiao> regioes = [regiao1, regiao2, regiao3];

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
