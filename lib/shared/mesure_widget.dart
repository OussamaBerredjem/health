import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/models/data_stored.dart';
import 'package:health/screens/mesure_page.dart';

class MesureWidget extends StatelessWidget {
  final String title,subtitle,image;
  DataStored? user;

   MesureWidget({Key? key,required this.title,required this.image,required this.subtitle,this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(builder: (context)=>MesurePage(title,user: user,)));
      },
      title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(subtitle),
      trailing:const Icon(Icons.arrow_forward_ios_sharp),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
        )
      ),

    );
  }
}
