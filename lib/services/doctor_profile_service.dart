import 'package:health/models/doctor_model.dart';

import '../models/data_stored.dart';
import 'manage_cache.dart';

class DoctorProfileService{
  ManageCache manageCache = ManageCache();
  Future<DoctorModel> profile(DataStored? user) async{

    await Future.delayed(Duration(milliseconds: 500));

    if(user != null){
      String id = user.id;
      /** use this id to get profile info when the role is semep and doctor**/
      return DoctorModel(id: "2", nom: "Khereze ", prenom: "Assia",number: "075556676",email: "ee@gmail.com",adress:"Algeria",specialite: "Cardio");
    }else{
      DataStored? dataStored = await manageCache.dataStored();
      String id = dataStored?.id??"0";
      /** when role is patient **/
      /** don't care about how it work just you fill the if and else only **/
      /** use the cached id to get user data **/
      return DoctorModel(id: "2", nom: "Khereze ", prenom: "Assia",number: "075556676",email: "ee@gmail.com",adress:"Algeria",specialite: "Cardio");

    }
  }
}