import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_pref_projet/models/contact.dart';
import 'package:shared_pref_projet/services/db_provider.dart';

import 'list_contact_page.dart';

class UpdateContactPage extends StatefulWidget {
   UpdateContactPage({Key? key,required this.id}) : super(key: key);
    int? id;

  @override
  State<UpdateContactPage> createState() => _UpdateContactPageState();


}

class _UpdateContactPageState extends State<UpdateContactPage> {

  Contact contact=Contact('', "", "");
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;
  final _formkey=GlobalKey<FormState>();




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("id : ${widget.id}");
    getArticle();
    firstNameController=TextEditingController();
    lastNameController=TextEditingController();
    phoneController=TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modification du contact "),),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Ajouter un contact"),

           monForm(),
            ElevatedButton(onPressed: addcontact, child: Text('Enregistrer')),
            ElevatedButton(onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ListContact()),
              );

              }, child: Text("Liste des Contacts"))
          ],
        ),
      ),
    );
  }

  Form monForm(){
    return Form(
      key: _formkey,

      child: Column(
        children: [
          TextFormField(

            controller: firstNameController,

            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "FirstName"
            ),

          ),
          TextFormField(

            controller: lastNameController,
            keyboardType: TextInputType.text,

            decoration: InputDecoration(
                icon: Icon(Icons.password),
                hintText: "LastName*"
            ),
          ),
          TextFormField(

            controller: phoneController,
            keyboardType: TextInputType.text,

            decoration: InputDecoration(
                icon: Icon(Icons.phone),
                hintText: "Phone"
            ),
          ),


        ],


      ),


    );
  }

  addcontact() async {

    if (_formkey.currentState!.validate()){
     await DatabaseClient().addContact(Contact(firstNameController.text, lastNameController.text, phoneController.text));
      firstNameController.text="";
      lastNameController.text="";
      phoneController.text="";

    Fluttertoast.showToast(msg: "Enregistrement réussi");
    }
  }


  getArticle() async{
    DatabaseClient().getContact(widget.id).then((value){

      setState(() {
        contact=Contact("firstname", "lastname", "phone");
      });


    });
  }


}
