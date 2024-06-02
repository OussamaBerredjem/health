import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/models/data_stored.dart';
import 'package:health/models/doctor_model.dart';
import 'package:health/screens/carnet_list_screen.dart';

import '../models/role.dart';
import '../screens/HomePage.dart';

class DoctorItem extends StatelessWidget {
  DoctorModel doctorModel;
  VoidCallback onRemove;
  DoctorItem({Key? key,required this.doctorModel,required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white70,
      child: ListTile(
        onTap: (){
          Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>CarnetListScreen(user: DataStored(id:doctorModel.id,role: Role.doctor),)));

        },
        title: Text(doctorModel.toString(),style: TextStyle(fontWeight: FontWeight.bold,),),
        trailing: IconButton(
          onPressed:onRemove,
          icon: Icon(Icons.delete,color: Colors.redAccent),
        ),
      ),
    );;
  }
}
