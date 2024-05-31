import '/screens/HomePage.dart';
import 'package:flutter/material.dart';

import 'measure_screen.dart';

class Medicament {
  String nom;
  String formePharmaceutique;
  double dosage;
  String unite;
  DateTime dateDebut;
  int duree; // Durée en jours

  Medicament({
    required this.nom,
    required this.formePharmaceutique,
    required this.dosage,
    required this.unite,
    required this.dateDebut,
    required this.duree,
  });
}

class VueAccueil extends StatelessWidget {
  int? id;
  VueAccueil({this.id});

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
                      builder: (context) => GestionMedicamentsPage(),
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
                      builder: (context) => MesuresPage(id: id,),
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
  @override
  _GestionMedicamentsPageState createState() => _GestionMedicamentsPageState();
}

class _GestionMedicamentsPageState extends State<GestionMedicamentsPage> {
  List<Medicament> medicaments = [];

  void _addMedicament() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _nomController = TextEditingController();
        TextEditingController _formePharmaceutiqueController =
            TextEditingController();
        TextEditingController _dosageController = TextEditingController();
        TextEditingController _uniteController = TextEditingController();
        TextEditingController _dateDebutController = TextEditingController();
        TextEditingController _dureeController = TextEditingController();

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
                  decoration:
                      InputDecoration(labelText: 'Date de début (jj/mm/aaaa)'),
                ),
                TextField(
                  controller: _dureeController,
                  decoration: InputDecoration(labelText: 'Durée (en jours)'),
                  keyboardType: TextInputType.number,
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
              onPressed: () {
                setState(() {
                  final nom = _nomController.text;
                  final formePharmaceutique =
                      _formePharmaceutiqueController.text;
                  final dosage = double.parse(_dosageController.text);
                  final unite = _uniteController.text;
                  final dateDebut = DateTime.parse(_dateDebutController.text);
                  final duree = int.parse(_dureeController.text);

                  final medicament = Medicament(
                    nom: nom,
                    formePharmaceutique: formePharmaceutique,
                    dosage: dosage,
                    unite: unite,
                    dateDebut: dateDebut,
                    duree: duree,
                  );

                  medicaments.add(medicament);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _removeMedicament(int index) {
    setState(() {
      medicaments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion des médicaments'),
      ),
      body: ListView.builder(
        itemCount: medicaments.length,
        itemBuilder: (context, index) {
          final medicament = medicaments[index];
          return ListTile(
            title: Text(medicament.nom),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Forme pharmaceutique: ${medicament.formePharmaceutique}'),
                Text('Dosage: ${medicament.dosage} ${medicament.unite}'),
                Text('Date de début: ${medicament.dateDebut}'),
                Text('Durée: ${medicament.duree} jours'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeMedicament(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
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
