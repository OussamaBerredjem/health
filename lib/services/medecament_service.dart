import 'package:health/models/data_stored.dart';
import 'package:health/screens/VueAccueil.dart';
import 'package:health/services/manage_cache.dart';

class MedecamentService{

  Future<List<Medicament>> getMedicament(DataStored? user) async{

    if(user != null){
      /** this mode doctor or semep **/
      DataStored? dataStored = await ManageCache().dataStored();

      String id = dataStored?.id ?? "0"; /** Semep id **/
      String id_user = user.id ; /** user id **/

    }else{
      DataStored? dataStored = await ManageCache().dataStored();

      String id = dataStored?.id ?? "0"; /** user id **/
    }



    /** use this id to get doctor of this user **/

    await Future.delayed(Duration(milliseconds: 2000)); // Remove this line replace it by you api

    List<Medicament> medicament = [
      Medicament(id:1,nom: "Glycemie", formePharmaceutique: "Glycemie", dosage: "10", unite: "ml", dateDebut: "12/05/2022", duree: "20"),
    ];

    return medicament;
  }

  Future<void> addMedicament(Medicament medicament,DataStored? user) async{

    DataStored? cached = await ManageCache().dataStored();

    String id_semep_or_doctor = cached?.id ?? "";
    String id_user = user?.id ?? "";
    /** use this id to add medicament of this user **/


    /** add it to your database **/

  }

  Future<void> Remove(Medicament medicament) async{
    /** call api to remove **/

    int id = medicament.id!;

    await Future.delayed(Duration(milliseconds: 500));
  }
}

