class Carnet {
  final String nom;
  final String prenom;
  final int id;

  Carnet({
    required this.id,
    required this.nom,
    required this.prenom,
  });

  @override
  String toString() {
    // TODO: implement toString
    return this.id.toString() +"  "+ this.nom + "  "+this.prenom;
  }
}