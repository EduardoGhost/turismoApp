import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/localTuristico.dart';
import '../providers/locaisTuristicosProvider.dart';


class LocalTuristicoForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  LocalTuristicoForm({super.key});

  void _loadFormData(LocalTuristico? local) {
    if (local != null) {
      _formData['id'] = local.id;
      _formData['name'] = local.name;
      _formData['description'] = local.description;
      _formData['imageUrl'] = local.image;
      _formData['location'] = local.local;
      _formData['hours'] = local.hours;
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = ModalRoute.of(context)?.settings.arguments as LocalTuristico?;
    _loadFormData(local);

    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Locais Turísticos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState?.save();

                Provider.of<LocalTuristicoProviders>(context, listen: false).put(
                  LocalTuristico(
                    id: _formData['id'] ?? '',
                    name: _formData['name'] ?? '',
                    description: _formData['description'] ?? '',
                    image: _formData['imageUrl'] ?? '',
                    local: _formData['location'] ?? '',
                    hours: _formData['hours'] ?? '',
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
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
                initialValue: _formData['imageUrl'],
                decoration: InputDecoration(labelText: "URL da Imagem"),
                onSaved: (value) => _formData['imageUrl'] = value!,
              ),
              TextFormField(
                initialValue: _formData['location'],
                decoration: InputDecoration(labelText: "Localização"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Localização inválida";
                  }
                  return null;
                },
                onSaved: (value) => _formData['location'] = value!,
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
            ],
          ),
        ),
      ),
    );
  }
}
