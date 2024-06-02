import 'package:health/models/doctor_model.dart';
import 'package:health/models/semep_model.dart';

import '../models/data_stored.dart';
import 'manage_cache.dart';

class SemepProfileService{
  ManageCache manageCache = ManageCache();
  Future<SemepModel> profile() async{

    await Future.delayed(Duration(milliseconds: 500));

      DataStored? dataStored = await manageCache.dataStored();
      String id = dataStored?.id??"";


      return SemepModel(id: "", nom: "Khereze ", prenom: "Assia",number: "075556676",email: "ee@gmail.com",adress:"Algeria");


  }
}