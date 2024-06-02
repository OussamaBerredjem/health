import 'package:flutter/material.dart';
import 'package:health/models/mesure_mode.dart';
import 'package:health/models/mesure_model.dart';
import 'package:health/services/manage_cache.dart';

import '../models/data_stored.dart';

class MesureProvider extends ChangeNotifier{


  Future<List<MesureModel>> getMesures(String mesure,DataStored? user) async{

    /** dont touch this if else **/
    /** the id of user or measure detected after this if/else **/
    /** do your logic with the id after else **/
    String id ="";

    if(user != null){

    }else{
      ManageCache manageCache = ManageCache();
      DataStored? dataStored = await manageCache.dataStored();
      String id = dataStored?.id??"";
      /** when role is user **/
    }

    switch(mesure){
      case MesureMode.frequence:
        return await FrequenceGet(id);
        break;
      case MesureMode.glycemie:
        return await GlycemieGet(id);
        break;
      case MesureMode.poids:
        return await PoidsGet(id);
        break;
      case MesureMode.taille:
        return await TailleGet(id);
        break;
      case MesureMode.tansion:
        return await TensionGet(id);
        break;
      case MesureMode.tailles:
        return await TaillesGet(id);
        break;

    }
    return [];
  }

  Future<List<MesureModel>> FrequenceGet(String id) async{
    await Future.delayed(Duration(milliseconds: 500));

    List<MesureModel> list = [
      MesureModel(title: MesureMode.frequence, doze: "200", hour: "19:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.frequence, doze: "300", hour: "15:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.frequence, doze: "100", hour: "17:10",date: "21/02/2023"),
    ];

    return list;
  }
  Future<List<MesureModel>> GlycemieGet(String id) async{
    await Future.delayed(Duration(milliseconds: 500));

    List<MesureModel> list = [
      MesureModel(title: MesureMode.glycemie, doze: "200", hour: "19:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.glycemie, doze: "300", hour: "15:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.glycemie, doze: "100", hour: "17:10",date: "21/02/2023"),
    ];


    return list;
  }

  Future<List<MesureModel>> PoidsGet(String id) async{
    await Future.delayed(Duration(milliseconds: 500));

    List<MesureModel> list = [
      MesureModel(title: MesureMode.poids, doze: "200", hour: "19:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.poids, doze: "300", hour: "15:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.poids, doze: "100", hour: "17:10",date: "21/02/2023"),
    ];


    return list;
  }

  Future<List<MesureModel>> TailleGet(String id) async{
    await Future.delayed(Duration(milliseconds: 500));

    List<MesureModel> list = [
      MesureModel(title: MesureMode.taille, doze: "200", hour: "19:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.taille, doze: "300", hour: "15:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.taille, doze: "100", hour: "17:10",date: "21/02/2023"),
    ];


    return list;
  }

  Future<List<MesureModel>> TensionGet(String id) async{
    await Future.delayed(Duration(milliseconds: 500));

    List<MesureModel> list = [
      MesureModel(title: MesureMode.tansion, doze: "200", hour: "19:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.tansion, doze: "300", hour: "15:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.tansion, doze: "100", hour: "17:10",date: "21/02/2023"),
    ];


    return list;
  }
  Future<List<MesureModel>> TaillesGet(String id) async{
    await Future.delayed(Duration(milliseconds: 500));

    List<MesureModel> list = [
      MesureModel(title: MesureMode.tailles, doze: "200", hour: "19:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.tailles, doze: "300", hour: "15:10",date: "21/02/2023"),
      MesureModel(title: MesureMode.tailles, doze: "100", hour: "17:10",date: "21/02/2023"),
    ];


    return list;
  }


  /** Add  **/


  Future<void> AddMesures(MesureModel mesure,DataStored? user) async{

    /** dont touch this if else **/
    /** the id of user or measure detected after this if/else **/
    /** do your logic with the id after else **/

    String id ="";

    if(user != null){
       id = user.id;
    }else{
      ManageCache manageCache = ManageCache();
      DataStored? dataStored = await manageCache.dataStored();
       id = dataStored?.id??"";
      /** when role is user **/


    }

    switch(mesure){
      case MesureMode.frequence:
        await FrequenceAdd(mesure,id);
        break;
      case MesureMode.glycemie:
         await GlycemieAdd(mesure,id);
        break;
      case MesureMode.poids:
         await PoidsAdd(mesure,id);
        break;
      case MesureMode.taille:
         await TailleAdd(mesure,id);
        break;
      case MesureMode.tansion:
         await TensionAdd(mesure,id);
        break;
      case MesureMode.tailles:
         await TaillesAdd(mesure,id);
        break;

    }


  }


  Future<void> FrequenceAdd(MesureModel model,String id) async{
    await Future.delayed(Duration(milliseconds: 500));

   /** Add it To database **/
    notifyListeners();


  }

  Future<void> GlycemieAdd(MesureModel model,String id) async{
    await Future.delayed(Duration(milliseconds: 500));


    notifyListeners();

  }

  Future<void> PoidsAdd(MesureModel model,String id) async{
    await Future.delayed(Duration(milliseconds: 500));


    notifyListeners();


  }

  Future<void> TailleAdd(MesureModel model,String id) async{
    await Future.delayed(Duration(milliseconds: 500));



    notifyListeners();

  }

  Future<void> TensionAdd(MesureModel model,String id) async{
    await Future.delayed(Duration(milliseconds: 500));



    notifyListeners();

  }
  Future<void> TaillesAdd(MesureModel model,String id) async{
    await Future.delayed(Duration(milliseconds: 500));

    notifyListeners();


  }

}