import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/models/data_stored.dart';
import 'package:health/models/doctor_model.dart';
import 'package:health/models/semep_model.dart';
import 'package:health/services/doctor_profile_service.dart';
import 'package:health/services/semep_profile_service.dart';

import '../services/manage_cache.dart';
import 'login_screen.dart';

class SemepProfile extends StatefulWidget {
  DataStored? user;
  SemepProfile({Key? key,this.user}) : super(key: key);

  @override
  State<SemepProfile> createState() => _SemepProfileState();
}

class _SemepProfileState extends State<SemepProfile> {
  @override
  Widget build(BuildContext context) {
    SemepProfileService semepProfileService = SemepProfileService();

    return  FutureBuilder<SemepModel>(
      future: semepProfileService.profile(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
          SemepModel user = snapshot.data;
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
                        backgroundImage:AssetImage("asset/images/icsemep.png")
                    ),
                  ),
                ),
                SizedBox(
                    height:
                    10), // Ajustez cet espace pour obtenir le positionnement désiré
                Center(
                  child: Text(
                    user.nom +" "+user.prenom,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                _buildInfoCard(Icons.cake, 'Telephone', user.number),
                SizedBox(height: 10),
                _buildInfoCard(Icons.person, 'Email', user.email),
                SizedBox(height: 10),
                _buildInfoCard(Icons.location_city, 'Adress', user.adress),
                SizedBox(height: 10),

                ElevatedButton(
                  style: ButtonStyle(minimumSize: WidgetStateProperty.all(Size(MediaQuery.of(context).size.width*0.84,50))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Logout',style: TextStyle(fontSize: 21),),
                      SizedBox(width: 20,),
                      Icon(Icons.logout)
                    ],
                  ),
                  onPressed: () async{
                    await ManageCache().Remove();
                    Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context)=>LoginScreen()), (route){
                      return false;
                    });
                  },
                ),

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
