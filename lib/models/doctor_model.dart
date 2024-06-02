class DoctorModel{
  String nom,prenom,adress,number,email,specialite;
  String id;
  DoctorModel(
      {required this.id,required this.nom,required this.prenom,required this.adress,required this.number,required this.email,required this.specialite});

  @override
  String toString() {
    // TODO: implement toString
    return this.id.toString() +"  "+ this.nom + "  "+this.prenom;
  }

}