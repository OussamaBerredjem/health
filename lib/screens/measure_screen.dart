import'package:flutter/material.dart';
import 'package:health/models/data_stored.dart';
import 'package:health/models/mesure_mode.dart';

import '../shared/mesure_widget.dart';

class MesuresPage extends StatelessWidget {

  DataStored? user;

  MesuresPage({DataStored? user});
  var i = const[
    "asset/images/frequence.png",
    "asset/images/glycimie.png",
    "asset/images/poids.png",
    "asset/images/tall.jpg",
    "asset/images/tansion.jpg",
    "asset/images/taille.png"
  ];

  var t = const[
    MesureMode.frequence,
    MesureMode.glycemie,
    MesureMode.poids,
    MesureMode.taille,
    MesureMode.tansion,
    MesureMode.tailles
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesures de santé'),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context,position)=>MesureWidget(title: t[position],subtitle: "",image: i[position],user:user)
      )
    );
  }
}
