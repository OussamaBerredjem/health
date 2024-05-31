import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/models/mesure_mode.dart';
import 'package:health/screens/mesure_page_dialog.dart';
import 'package:health/services/mesure_provider.dart';
import 'package:health/shared/mesure_page_item_widget.dart';
import 'package:provider/provider.dart';

import '../models/mesure_model.dart';

class MesurePage extends StatefulWidget {
  final String mode;
  int? id;
  MesurePage(this.mode,{this.id});
  @override
  _MesurePageState createState() => _MesurePageState();
}

class _MesurePageState extends State<MesurePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('${widget.mode.toUpperCase()}',style: TextStyle(fontSize: 17),),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>MesurePageDialog(title: widget.mode,id:widget.id)));
            }, icon: Icon(Icons.add))
          ],
      ),
      body: Consumer<MesureProvider>(
        builder: (context, providerService, child) {
      return FutureBuilder<List<MesureModel>>(
        future: providerService.getMesures(widget.mode,widget.id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            List<MesureModel> list = snapshot.data;
            return ListView.builder(
              itemCount: list.length, // replace with your item count
              itemBuilder: (context, index) {
                return MesurePageItemWidget(isFirst: index==0, isLast: index == (list.length-1), title: widget.mode, dose: "2000",hour: "20:10",);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },

      );}
      )
    );
  }
}

