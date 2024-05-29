import 'package:health/models/data_stored.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageCache{
  Future<DataStored?> dataStored()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int id = sharedPreferences.getInt("id")??0;
    String role = sharedPreferences.getString("role")??"";

    if(id !=0 && role.isNotEmpty){
      return DataStored(id: id, role: role);
    }
    return null;

  }
}