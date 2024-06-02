
import 'package:flutter/material.dart';
import 'package:health/models/carnet.dart';
import 'package:health/models/data_stored.dart';
import 'package:health/models/doctor_model.dart';
import 'package:health/services/manage_cache.dart';

class DoctorProvider with ChangeNotifier {

  Future<List<DoctorModel>> getDoctors() async{

    DataStored? dataStored = await ManageCache().dataStored();

    String id = dataStored?.id ?? "0"; /** Semep id **/

    /** use this id to get doctor of this user **/

    await Future.delayed(Duration(milliseconds: 2000)); // Remove this line replace it by you api

    List<DoctorModel> doctors = [
      DoctorModel(id:"1",email:"dc@gmail.com",number:"056675433",nom:"Ikram",prenom:"Ikram",adress:"Algeria",specialite: 'Cardio'),
      DoctorModel(id: "2", nom: "Khereze ", prenom: "Assia",number: "075556676",email: "ee@gmail.com",adress:"Algeria",specialite: "Dentiste")
    ];

    return doctors;
  }

  Future<void> addDoctor(DoctorModel doctor,String password) async{

    DataStored? dataStored = await ManageCache().dataStored();

    String id = dataStored?.id ?? "0";
    /** use this id to get carnet of this user **/


    /** add it to your database **/

    notifyListeners();/** keep this function to update liste after add carnet **/
  }

  Future<void> Remove(DoctorModel doctor) async{
    /** call api to remove **/

    String id = doctor.id;

    await Future.delayed(Duration(milliseconds: 500));
    notifyListeners();/** keep this function to update liste after remove carnet **/
  }
}

