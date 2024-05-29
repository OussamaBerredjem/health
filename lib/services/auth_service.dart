import 'package:shared_preferences/shared_preferences.dart';

import '../models/role.dart';

class AuthService{


  Future<String?> Login(String email,String password) async{
    await Future.delayed(Duration(seconds: 2));//remove line

    /** get the id of the user and role => note: use your api to get it **/

    int id = 2;
    Role.smep; /** you can switch between smep and user => note: change the rest of code also **/

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    /** store the id and role in cache => note: if login failed don't run this two lines **/
    sharedPreferences.setInt("id", id);
    sharedPreferences.setString("role", Role.smep);

    /** choose role => note: must return null if login failed **/
    return Role.smep;
  }

  Future<void> Signup(String nom,String prenom,String adress,String number,String email,String password,String type,String specilite) async{
    /** add this data to database **/
    /** verify type if semep or doctor  before add specialite cuz semep don't have it **/

  }
}