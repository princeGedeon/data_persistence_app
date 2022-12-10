import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_pref_projet/models/Individu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageSecond extends StatefulWidget {
  const PageSecond({Key? key}) : super(key: key);

  @override
  State<PageSecond> createState() => _PageSecondState();
}

class _PageSecondState extends State<PageSecond> {

  Individu curr=Individu(nom: "", prenom: "", profession: "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatas();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shared | seconde page"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text("Mes informations",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign:TextAlign.center,),
          SizedBox(height: 15,),

          Text("Noms: ${curr.nom}"),
          Text("Prénoms: ${curr.prenom}"),
          Text("Profeesseur: ${curr.profession}"),



        ],
      ),
    );
  }

  Future<String?> getDatas() async{
    final prefs=await SharedPreferences.getInstance();
    setState(() {
      curr=Individu(nom: prefs.getString("nom_data").toString(), prenom: prefs.getString("prenom_data").toString(), profession: prefs.getString("prof_data").toString());





    });

  }
}
