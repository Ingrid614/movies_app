class Commande{
  Commande({
    required this.commandeId,
    required this.createdAt,
    required this.userId,
    required this.clientId,
    required this.adresseKin,
    required this.montant,
    required this.cout,
    required this.statutId
});
  final int commandeId;
  final DateTime createdAt;
  final int userId;
  final int clientId;
  final String adresseKin;
  final double montant;
  final double cout;
  final int statutId;


}