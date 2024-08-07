import 'package:AppTuristico/view/webViewScreen/SelectLocationPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../models/localTuristico.dart';
import '../providers/locaisTuristicosProvider.dart';

class LocalTuristicoForm extends StatefulWidget {
  @override
  _LocalTuristicoFormState createState() => _LocalTuristicoFormState();
}

class _LocalTuristicoFormState extends State<LocalTuristicoForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  LatLng? _selectedLocation;
  bool _isLoading = false;

  void _loadFormData(LocalTuristico? local) {
    if (local != null) {
      _formData['id'] = local.id;
      _formData['name'] = local.name;
      _formData['description'] = local.description;
      _formData['image'] = local.image;
      _formData['location'] = local.local;
      _formData['hours'] = local.hours;
      _formData['contact'] = local.contact;

      if (local.latitude.isNotEmpty && local.longitude.isNotEmpty) {
        _selectedLocation = LatLng(double.parse(local.latitude), double.parse(local.longitude));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Locais Turísticos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              final isValid = _form.currentState!.validate();
              if (isValid) {
                _form.currentState?.save();

                setState(() {
                  _isLoading = true;
                });
                // Verifique se a localização foi selecionada
                if (_selectedLocation == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Por favor, selecione uma localização no mapa.')),
                  );
                  return;
                }

                await Provider.of<LocalTuristicoProviders>(context, listen: false).put(
                  LocalTuristico(
                    id: _formData['id'] ?? '',
                    name: _formData['name'] ?? '',
                    description: _formData['description'] ?? '',
                    image: _formData['image'] ?? '',
                    local: _formData['location'] ?? '',
                    hours: _formData['hours'] ?? '',
                    contact: _formData['contact'] ?? '',
                    latitude: _selectedLocation!.latitude.toString(),
                    longitude: _selectedLocation!.longitude.toString(),
                  ),
                );

                setState(() {
                  _isLoading = false;
                });

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator())
      :Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: "Nome"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Nome inválido";
                  }
                  if (value.trim().length < 3) {
                    return 'Nome muito curto';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['description'],
                decoration: InputDecoration(labelText: "Descrição"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Descrição inválida";
                  }
                  return null;
                },
                onSaved: (value) => _formData['description'] = value!,
              ),
              TextFormField(
                initialValue: _formData['image'],
                decoration: InputDecoration(labelText: "URL da Imagem"),
                onSaved: (value) => _formData['image'] = value!,
              ),
              TextFormField(
                initialValue: _formData['hours'],
                decoration: InputDecoration(labelText: "Horário de Funcionamento"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Horário de funcionamento inválido";
                  }
                  return null;
                },
                onSaved: (value) => _formData['hours'] = value!,
              ),
              TextFormField(
                initialValue: _formData['contact'],
                decoration: const InputDecoration(labelText: "Contato"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Contato inválido";
                  }
                  return null;
                },
                onSaved: (value) => _formData['contact'] = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final selectedLocation = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SelectLocationPage(),
                    ),
                  );
                  if (selectedLocation != null) {
                    setState(() {
                      _selectedLocation = selectedLocation;
                    });
                  }
                },
                child: Text('Selecionar Localização no Mapa'),
              ),
              if (_selectedLocation != null)
                Text(
                  'Localização selecionada: (${_selectedLocation!.latitude}, ${_selectedLocation!.longitude})',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
