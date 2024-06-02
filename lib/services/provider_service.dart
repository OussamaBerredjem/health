
import 'package:flutter/material.dart';
import 'package:health/models/carnet.dart';
import 'package:health/models/data_stored.dart';
import 'package:health/services/manage_cache.dart';

import '../models/role.dart';

class ProviderService with ChangeNotifier {

    Future<List<Carnet>> getCarnet(DataStored? user) async{

      if(user != null){
        String id_doctor = user.id; // doctor id
      }else{
        DataStored? dataStored = await ManageCache().dataStored();

        String id_doctor = dataStored?.id ?? ""; // doctor id
      }



      /** use this id to get carnet of this user **/

      await Future.delayed(Duration(milliseconds: 2000)); // Remove this line replace it by you api

      List<Carnet> carnet = [
        Carnet(id: "", nom: "Lassel", prenom: "Ikram"),
        Carnet(id: "", nom: "Khereze ", prenom: "Assia")
      ];

      return carnet;
    }

    Future<void> addCarnet(String nom,String prenom,String dateNaissance,String lieuNaissance,String wilaya,String sexe,DataStored? user) async{


      if(user !=null){
        String id_doctor = user.id;
      }else{
        DataStored? dataStored = await ManageCache().dataStored();

        String role = dataStored?.role ?? "user";

        if(role == Role.smep){
          String id_semep = dataStored?.id ?? ""; /** get carnet with semep id **/
        }else if(role == Role.doctor){
          String id_doctor = dataStored?.id ?? "";/** get carnet to doctor **/

        }
      }


      /** use this id to get carnet of this user **/


      /** add it to your database **/

      notifyListeners();/** keep this function to update liste after add carnet **/
    }

    Future<void> Remove(Carnet carnet) async{
      /** call api to remove **/

      await Future.delayed(Duration(milliseconds: 500));
      notifyListeners();/** keep this function to update liste after remove carnet **/
    }
}

