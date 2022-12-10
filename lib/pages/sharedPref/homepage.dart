import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_pref_projet/models/Individu.dart';
import 'package:shared_pref_projet/pages/sharedPref/secondpage.dart';
import 'package:shared_pref_projet/services/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key,required this.title}) : super(key: key);
  String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey=GlobalKey<FormState>();
  late TextEditingController nomcontroller;
  late TextEditingController prenomcontroller;
  late TextEditingController profController;
  final storage=Storage();
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
            Text("SharedPreferenced",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w300),),
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
                     storage.writeData(current.toMap().toString());

                      Fluttertoast.showToast(msg: "Enregistrement effectué avec succès");
                  }
                }, child: Text("Valider")),
              ],

            )),
            ElevatedButton(onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  PageSecond()),
              );

            }, child: Text("Passage page suivante--->"))
          ],
        ),

      ),
    );

  }
}
