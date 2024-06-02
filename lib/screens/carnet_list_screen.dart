import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health/models/data_stored.dart';
import 'package:health/screens/semep_ajouter_patient.dart';
import 'package:health/shared/carnet_widget.dart';
import 'package:provider/provider.dart';

import '../models/carnet.dart';
import '../models/role.dart';
import '../services/manage_cache.dart';
import '../services/provider_service.dart';
import 'doctor_profile.dart';
import 'login_screen.dart';

class CarnetListScreen extends StatefulWidget {
  DataStored? user;
  CarnetListScreen({Key? key,this.user}) : super(key: key);

  @override
  State<CarnetListScreen> createState() => _CarnetListScreenState();
}

class _CarnetListScreenState extends State<CarnetListScreen> {

  List<Carnet> carnet = [];

  int index = 0;

  Widget CarnetMList(){
    return  Consumer<ProviderService>(
        builder: (context, providerService, child) {
          return FutureBuilder(
            future: providerService.getCarnet(widget.user),
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
                            title:  Text('Confirm Supprime'),
                            content: Text('Vous etes sure supprime ?'),
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
                                child: Text('Supprime',style: TextStyle(color: Colors.redAccent),)  ,
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
        });
  }
  late List<Widget> pages;

  @override
  void initState() {
    // TODO: implement initState
    pages = [CarnetMList(),DoctorProfile(user: widget.user,)];
    getData();
    super.initState();
  }

  String role = Role.smep;

  void getData() async{
    if(widget.user != null){
      role = widget.user!.role;
    }else{
      DataStored? dataStored = await  ManageCache().dataStored();

      setState(() {
        role = dataStored?.role ?? Role.smep;

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Carnets'),

      ),
      body: pages[index],
      floatingActionButton: index !=0?null: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), // Set desired corner radius
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0), // Set to 0 for straight edge
              bottomRight: Radius.circular(10.0),
            ),),
          onPressed: (){
            Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>AjouterParentPage(user: widget.user,)));

          },
          child: Icon(Icons.add),
      ),
      bottomNavigationBar: role!=Role.doctor ? null:BottomNavigationBar(
        currentIndex: index,
        onTap: (position){
          setState(() {
            index = position;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book),tooltip: "Carnets",label: "Carnets"),
          BottomNavigationBarItem(icon: Icon(Icons.person),tooltip: "Profile",label: "Profile"),
        ],
      ),
    );
  }
}
