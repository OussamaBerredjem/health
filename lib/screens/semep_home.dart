import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/screens/carnet_list_screen.dart';
import 'package:health/screens/doctor_screen.dart';
import 'package:health/screens/semep_ajouter_patient.dart';
import 'package:health/screens/semep_profile.dart';

import '../services/manage_cache.dart';
import 'login_screen.dart';

class SemepHome extends StatefulWidget {
  const SemepHome({Key? key}) : super(key: key);

  @override
  State<SemepHome> createState() => _SemepHomeState();
}

class _SemepHomeState extends State<SemepHome> {

  int index =0;
  late List<Widget> pages = [];
  @override
  void initState() {
    // TODO: implement initState
    pages = [home(),SemepProfile()];
    super.initState();
  }

  Widget home(){
    return Container(
      child: Column(
        children: [
          ListTile(
            onTap: (){
              Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>DoctorScreen()));

            },
            title: Text("Doctors"),subtitle:Text("ajouter et manager doctor"),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('asset/images/icdoctor.png'),fit: BoxFit.cover)
              ),
            ),),
          ListTile(
            onTap: (){
              Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>CarnetListScreen()));
            },
            title: Text("Carnet"),
            subtitle:Text("ajouter et manager carnet"),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('asset/images/icpatient.png'),fit: BoxFit.cover)
              ),
            ),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),automaticallyImplyLeading: false,centerTitle: true,),

      body: pages[index],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: index,
        onTap: (position){
          setState(() {
            index = position;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize),tooltip: "Dashboard",label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.person),tooltip: "Profile",label: "Profile"),
        ],
      ),

    );
  }
}
