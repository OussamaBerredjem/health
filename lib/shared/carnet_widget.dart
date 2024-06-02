import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/models/data_stored.dart';
import 'package:health/screens/HomePage.dart';
import 'package:health/screens/register_screen.dart';

import '../models/carnet.dart';
import '../models/role.dart';

class CarnetWidget extends StatelessWidget {
  Carnet carnet;
  VoidCallback onRemove;

   CarnetWidget({Key? key,required this.carnet,required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white70,
      child: ListTile(
        onTap: (){
          Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>MyHomePage(user: DataStored(id:carnet.id,role: Role.user))));

        },
        title: Text(carnet.toString(),style: TextStyle(fontWeight: FontWeight.bold,),),
        trailing: IconButton(
          onPressed:onRemove,
          icon: Icon(Icons.delete,color: Colors.redAccent),
        ),
      ),
    );
  }
}
