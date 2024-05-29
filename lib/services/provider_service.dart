
import 'package:flutter/material.dart';
import 'package:health/models/carnet.dart';

class ProviderService with ChangeNotifier {

    Future<List<Carnet>> getCarnet() async{
      await Future.delayed(Duration(milliseconds: 2000)); // Remove this line replace it by you api

      List<Carnet> carnet = [
        Carnet(id: 2, nom: "oussama", prenom: "bjm")
      ];

      return carnet;
    }

    Future<void> addCarnet(String nom,String prenom,String dateNaissance,String lieuNaissance,String wilaya,String sexe) async{
      /** add it to your database **/

      notifyListeners();/** keep this function to update liste after add carnet **/
    }

    Future<void> Remove(Carnet carnet) async{
      /** call api to remove **/
      await Future.delayed(Duration(milliseconds: 500));
      notifyListeners();/** keep this function to update liste after remove carnet **/
    }
}

