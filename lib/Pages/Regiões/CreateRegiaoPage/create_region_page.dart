import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Models/regiao.dart';
import '../../../Persistência/região_service.dart';

class CreateRegiaoScreen extends StatefulWidget {
  @override
  _CreateRegiaoScreenState createState() => _CreateRegiaoScreenState();
}

class _CreateRegiaoScreenState extends State<CreateRegiaoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _regiaoService = RegiaoService();
  final _nomeController = TextEditingController();
  final _demandasController = TextEditingController();
  final _pendenciasController = TextEditingController();
  final _votosController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _addRegiao() async {
    if (_formKey.currentState!.validate()) {
      if (_image != null) {
        // Exibe o showDialog com CircularProgressIndicator
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 16),
                    Text("Criando região"),
                  ],
                ),
              ),
            );
          },
        );

        try {
          Regiao regiao = Regiao(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            nome: _nomeController.text,
            imageURL: '',
            demandas: int.parse(_demandasController.text),
            pendencias: int.parse(_pendenciasController.text),
            votos: int.parse(_votosController.text),
          );

          await _regiaoService.addRegiao(regiao, _image!);
          Navigator.of(context).pop(); // Fecha o showDialog após a conclusão
          Navigator.of(context).pop(); // Fecha a tela atual após a adição da região
        } catch (e) {
          Navigator.of(context).pop(); // Fecha o showDialog em caso de erro
          print('Erro ao adicionar região: $e');
        }
      } else {
        print('Por favor, selecione uma imagem.');
      }
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _demandasController.dispose();
    _pendenciasController.dispose();
    _votosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Região'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                controller: _nomeController,
                label: 'Nome',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _demandasController,
                label: 'Demandas',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número de demandas';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _pendenciasController,
                label: 'Pendências',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número de pendências';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _votosController,
                label: 'Votos',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número de votos';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _image == null
                          ? Text('Nenhuma imagem selecionada.')
                          : Image.file(
                        _image!,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton.icon(
                        onPressed: _pickImage,
                        icon: Icon(Icons.attach_file),
                        label: Text('Anexar Foto'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: _addRegiao,
                  child: Text('Adicionar Região'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}
