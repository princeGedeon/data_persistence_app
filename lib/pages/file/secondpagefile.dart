import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_pref_projet/models/Individu.dart';
import 'package:shared_pref_projet/services/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageSecondFile extends StatefulWidget {
  const PageSecondFile({Key? key}) : super(key: key);

  @override
  State<PageSecondFile> createState() => _PageSecondFileState();
}

class _PageSecondFileState extends State<PageSecondFile> {

  Individu curr=Individu(nom: "", prenom: "", profession: "");
  String data="";

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
        title: Text("File | Second Page"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text("Mes informations",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign:TextAlign.center,),
          SizedBox(height: 15,),

          Text("data: ${data}"),




        ],
      ),
    );
  }

  Future<String?> getDatas() async{

    setState(() {
      //curr=Individu(nom: prefs.getString("nom_data").toString(), prenom: prefs.getString("prenom_data").toString(), profession: prefs.getString("prof_data").toString());
      data=Storage().readData() as String;




    });

  }
}
