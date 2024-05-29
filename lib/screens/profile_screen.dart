import 'package:flutter/material.dart';

class VueProfil extends StatefulWidget {
  @override
  State<VueProfil> createState() => _VueProfilState();
}

class _VueProfilState extends State<VueProfil> {
  // Informations factices du patient pour cet exemple
  final String nom = "lasseL Ikram";

  final String numeroTelephone = "";

  final String dateNaissance = "29/07/2003";

  final String sexe = "Féminin";

  final String commune = "Mostaganem";

  final String wilaya = "Mostaganem";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Suppression du titre
        title: null,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20), // Ajustez ce padding pour monter l'avatar
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                  NetworkImage('https://via.placeholder.com/150'),
                ),
              ),
            ),
            SizedBox(
                height:
                10), // Ajustez cet espace pour obtenir le positionnement désiré
            Center(
              child: Text(
                nom,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            _buildInfoCard(Icons.cake, 'Date de Naissance', dateNaissance),
            SizedBox(height: 10),
            _buildInfoCard(Icons.person, 'Sexe', sexe),
            SizedBox(height: 10),
            _buildInfoCard(Icons.location_city, 'Commune', commune),
            SizedBox(height: 10),
            _buildInfoCard(Icons.map, 'Wilaya', wilaya),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String label, String value) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(icon, size: 30, color: Colors.blue),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Text(
                  value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}