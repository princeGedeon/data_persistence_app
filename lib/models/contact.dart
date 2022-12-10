final String tableContact = 'contacts';
final String columnId = '_id';
final String columnfirstname = 'firstname';
final String columnlastname = 'lastname';
final String columnPhone = 'phone';

class Contact {
  int? id;
  String? firstname;
  String? lastname;
  String? phone;


  Contact(this.firstname, this.lastname, this.phone);

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnfirstname: firstname,
      columnlastname: lastname,
      columnPhone:columnPhone,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }



  Contact.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    firstname = map[columnfirstname];
    lastname = map[columnlastname];
    phone=map[columnPhone];
  }
}
