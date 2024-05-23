import 'package:flutter/material.dart';
import '../../../Models/demanda.dart';
import '../../../Models/regiao.dart';
import '../../../Models/lideranca.dart'; // Importe a classe Lideranca
import 'Components/demanda_card.dart';
import 'Components/state_navbar.dart';

class GestaoDemandasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Criando instâncias de Região
    final Regiao regiao1 = Regiao(
      id: '1',
      nome: 'Moinho dos Ventos',
      liderancas: [], // Preencha com uma lista de lideranças, se necessário
      votos: 100,
      demandas: 10,
      pendencias: 5,
      imageUrl: 'assets/region.png',
    );

    // Criando instâncias de Liderança
    final Lideranca lideranca1 = Lideranca(
      id: '1',
      nome: 'Líder 1',
      fotoAsset: 'assets/leader1.png',
      votos: 789,
      regiao: regiao1, // Usando a mesma instância de Regiao para todas as lideranças
      demandas: 8,
      pendencias: 2,
      telefone: '123',
    );

    final Lideranca lideranca2 = Lideranca(
      id: '2',
      nome: 'Líder 2',
      fotoAsset: 'assets/leader2.png',
      votos: 789,
      regiao: regiao1, // Usando a mesma instância de Regiao para todas as lideranças
      demandas: 8,
      pendencias: 2,
      telefone: '123',
    );

    final Lideranca lideranca3 = Lideranca(
      id: '3',
      nome: 'Líder 3',
      fotoAsset: 'assets/leader3.png',
      votos: 789,
      regiao: regiao1, // Usando a mesma instância de Regiao para todas as lideranças
      demandas: 8,
      pendencias: 2,
      telefone: '123',
    );

    // Exemplo de demandas
    final demandas = [
      Demanda(
        id: '1',
        titulo: 'Demanda 1',
        descricao: 'Descrição detalhada da demanda 1',
        regiao: regiao1, // Usando a instância de Regiao criada
        lideranca: lideranca1, // Usando a instância de Lideranca criada
        estado: EstadoDemanda.recebida,
        custo: 1500.00,
        fotoAsset: 'assets/region.png',
      ),
      Demanda(
        id: '2',
        titulo: 'Demanda 2',
        descricao: 'Descrição detalhada da demanda 2',
        regiao: regiao1, // Usando a mesma instância de Regiao para todas as demandas
        lideranca: lideranca2, // Usando a instância de Lideranca criada
        estado: EstadoDemanda.emAndamento,
        custo: 2500.00,
        fotoAsset: 'assets/centro.png',
      ),
      Demanda(
        id: '3',
        titulo: 'Demanda 3',
        descricao: 'Descrição detalhada da demanda 3',
        regiao: regiao1, // Usando a mesma instância de Regiao para todas as demandas
        lideranca: lideranca3, // Usando a instância de Lideranca criada
        estado: EstadoDemanda.urgente,
        custo: 3500.00,
        fotoAsset: 'assets/vila.png',
      ),
    ];

    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: demandas.length,
          itemBuilder: (context, index) {
            final demanda = demandas[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DemandaCard(
                demanda: demanda,
              ),
            );
          },
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: StateNavBar(),
        ),
      ],
    );
  }
}
