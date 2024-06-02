import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/role.dart';

class AuthService{


  Future<String?> Login(String email,String password) async{
    await Future.delayed(Duration(seconds: 1));//remove line

    /** get the id of the user and role => note: use your api to get it **/
    String role;

    //Response response = await Dio().post("",queryParameters: {});

    //response.data;

    if(email.contains("user")){
      role =  Role.user; /** you can switch between smep and user => note: change the rest of code also **/
    }else if(email.contains("semep")){
      role = Role.smep;
    }else{
      role = Role.doctor;
    }

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    /** store the id and role in cache => note: if login failed don't run this two lines **/
    sharedPreferences.setString("id", "id");
    sharedPreferences.setString("role", role);

    /** choose role => note: must return null if login failed **/
    return role;
  }

  Future<void> Signup(String nom,String prenom,String adress,String number,String email,String password,String type,String specilite) async{
    /** add this data to database **/
    /** verify type if semep or doctor  before add specialite cuz semep don't have it **/

  }
}