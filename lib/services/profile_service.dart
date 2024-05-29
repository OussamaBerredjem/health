import 'package:health/models/data_stored.dart';
import 'package:health/shared/manage_cache.dart';

import '../models/user.dart';

class ProfileService{
  ManageCache manageCache = ManageCache();
  Future<User> profile(int id) async{
    if(id != 0){
      /** use this id to get profile info when the role is semep **/
      return User(nom: "from manager", prenom: "prenom", sexe: "sexe", commune: "commune", wilaya: "wilaya", dateNaissance: "dateNaissance");
    }else{
      DataStored? dataStored = await manageCache.dataStored();
      int id = dataStored?.id??0;
      /** when role is user **/
      /** don't care about how it work just you fill the if and else only **/
      /** use the cached id to get user data **/
      return User(nom: "nom", prenom: "prenom", sexe: "sexe", commune: "commune", wilaya: "wilaya", dateNaissance: "dateNaissance");

    }
  }
}