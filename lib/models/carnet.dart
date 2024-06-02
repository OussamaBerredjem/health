class Carnet {
  final String nom;
  final String prenom;
  final String id;

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