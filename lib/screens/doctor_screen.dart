import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/models/doctor_model.dart';
import 'package:health/screens/ajouter_doctor_screen.dart';
import 'package:health/shared/doctor_item.dart';
import 'package:provider/provider.dart';

import '../services/doctor_provider.dart';
import '../services/provider_service.dart';
import '../shared/carnet_widget.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Doctors'),
      ),
      body:  Consumer<DoctorProvider>(
          builder: (context, providerService, child) {
            return FutureBuilder<List<DoctorModel>>(
              future: providerService.getDoctors(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.hasData && snapshot.connectionState == ConnectionState.done){
                  List<DoctorModel> doctors = snapshot.data;

                  return doctors.isNotEmpty?ListView.builder(
                      itemCount: doctors.length,
                      itemBuilder: (context,position)=>DoctorItem(

                          doctorModel: doctors[position],
                          onRemove: (){
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

                                    await Provider.of<DoctorProvider>(context,listen: false).Remove(doctors[position]);
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
          Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>AjouterDoctorScreen()));

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
