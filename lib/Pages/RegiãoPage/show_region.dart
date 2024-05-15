import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../Models/lideranca.dart';
import '../../Models/regiao.dart';
import 'Components/region_card.dart';

class RegioesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Criando algumas regiões e lideranças de exemplo
    Regiao regiao1 = Regiao(
      nome: 'moinho dos ventos',
      liderancas: [
        Lideranca(
          nome: 'Liderança 1',
          fotoAsset: 'assets/lideranca1.png',
          votos: 50,
          regiao: 'Região Norte',
          demandas: 5,
          pendencias: 2,
        ),
      ],
      votos: 100,
      demandas: 10,
      pendencias: 5,
      imageUrl: 'assets/region.png',
    );

    Regiao regiao2 = Regiao(
      nome: 'Centro',
      liderancas: [
        Lideranca(
          nome: 'Liderança 2',
          fotoAsset: 'assets/lideranca2.png',
          votos: 60,
          regiao: 'Região Sul',
          demandas: 6,
          pendencias: 3,
        ),
      ],
      votos: 150,
      demandas: 20,
      pendencias: 7,
      imageUrl: 'assets/centro.png',
    );

    Regiao regiao3 = Regiao(
      nome: 'vila de fátima',
      liderancas: [
        Lideranca(
          nome: 'Liderança 3',
          fotoAsset: 'assets/lideranca3.png',
          votos: 70,
          regiao: 'Região Central',
          demandas: 7,
          pendencias: 4,
        ),
      ],
      votos: 200,
      demandas: 15,
      pendencias: 10,
      imageUrl: 'assets/vila.png',
    );

    List<Regiao> regioes = [regiao1, regiao2, regiao3];

    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 0,
          autoPlay: false,
        ),
        items: regioes.map((regiao) {
          return Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(40.0),
                child: RegiaoCard(regiao: regiao),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
