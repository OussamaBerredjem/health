import 'package:flutter/cupertino.dart';

class User{
  String nom,prenom,sexe,commune,wilaya,dateNaissance;

  User(
      {
        required this.nom,
        required this.prenom,
        required this.sexe,
        required this.commune,
        required this.wilaya,
        required this.dateNaissance
      }
      );
}