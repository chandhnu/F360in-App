enum TransactionType {
  deposit,
  withdrawal,
  transferOut,
  transferIn,
  buy,
  sell,
  dividend,
  interest,
  valuation,
  loanDisbursed,
  loanPayment,
  expense,
  transferInterProfile,
}

class Transaction {
  final String transactionId;
  final String profileId;
  final TransactionType transactionType;
  final DateTime effectiveDate;
  final DateTime recordedDate;
  final String description;
  final double amount;
  final String currency;
  final String sourceId;
  final String sourceAccountId;
  final String? destAccountId;
  final String? notes;
  final bool isReconciled;
  final bool isDeleted;
  final DateTime createdTimestamp;
  final DateTime updatedTimestamp;
  final String? calculationLineage;

  Transaction({
    required this.transactionId,
    required this.profileId,
    required this.transactionType,
    required this.effectiveDate,
    required this.recordedDate,
    required this.description,
    required this.amount,
    this.currency = 'INR',
    this.sourceId = 'MANUAL',
    required this.sourceAccountId,
    this.destAccountId,
    this.notes,
    this.isReconciled = false,
    this.isDeleted = false,
    required this.createdTimestamp,
    required this.updatedTimestamp,
    this.calculationLineage,
  });

  Transaction copyWith({
    String? transactionId,
    String? profileId,
    TransactionType? transactionType,
    DateTime? effectiveDate,
    DateTime? recordedDate,
    String? description,
    double? amount,
    String? currency,
    String? sourceId,
    String? sourceAccountId,
    String? destAccountId,
    String? notes,
    bool? isReconciled,
    bool? isDeleted,
    DateTime? createdTimestamp,
    DateTime? updatedTimestamp,
    String? calculationLineage,
  }) {
    return Transaction(
      transactionId: transactionId ?? this.transactionId,
      profileId: profileId ?? this.profileId,
      transactionType: transactionType ?? this.transactionType,
      effectiveDate: effectiveDate ?? this.effectiveDate,
      recordedDate: recordedDate ?? this.recordedDate,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      sourceId: sourceId ?? this.sourceId,
      sourceAccountId: sourceAccountId ?? this.sourceAccountId,
      destAccountId: destAccountId ?? this.destAccountId,
      notes: notes ?? this.notes,
      isReconciled: isReconciled ?? this.isReconciled,
      isDeleted: isDeleted ?? this.isDeleted,
      createdTimestamp: createdTimestamp ?? this.createdTimestamp,
      updatedTimestamp: updatedTimestamp ?? this.updatedTimestamp,
      calculationLineage: calculationLineage ?? this.calculationLineage,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transaction && runtimeType == other.runtimeType && transactionId == other.transactionId;

  @override
  int get hashCode => transactionId.hashCode;
}
