import 'package:flutter/material.dart';
import 'package:health/models/data_stored.dart';
import 'package:health/models/mesure_model.dart';
import 'package:health/services/mesure_provider.dart';
import 'package:provider/provider.dart';

class MesurePageDialog extends StatefulWidget {
  String title;
  DataStored? user;
   MesurePageDialog({Key? key,required this.title,this.user}) : super(key: key);

  @override
  State<MesurePageDialog> createState() => _MesurePageDialogState();
}

class _MesurePageDialogState extends State<MesurePageDialog> {
  TextEditingController _select_date = TextEditingController();

   TextEditingController _select_hour = TextEditingController();
   TextEditingController _doze = TextEditingController();
   TextEditingController _commentaire = TextEditingController();





   Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _select_date.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),

    );
    if (picked != null) {
      setState(() {
        _select_hour.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF0F8FF),

      appBar: AppBar(
        backgroundColor: Color(0xFFF0F8FF),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,color: Colors.blueAccent,))
        ,
        actions: [
        IconButton(onPressed: () async{
          MesureModel mod = MesureModel(title: widget.title, doze:_doze.text, hour: _select_hour.text, date: _select_date.text);
          await Provider.of<MesureProvider>(context,listen: false).AddMesures(mod,widget.user);
          Navigator.pop(context);

        }, icon: Icon(Icons.check,color: Colors.blueAccent,))
      ],),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0,top: 25,right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,style: TextStyle(fontSize: 26,),),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              leading: Icon(Icons.calendar_month,color: Colors.blueGrey,),
              title: Text('Date et heure'),
              trailing: Icon(Icons.add,color: Colors.blueGrey,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: TextField(
                    controller: _select_date,
                    readOnly: true,
                      onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      hintText: 'Select Date',
                      suffixIcon: Icon(Icons.edit)

                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: TextField(
                    controller: _select_hour,
                    onTap: () => _selectTime(context),

                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Select hour',
                      suffixIcon: Icon(Icons.edit)
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              leading: Icon(Icons.notes_outlined,color: Colors.blueGrey,),
              title: Text('Information'),
              trailing: Icon(Icons.add,color: Colors.blueGrey,),
            ),
            TextFormField(
              controller: _doze,
              decoration: InputDecoration(
                hintText: "Entrer La Valeur",
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

            SizedBox(height: 8,),
            TextFormField(
              controller: _commentaire,
              decoration: InputDecoration(
                hintText: "Entrer La Comentaire",
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


          ],
        ),
      ),
    );
  }
}
