
import 'package:flutter/material.dart';
import 'package:health/models/carnet.dart';
import 'package:health/models/data_stored.dart';
import 'package:health/services/manage_cache.dart';

class ProviderService with ChangeNotifier {

    Future<List<Carnet>> getCarnet() async{

      DataStored? dataStored = await ManageCache().dataStored();

      int id = dataStored?.id ?? 0;

      /** use this id to get carnet of this user **/

      await Future.delayed(Duration(milliseconds: 2000)); // Remove this line replace it by you api

      List<Carnet> carnet = [
        Carnet(id: 1, nom: "Lassel", prenom: "Ikram"),
        Carnet(id: 2, nom: "Khereze ", prenom: "Assia")
      ];

      return carnet;
    }

    Future<void> addCarnet(String nom,String prenom,String dateNaissance,String lieuNaissance,String wilaya,String sexe) async{

      DataStored? dataStored = await ManageCache().dataStored();

      int id = dataStored?.id ?? 0;
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

