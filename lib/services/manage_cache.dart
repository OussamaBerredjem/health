import 'package:health/models/data_stored.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageCache{
  Future<DataStored?> dataStored()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = sharedPreferences.getString("id")??"";
    String role = sharedPreferences.getString("role")??"";

    if(id.isNotEmpty && role.isNotEmpty){
      return DataStored(id: id, role: role);
    }
    return null;

  }

  Future<void> Remove()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("id");
    sharedPreferences.remove("role")??"";

  }
}