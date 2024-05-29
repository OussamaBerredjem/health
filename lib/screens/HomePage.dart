// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';

import 'AffichageActualites.dart';
import 'VueAccueil.dart';
import 'VueProfil.dart';
import 'Vuecartes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portail Patient',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  int? id;
  MyHomePage({this.id});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portail Patient'), // Modification ici
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: _buildBody()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.home),
                Text(
                  'Accueil',
                  style: TextStyle(
                      color: Colors.white), // Changement de couleur en blanc
                ),
              ],
            ),
            backgroundColor: Colors.blue,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.credit_card),
                Text(
                  'Cartes',
                  style: TextStyle(
                      color: Colors.white), // Changement de couleur en blanc
                ),
              ],
            ),
            backgroundColor: Colors.blue,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.rss_feed),
                Text(
                  'Actualités',
                  style: TextStyle(
                      color: Colors.white), // Changement de couleur en blanc
                ),
              ],
            ),
            backgroundColor: Colors.blue,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.person),
                Text(
                  'Profil',
                  style: TextStyle(
                      color: Colors.white), // Changement de couleur en blanc
                ),
              ],
            ),
            backgroundColor: Colors.blue,
            label: '',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return VueAccueil(); // Modification ici
      case 1:
        return VueCartes(); // Modification ici
      case 2:
        return AffichageActualites(); // Modification ici
      case 3:
        if(widget.id!=null){
          return VueProfil(id: widget.id,); // Modification ici
        }else{
          return VueProfil(); // Modification ici

        }
      default:
        return Text('Error');
    }
  }
}

class CaseWidget extends StatelessWidget {
  final String caseTitle;
  final VoidCallback onTap;

  const CaseWidget({required this.caseTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            caseTitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// Pages pour chaque case

