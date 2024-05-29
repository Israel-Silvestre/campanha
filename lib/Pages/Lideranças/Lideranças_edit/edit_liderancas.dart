import 'package:flutter/material.dart';
import '../../../Models/lideranca.dart';

class EditLiderancaPage extends StatefulWidget {
  final Lideranca lideranca;

  EditLiderancaPage({required this.lideranca});

  @override
  _EditLiderancaPageState createState() => _EditLiderancaPageState();
}

class _EditLiderancaPageState extends State<EditLiderancaPage> {
  late String _editedName;
  late int _editedVotos;
  late int _editedDemandas;
  late int _editedPendencias;

  @override
  void initState() {
    super.initState();
    _editedName = widget.lideranca.nome;
    _editedVotos = widget.lideranca.votos;
    _editedDemandas = widget.lideranca.demandas;
    _editedPendencias = widget.lideranca.pendencias;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Editar ${widget.lideranca.nome}',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name Field
            TextField(
              decoration: InputDecoration(labelText: 'Nome'),
              onChanged: (value) {
                setState(() {
                  _editedName = value;
                });
              },
              controller: TextEditingController(text: _editedName),
            ),
            SizedBox(height: 16.0),
            // Votes Field
            TextField(
              decoration: InputDecoration(labelText: 'Votos'),
              onChanged: (value) {
                setState(() {
                  _editedVotos = int.parse(value);
                });
              },
              keyboardType: TextInputType.number,
              controller: TextEditingController(text: _editedVotos.toString()),
            ),
            SizedBox(height: 16.0),
            // Demands Field
            TextField(
              decoration: InputDecoration(labelText: 'Demandas'),
              onChanged: (value) {
                setState(() {
                  _editedDemandas = int.parse(value);
                });
              },
              keyboardType: TextInputType.number,
              controller: TextEditingController(text: _editedDemandas.toString()),
            ),
            SizedBox(height: 16.0),
            // Pendências Field
            TextField(
              decoration: InputDecoration(labelText: 'Pendências'),
              onChanged: (value) {
                setState(() {
                  _editedPendencias = int.parse(value);
                });
              },
              keyboardType: TextInputType.number,
              controller: TextEditingController(text: _editedPendencias.toString()),
            ),
            SizedBox(height: 16.0),
            // Save and Cancel Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Fecha a tela de edição sem salvar
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.grey,
                  ),
                  child: Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Aqui você poderia salvar as informações editadas
                    // por exemplo, através de uma função no Model ou em um serviço
                    // ou enviar para o backend
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  ),
                  child: Text('Salvar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
