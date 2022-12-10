import 'package:flutter/material.dart';

import '../models/items.dart';
import '../pages/database/DbPage.dart';
import '../pages/database/add_contact_page.dart';
import '../pages/file/filePage.dart';
import '../pages/sharedPref/homepage.dart';

class TabPage extends StatelessWidget {
   TabPage({Key? key}) : super(key: key);

   static List<TabItem> items=[
     TabItem("SharedPreferenced", Icon(Icons.numbers)),
     TabItem("File", Icon(Icons.palette)),
     TabItem("SQLITE", Icon(Icons.list))
   ];

   List<Tab> tabs=items.map((item) => Tab(icon: item.icon,text: item.title,)).toList();
   TabBar tabBar()=>TabBar(tabs: tabs);

   @override
  Widget build(BuildContext context) {
    return DefaultTabController(length:items.length , child: Scaffold(
      appBar: AppBar(
        title: Text("Persistence de la donnée"),
        bottom: tabBar(),
      ),
      body: TabBarView(
        children: [
          HomePage(title: 'Shared Preferenced',),
          FilePage(title: 'File ',),
          //DBPage(title: "DataBase")
          AddContactPage()
        ],

      ),
    ));
  }
}
