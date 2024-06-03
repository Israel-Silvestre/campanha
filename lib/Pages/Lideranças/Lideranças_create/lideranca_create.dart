import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../Models/lideranca.dart';
import '../../../Persistência/lideranca_service.dart';
import '../../../Models/regiao.dart';
import '../../../Persistência/região_service.dart';

class AddLiderancaPage extends StatefulWidget {
  @override
  _AddLiderancaPageState createState() => _AddLiderancaPageState();
}

class _AddLiderancaPageState extends State<AddLiderancaPage> {
  final _formKey = GlobalKey<FormState>();
  final _liderancaService = LiderancaService();
  final _regiaoService = RegiaoService();

  int id = 0;
  String nome = '';
  String fotoAsset = '';
  int votos = 0;
  int regiaoId = 0;
  String nomeRegiao = '';
  int demandas = 0;
  int pendencias = 0;
  String telefone = '';

  File? _image;

  final picker = ImagePicker();
  List<Regiao> _regioes = [];
  Regiao? _selectedRegiao;

  @override
  void initState() {
    super.initState();
    _loadRegioes();
  }

  Future<void> _loadRegioes() async {
    try {
      List<Regiao> regioesFromDB = await _regiaoService.getAllRegioes();
      setState(() {
        _regioes = regioesFromDB;
      });
    } catch (e) {
      print('Erro ao carregar regiões: $e');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        // Here you would typically upload the image to Firebase Storage and get the URL
        // For now, we are just storing the file path
        fotoAsset = pickedFile.path;
      }
    });
  }

  Future<void> _saveLideranca() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Lideranca newLideranca = Lideranca(
        id: id,
        nome: nome,
        fotoAsset: fotoAsset, // This should be the URL after uploading the image to Firebase Storage
        votos: votos,
        regiaoId: int.tryParse(_selectedRegiao?.id ?? '') ?? 0,
        nomeRegiao: _selectedRegiao?.nome ?? '',
        demandas: demandas,
        pendencias: pendencias,
        telefone: telefone,
      );

      await _liderancaService.addLideranca(newLideranca);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Liderança'),
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
                label: 'ID',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um ID';
                  }
                  return null;
                },
                onSaved: (value) {
                  id = int.parse(value!);
                },
              ),
              _buildTextField(
                label: 'Nome',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
                onSaved: (value) {
                  nome = value!;
                },
              ),
              _buildTextField(
                label: 'Votos',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número de votos';
                  }
                  return null;
                },
                onSaved: (value) {
                  votos = int.parse(value!);
                },
              ),
              _buildDropdownField(),
              _buildTextField(
                label: 'Demandas',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número de demandas';
                  }
                  return null;
                },
                onSaved: (value) {
                  demandas = int.parse(value!);
                },
              ),
              _buildTextField(
                label: 'Pendências',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número de pendências';
                  }
                  return null;
                },
                onSaved: (value) {
                  pendencias = int.parse(value!);
                },
              ),
              _buildTextField(
                label: 'Telefone',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o telefone';
                  }
                  return null;
                },
                onSaved: (value) {
                  telefone = value!;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinha os widgets no início (à esquerda)
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Alinha os widgets no início (à esquerda)
                    children: [
                      _image == null
                          ? Text('Nenhuma imagem selecionada.')
                          : Image.file(
                        _image!,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 16.0), // Espaço entre o texto/imagem e o botão
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
                  onPressed: _saveLideranca,
                  child: Text('Salvar Liderança'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,
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
    required String label,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
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
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildDropdownField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<Regiao>(
        decoration: InputDecoration(
          labelText: 'Selecione a Região',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        items: _regioes.map((regiao) {
          return DropdownMenuItem<Regiao>(
            value: regiao,
            child: Text(regiao.nome),
          );
        }).toList(),
        onChanged: (regiao) {
          setState(() {
            _selectedRegiao = regiao;
          });
        },
        value: _selectedRegiao,
      ),
    );
  }
}
