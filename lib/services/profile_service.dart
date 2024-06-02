import 'package:health/models/data_stored.dart';
import 'package:health/services/manage_cache.dart';

import '../models/role.dart';
import '../models/user.dart';

class ProfileService{
  ManageCache manageCache = ManageCache();
  Future<User> profile(DataStored? user) async{
    if(user != null){
      String id = user.id;
      /** use this id to get profile info when the role is semep and doctor**/
      return User(nom: "from manager", prenom: "prenom", sexe: "sexe", commune: "commune", wilaya: "wilaya", dateNaissance: "dateNaissance");
    }else{
      DataStored? dataStored = await manageCache.dataStored();
      String id = dataStored?.id??"";
      /** when role is patient **/
      /** don't care about how it work just you fill the if and else only **/
      /** use the cached id to get user data **/
      return User(nom: "nom", prenom: "prenom", sexe: "sexe", commune: "commune", wilaya: "wilaya", dateNaissance: "dateNaissance");

    }
  }
}