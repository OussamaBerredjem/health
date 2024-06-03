import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/models/data_stored.dart';
import 'package:health/models/mesure_mode.dart';
import 'package:health/screens/mesure_page_dialog.dart';
import 'package:health/services/manage_cache.dart';
import 'package:health/services/mesure_provider.dart';
import 'package:health/shared/mesure_page_item_widget.dart';
import 'package:provider/provider.dart';

import '../models/mesure_model.dart';
import '../models/role.dart';

class MesurePage extends StatefulWidget {
  final String mode;
  DataStored? user;
  MesurePage(this.mode,{this.user});
  @override
  _MesurePageState createState() => _MesurePageState();
}

class _MesurePageState extends State<MesurePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRole();
  }

  String role = Role.user;
  void getRole() async{
    DataStored? dataStored  = await ManageCache().dataStored();
    role = dataStored?.role ?? Role.user;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('${widget.mode.toUpperCase()}',style: TextStyle(fontSize: 17),),
          actions: role==Role.user?[]:[
            IconButton(onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>MesurePageDialog(title: widget.mode,user:widget.user)));
            }, icon: Icon(Icons.add))
          ],
      ),
      body: Consumer<MesureProvider>(
        builder: (context, providerService, child) {
      return FutureBuilder<List<MesureModel>>(
        future: providerService.getMesures(widget.mode,widget.user),
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

