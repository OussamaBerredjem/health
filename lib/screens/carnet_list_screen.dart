import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health/screens/semep_ajouter_patient.dart';
import 'package:health/shared/carnet_widget.dart';
import 'package:provider/provider.dart';

import '../models/carnet.dart';
import '../services/provider_service.dart';

class CarnetListScreen extends StatefulWidget {
  const CarnetListScreen({Key? key}) : super(key: key);

  @override
  State<CarnetListScreen> createState() => _CarnetListScreenState();
}

class _CarnetListScreenState extends State<CarnetListScreen> {

  List<Carnet> carnet = [];

  Future<List<Carnet>> v() async{
    await Future.delayed(Duration(milliseconds: 500));
    return [Carnet(id: 2, nom: "oussama", prenom: "berredjem")];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('All Carnet'),
      ),
      body:  Consumer<ProviderService>(
        builder: (context, providerService, child) {
          return FutureBuilder(
            future: providerService.getCarnet(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
                carnet = snapshot.data;

                return carnet.isNotEmpty?ListView.builder(
                    itemCount: carnet.length,
                    itemBuilder: (context,position)=>CarnetWidget(carnet: carnet[position], onRemove: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // Build the alert dialog
                          return AlertDialog(
                            title: Text('Confirm Removal'),
                            content: Text('Are you sure you want to remove item ?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, false), // Cancel
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async{

                                  await Provider.of<ProviderService>(context,listen: false).Remove(carnet[position]);
                                  Navigator.pop(context);
                                },
                                child: Text('Remove'),
                              ),
                            ],
                          );
                        },
                      );
                    })
                ):Center(
                  child: Text('Aucun Carnet Trouver'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );

            },

          );
        }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), // Set desired corner radius
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0), // Set to 0 for straight edge
              bottomRight: Radius.circular(10.0),
            ),),
          onPressed: (){
            Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>AjouterParentPage()));

          },
          child: Icon(Icons.add),
      ),
    );
  }
}
