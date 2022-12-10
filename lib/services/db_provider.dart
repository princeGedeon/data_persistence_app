import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_pref_projet/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient{
  //2Tables
  //Tables 1 =>Liste des taches à faires (title,id,status)
  //Table 2 => Liste des objets .(Nom,prix,magazin,image,id_tache,id)
  //INTEGER, TEXT, REAL,
  //INTEGER PRIMARY KEY pour id unique
  // TEXT NOT NULL

  //Accéder à la database
  Database? _database;
  Future<Database> get database async{
    if (_database!=null) return _database!;
    return await createDatabase();
  }

  Future<Database> createDatabase() async{

    Directory directory=await getApplicationDocumentsDirectory();
    final path=join(directory.path,"annuaire_contact.db");

    return await openDatabase(path,version: 1,
        onCreate: onCreate
    );

  }
  onCreate(Database database,int version) async{


    await database.execute("""
      CREATE TABLE Contact (
      $columnId INTEGER NOT NULL PRIMARY KEY,
      $columnfirstname TEXT NOT NULL,
      $columnlastname  TEXT NOT NULL,
      $columnPhone TEXT NOT NULL); 
      """);
  }


  //Future close() async =>
  Future<bool> addContact (Contact contact) async{

    Database db=await database;

    await db.insert("Contact",contact.toMap());

    return true;
  }

  Future<List<Contact>> allContact() async{
    Database db=await database;
    const query="SELECT * FROM Contact";

    List<Map<String,dynamic>> mapList= await db.rawQuery(query);
    return mapList.map((e) => Contact.fromMap(e)).toList();
    // mapList.map((e) => ItemList.fromJson(e)).toList();
  }

  Future<Contact?> getContact(int? id) async{
    Database db=await database;
    List<Map<String,dynamic>> maps=await db.query('Contact',
        columns: [columnId,columnfirstname,columnlastname,columnPhone],
        where:"$columnId = ?",
        whereArgs: [id]);
    print(maps);
    if (maps.length>0){
      return Contact.fromMap(maps.first);
      }
    return null;



  }

  Future<List<Contact>> getAllContact() async{
    Database db=await database;
    const query="SELECT * FROM Contact";

    List<Map<String,dynamic>> mapList= await db.rawQuery(query);
    return mapList.map((e) => Contact.fromMap(e)).toList();
  }

  Future<bool> deleteContact(Contact contact) async{
    Database db=await database;
    await db.delete('Contact',where: "$columnId = ?",whereArgs:[contact.id]);

    //await db.delete("Article",where: "task= ?",whereArgs: [contact.id]);
    return true;
  }


}