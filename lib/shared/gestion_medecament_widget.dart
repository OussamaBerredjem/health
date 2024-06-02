import 'package:flutter/material.dart';

import '../models/data_stored.dart';
import '../screens/VueAccueil.dart';

class GestionMedecamentWidget extends StatelessWidget {


  Medicament medicament;
  int index;
  Function(Medicament medicament) onRemove;
  DataStored? user;

   GestionMedecamentWidget({Key? key,required this.medicament,required this.index,required this.onRemove,this.user}) : super(key: key);

  TextEditingController _nomController = TextEditingController();
  TextEditingController _formePharmaceutiqueController = TextEditingController();
  TextEditingController _dosageController = TextEditingController();
  TextEditingController _uniteController = TextEditingController();
  TextEditingController _dateDebutController = TextEditingController();
  TextEditingController _dureeController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    _nomController.text = medicament.nom;
    _dureeController.text = medicament.duree;
    _dateDebutController.text = medicament.dateDebut;
     _uniteController.text= medicament.unite;
    _dosageController.text = medicament.dosage;
    _formePharmaceutiqueController.text = medicament.formePharmaceutique;

    double s = MediaQuery.of(context).size.width * 0.47;
    double q = MediaQuery.of(context).size.width*0.94;
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3,vertical:6),
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 12,),

          Text('Medicament $index',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

          SizedBox(height: 20,),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: s,
                child: TextField(
                  controller: _nomController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Nom",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                width: s,
      
                child: TextField(
                  controller: _formePharmaceutiqueController,
                  readOnly: true,

                  decoration: InputDecoration(
                    labelText: "Forme Pharmaceutique",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
      
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
            children: [
              Container(
                width: s,
      
                child: TextField(
                  readOnly: true,
                  controller: _dosageController,
                  decoration: InputDecoration(
                    labelText: "Dosage",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                width: s,
      
                child: TextField(
                  readOnly: true,
                  controller: _uniteController,
                  decoration: InputDecoration(
                    labelText: "Unité",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
      
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
            children: [
              Container(
                width: s,
      
      
                child: TextField(
                  readOnly: true,
                  controller: _dateDebutController,
                  decoration: InputDecoration(
                    labelText: "Date de debut",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                width: s,
      
                child: TextField(
                  readOnly: true,
                  controller: _dureeController,
                  decoration: InputDecoration(
                    labelText: "Duree",
                    suffix: Text('jour'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
      
            ],
          ),
          SizedBox(height: 8,),
          Visibility(
            visible: user != null ,
            child: OutlinedButton(onPressed: (){
              onRemove(medicament);
            }, child: Text('Supprime',style: TextStyle(color: Colors.red),),style: ButtonStyle(minimumSize: WidgetStateProperty.all<Size>(Size(q,50)),side: WidgetStateProperty.all(const BorderSide(color: Colors.redAccent)),shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),overlayColor: WidgetStateProperty.all(Colors.red.withOpacity(0.5))),),
          )

        ],
      ),
    );
  }
}
