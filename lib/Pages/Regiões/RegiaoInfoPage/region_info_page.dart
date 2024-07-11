import 'package:flutter/material.dart';
import '../../../Models/regiao.dart';
import '../../../Persistência/lideranca_service.dart';
import '../../../Models/lideranca.dart';
import '../../Lideranças/LiderançasPage/Components/lider_card.dart';
import '../../Lideranças/Lideranças_Info/liderancas_info_page.dart';

class RegionInfoPage extends StatefulWidget {
  final Regiao regiao;

  RegionInfoPage({required this.regiao});

  @override
  _RegionInfoPageState createState() => _RegionInfoPageState();
}

class _RegionInfoPageState extends State<RegionInfoPage> {
  late LiderancaService _liderancaService;
  List<Lideranca> _liderancas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _liderancaService = LiderancaService();
    _fetchLiderancas();
  }

  Future<void> _fetchLiderancas() async {
    try {
      List<Lideranca> liderancas = await _liderancaService.getLiderancasByRegiaoId(int.parse(widget.regiao.id));
      setState(() {
        _liderancas = liderancas;
        _isLoading = false;
      });
    } catch (e) {
      print('Erro ao buscar lideranças: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Informações da Região',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.regiao.imageURL),
            ),
            SizedBox(height: 16),
            Text(
              widget.regiao.nome,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: _buildCard('Demandas', widget.regiao.demandas)),
                  Expanded(child: _buildCard('Pendências', widget.regiao.pendencias)),
                  Expanded(child: _buildCard('Votos', widget.regiao.votos)),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lideranças',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            _liderancas.isEmpty
                ? Center(
              child: Text(
                'Nenhuma liderança encontrada.',
                style: TextStyle(color: Colors.black),
              ),
            )
                : Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _liderancas.length,
                itemBuilder: (context, index) {
                  return LiderCard(
                    lideranca: _liderancas[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiderancaPage(lideranca: _liderancas[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, int value) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              value.toString(),
              style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
