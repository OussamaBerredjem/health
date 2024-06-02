import 'dart:core';
import 'package:health/models/doctor_model.dart';
import 'package:health/services/manage_cache.dart';
import 'package:provider/provider.dart';

import '../models/data_stored.dart';
import '../models/role.dart';
import '../services/medecament_service.dart';
import '../shared/gestion_medecament_widget.dart';
import '/screens/HomePage.dart';
import 'package:flutter/material.dart';

import 'measure_screen.dart';

class Medicament {
  String nom;
  String formePharmaceutique;
  String dosage;
  String unite;
  String dateDebut;
  String duree; // Durée en jours
  int? id;

  Medicament({
    required this.nom,
    required this.formePharmaceutique,
    required this.dosage,
    required this.unite,
    required this.dateDebut,
    required this.duree,
    this.id
  });
}

class VueAccueil extends StatelessWidget {
  DataStored? user;
  VueAccueil({this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'asset/images/ggg.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              CaseWidget(
                caseTitle: 'Gestion de médicaments',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GestionMedicamentsPage(user: user,),
                    ),
                  );
                },
              ),
              CaseWidget(
                caseTitle: 'Rendez-vous médicaux',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RendezVousPage(),
                    ),
                  );
                },
              ),
              CaseWidget(
                caseTitle: 'Vaccinations',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VaccinationsPage(),
                    ),
                  );
                },
              ),
              CaseWidget(
                caseTitle: 'Mesures de santé',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MesuresPage(user: user,),
                    ),
                  );
                },
              ),
              CaseWidget(
                caseTitle: 'Ordonnances',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrdonnancesPage(),
                    ),
                  );
                },
              ),
              CaseWidget(
                caseTitle: 'Résultats de laboratoire',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultatsPage(),
                    ),
                  );
                },
              ),
              CaseWidget(
                caseTitle: 'Calendrier',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalendrierPage(),
                    ),
                  );
                },
              ),
              CaseWidget(
                caseTitle: 'Contactez votre médecin',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GestionMedicamentsPage extends StatefulWidget {
  DataStored? user;
  GestionMedicamentsPage({this.user});
  @override
  _GestionMedicamentsPageState createState() => _GestionMedicamentsPageState();
}

class _GestionMedicamentsPageState extends State<GestionMedicamentsPage> {


  List<Medicament> medicaments = [];

  TextEditingController _nomController = TextEditingController();
  TextEditingController _formePharmaceutiqueController = TextEditingController();
  TextEditingController _dosageController = TextEditingController();
  TextEditingController _uniteController = TextEditingController();
  TextEditingController _dateDebutController = TextEditingController();
  TextEditingController _dureeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  late DataStored dataStored;



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateDebutController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }


  void _addMedicament() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajouter un médicament'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nomController,
                  decoration: InputDecoration(labelText: 'Nom du médicament'),
                ),
                TextField(
                  controller: _formePharmaceutiqueController,
                  decoration:
                      InputDecoration(labelText: 'Forme pharmaceutique'),
                ),
                TextField(
                  controller: _dosageController,
                  decoration: InputDecoration(labelText: 'Dosage'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                TextField(
                  controller: _uniteController,
                  decoration: InputDecoration(labelText: 'Unité'),
                ),
                TextField(
                  controller: _dateDebutController,
                  readOnly: true,
                  onTap:() => _selectDate(context),
                  decoration:
                      InputDecoration(
                          labelText: 'Date de début (jj/mm/aaaa)'),
                ),
                TextField(
                  controller: _dureeController,
                  keyboardType:TextInputType.number,

                  decoration: InputDecoration(

                      labelText: 'Durée (en jours)'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ANNULER'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('AJOUTER'),
              onPressed: () async{


                  await MedecamentService().addMedicament(Medicament(
                    nom: _nomController.text,
                    formePharmaceutique: _formePharmaceutiqueController.text,
                    dosage: _dosageController.text,
                    unite:  _uniteController.text,
                    dateDebut: _dateDebutController.text,
                    duree: _dureeController.text,
                  ), widget.user);

                  _nomController.clear();
                  _formePharmaceutiqueController.clear();
                  _dosageController.clear();
                  _uniteController.clear();
                  _dureeController.clear();
                  _dateDebutController.clear();

                Navigator.pop(context);
                setState(() {

                });
              },
            ),
          ],
        );
      },
    );
  }

  void _removeMedicament(Medicament medicament) {

    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text('Confirm Supprime'),
          content: Text('Vous etes sure supprime ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, false), // Cancel
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async{
                await MedecamentService().Remove(medicament);
                Navigator.pop(context);
                setState(() {});
              },
              child: Text('Supprime',style: TextStyle(color: Colors.redAccent),),
            ),
          ],
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    String r =  widget.user?.role??"user";
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion des médicaments'),
      ),
      body: FutureBuilder<List<Medicament>>(
        future: MedecamentService().getMedicament(widget.user),
        builder: (BuildContext context, AsyncSnapshot<List<Medicament>> snapshot) {
          if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
            medicaments = snapshot.data??[];
          }
          return snapshot.connectionState == ConnectionState.done?ListView.builder(
            itemCount: medicaments.length,
            itemBuilder: (context, index) {
              debugPrint(widget.user?.role ?? "none role");
              return GestionMedecamentWidget(
                user: widget.user,
                onRemove: (medicament){
                  _removeMedicament(medicament);
                },
                medicament: medicaments[index],index: index+1,);
            },
          ):Center(
            child: CircularProgressIndicator(),
          );
          },

            ),
      floatingActionButton:widget.user==null?null:FloatingActionButton(
        onPressed: _addMedicament,
        child: Icon(Icons.add),
      ),
    );
  }
}

// Les autres classes de page (RendezVousPage, VaccinationsPage, etc.) ici...

class RendezVousPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rendez-vous médicaux'),
      ),
      body: Center(
        child: Text('Page de rendez-vous médicaux'),
      ),
    );
  }
}

class VaccinationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccinations'),
      ),
      body: Center(
        child: Text('Page de vaccinations'),
      ),
    );
  }
}

//Measure page


class OrdonnancesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordonnances'),
      ),
      body: Center(
        child: Text('Page d\'ordonnances'),
      ),
    );
  }
}

class ResultatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résultats de laboratoire'),
      ),
      body: Center(
        child: Text('Page de résultats de laboratoire'),
      ),
    );
  }
}

class CalendrierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendrier'),
      ),
      body: Center(
        child: Text('Page de calendrier'),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactez votre médecin'),
      ),
      body: Center(
        child: Text('Page de contact avec votre médecin'),
      ),
    );
  }
}
