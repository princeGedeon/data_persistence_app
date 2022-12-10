
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_pref_projet/models/Individu.dart';

import 'package:shared_pref_projet/pages/file/secondpagefile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilePage extends StatefulWidget {
  const FilePage({Key? key,required this.title}) : super(key: key);
  final String title;
  //final Storage storage;
  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  final _formkey=GlobalKey<FormState>();
  late TextEditingController nomcontroller;
  late TextEditingController prenomcontroller;
  late TextEditingController profController;

  Individu current=Individu(nom: "", prenom: "", profession: "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nomcontroller=TextEditingController();
    prenomcontroller=TextEditingController();
    profController=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nomcontroller.dispose();
    prenomcontroller.dispose();
    profController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Form(key: _formkey
            ,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(

                    controller: nomcontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(

                      icon: Icon(Icons.edit),
                      hintText: "Noms *"
                  ),


                )
                ,
                TextFormField(
                  controller: prenomcontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Prenoms *"
                  ),


                ),
                TextFormField(
                  controller: profController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      icon: Icon(Icons.electric_meter),
                      hintText: "Profession *"
                  ),


                ),
                ElevatedButton(onPressed: () async{

                  if (_formkey.currentState!.validate()){
                    current=Individu(nom: nomcontroller.text, prenom: prenomcontroller.text, profession: profController.text);
                      final prefs=await SharedPreferences.getInstance();

                      Fluttertoast.showToast(msg: "Enregistrement effectué avec succès");
                  }
                }, child: Text("Valider")),
              ],

            )),
            ElevatedButton(onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  PageSecondFile()),
              );

            }, child: Text("Passage page suivante--->"))
          ],
        ),

      ),
    );

  }
}
