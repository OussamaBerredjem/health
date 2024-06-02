// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health/services/provider_service.dart';
import 'package:provider/provider.dart';

import '../models/carnet.dart';
import '../models/data_stored.dart';


class AjouterParentPage extends StatefulWidget {

  DataStored? user;

  AjouterParentPage({this.user});

  @override
  _AjouterParentPageState createState() => _AjouterParentPageState();
}

class _AjouterParentPageState extends State<AjouterParentPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _dateNaissanceController = TextEditingController();
  final _communeNaissanceController = TextEditingController();
  String? _selectedSexe;
  String? _selectedWilaya;

  List<Carnet> carnets = [];

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _dateNaissanceController.dispose();
    _communeNaissanceController.dispose();
    super.dispose();
  }

  void _submitForm() async{
    if (_formKey.currentState?.validate() ?? false) {
     await Provider.of<ProviderService>(context,listen: false).addCarnet(_nomController.text, _prenomController.text, _dateNaissanceController.text, _communeNaissanceController.text, _selectedWilaya.toString(), _selectedSexe.toString(),widget.user);
      Navigator.pop(context);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateNaissanceController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  List<String> _generateWilayas() {
    return List<String>.generate(58, (index) => 'Wilaya ${index + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau Carnet'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                controller: _nomController,
                label: 'Nom',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: _prenomController,
                label: 'Prénom',
                icon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un prénom';
                  }
                  return null;
                },
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: _buildTextField(
                    controller: _dateNaissanceController,
                    label: 'Date de Naissance',
                    icon: Icons.calendar_today,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer une date de naissance';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              _buildTextField(
                controller: _communeNaissanceController,
                label: 'Commune de Naissance',
                icon: Icons.location_city,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une commune de naissance';
                  }
                  return null;
                },
              ),
              _buildDropdown(
                value: _selectedWilaya,
                label: 'Wilaya de Naissance',
                items: _generateWilayas(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedWilaya = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une wilaya de naissance';
                  }
                  return null;
                },
              ),
              _buildDropdown(
                value: _selectedSexe,
                label: 'Sexe',
                items: ['Masculin', 'Féminin'],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSexe = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner le sexe';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Ajouter'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  textStyle: TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
    required IconData icon,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String label,
    required List<String> items,
    required void Function(String?) onChanged,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
