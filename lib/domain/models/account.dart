enum AccountType {
  savingsAccount,
  fixedDeposit,
  investmentAccount,
  realEstate,
  business,
  liability,
  insurance,
  pension,
  vehicle,
  commodity,
}

class Account {
  final String accountId;
  final String profileId;
  final AccountType accountType;
  final String accountName;
  final String? accountNumber;
  final String currency;
  final String? institution;
  final DateTime openedDate;
  final DateTime? closedDate;
  final bool isActive;
  final bool isReconciled;
  final DateTime? lastReconciledDate;
  final DateTime createdDate;
  final DateTime updatedDate;
  final bool isDeleted;

  Account({
    required this.accountId,
    required this.profileId,
    required this.accountType,
    required this.accountName,
    this.accountNumber,
    this.currency = 'INR',
    this.institution,
    required this.openedDate,
    this.closedDate,
    this.isActive = true,
    this.isReconciled = false,
    this.lastReconciledDate,
    required this.createdDate,
    required this.updatedDate,
    this.isDeleted = false,
  });

  Account copyWith({
    String? accountId,
    String? profileId,
    AccountType? accountType,
    String? accountName,
    String? accountNumber,
    String? currency,
    String? institution,
    DateTime? openedDate,
    DateTime? closedDate,
    bool? isActive,
    bool? isReconciled,
    DateTime? lastReconciledDate,
    DateTime? createdDate,
    DateTime? updatedDate,
    bool? isDeleted,
  }) {
    return Account(
      accountId: accountId ?? this.accountId,
      profileId: profileId ?? this.profileId,
      accountType: accountType ?? this.accountType,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      currency: currency ?? this.currency,
      institution: institution ?? this.institution,
      openedDate: openedDate ?? this.openedDate,
      closedDate: closedDate ?? this.closedDate,
      isActive: isActive ?? this.isActive,
      isReconciled: isReconciled ?? this.isReconciled,
      lastReconciledDate: lastReconciledDate ?? this.lastReconciledDate,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Account && runtimeType == other.runtimeType && accountId == other.accountId;

  @override
  int get hashCode => accountId.hashCode;
}
