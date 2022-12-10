import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_pref_projet/pages/database/update_contact_page.dart';

import '../../models/contact.dart';
import '../../services/db_provider.dart';

class ListContact extends StatefulWidget {
  const ListContact({Key? key}) : super(key: key);

  @override
  State<ListContact> createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  List<Contact> items=[];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getItemList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ma liste de contact"),),
      body: ListView.separated(itemBuilder: (context,index){
        final item=items[index];
        return ListTile(
          title: Text("${item.firstname} ${item.lastname}"),
          subtitle: Text("${item.phone}"),
          trailing:Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () async {



                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  UpdateContactPage(id: item.id)),
                );
              }, icon: Icon(Icons.edit,color: Colors.green,),),

              IconButton(onPressed: () async {
                await DatabaseClient().deleteContact(item);

                getItemList();
                Fluttertoast.showToast(msg: "Contact supprimé avec succès");
              }, icon: Icon(Icons.delete,color: Colors.red,),),
            ],
          )
        );
      },
          separatorBuilder: ((context,index)=> const Divider()), itemCount: items.length)
    );
  }



  getItemList() async {
    final fromDB=await DatabaseClient().getAllContact();
    setState(() {
      items=fromDB;
    });

  }
}
