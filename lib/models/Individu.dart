class Individu{
  String nom;
  String prenom;
  String profession;

  Individu({required this.nom, required this.prenom,required this.profession});


  Map<String, dynamic> toMap() {
    return {
      "nom": this.nom,
      "prenom": this.prenom,
      "profession": this.profession,
    };
  }

  factory Individu.fromMap(Map<String, dynamic> json) {
    return Individu(
      nom: json["nom"],
      prenom: json["prenom"],
      profession: json["profession"],
    );
  }
//

}