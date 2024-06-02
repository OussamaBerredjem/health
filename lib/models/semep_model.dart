class SemepModel{
  String nom,prenom,adress,number,email;
  String id;
  SemepModel(
      {required this.id,required this.nom,required this.prenom,required this.adress,required this.number,required this.email});

  @override
  String toString() {
    // TODO: implement toString
    return this.nom + " "+this.prenom;
  }

}