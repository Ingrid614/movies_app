class Commission{
  Commission({
    required this.commissionId,
    required this.userId,
    required this.commandeId,
    required this.taux,
    required this.montantCommission
});
  final int commissionId;
  final int userId;
  final int commandeId;
  final double taux;
  final double montantCommission;
}