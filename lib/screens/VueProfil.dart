import 'package:flutter/material.dart';
import 'package:health/services/profile_service.dart';

import '../models/user.dart';

class VueProfil extends StatefulWidget {

  int? id;

  VueProfil({this.id});

  @override
  State<VueProfil> createState() => _VueProfilState();
}

class _VueProfilState extends State<VueProfil> {

  ProfileService profileService = ProfileService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: profileService.profile(widget.id??0),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
          User user = snapshot.data;
          return SingleChildScrollView(
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
                    user.nom,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                _buildInfoCard(Icons.cake, 'Date de Naissance', user.dateNaissance),
                SizedBox(height: 10),
                _buildInfoCard(Icons.person, 'Sexe', user.sexe),
                SizedBox(height: 10),
                _buildInfoCard(Icons.location_city, 'Commune', user.commune),
                SizedBox(height: 10),
                _buildInfoCard(Icons.map, 'Wilaya', user.wilaya),
              ],
            ),

          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
    },

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