import 'package:flutter/material.dart';
import '../../../Models/demanda.dart';
import '../../../Persistência/demanda_service.dart';
import 'Components/demanda_card.dart';
import 'Components/state_navbar.dart';

class GestaoDemandasPage extends StatefulWidget {
  @override
  _GestaoDemandasPageState createState() => _GestaoDemandasPageState();
}

class _GestaoDemandasPageState extends State<GestaoDemandasPage> {
  final DemandaService _demandaService = DemandaService(); // Instância do serviço de demanda
  List<Demanda> demandas = []; // Lista de demandas

  @override
  void initState() {
    super.initState();
    _loadDemandas(); // Carrega as demandas ao iniciar a página
  }

  Future<void> _loadDemandas() async {
    try {
      List<Demanda> demandasFromDB = (await _demandaService.getAllDemandas()).cast<Demanda>(); // Busca todas as demandas do banco
      setState(() {
        demandas = demandasFromDB; // Atualiza a lista de demandas no estado da página
      });
    } catch (e) {
      print('Erro ao carregar demandas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
          top: 10,
          left: 0,
          right: 0,
          child: StateNavBar(),
        ),
      ],
    );
  }
}
