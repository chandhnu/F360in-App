enum AssetClass { equity, debt, mf, fd, gold, realEstate, cash, other }

class Holding {
  final String holdingId;
  final String accountId;
  final String assetId;
  final String assetName;
  final AssetClass assetClass;
  final double quantity;
  final double costBasisPerUnit;
  final double currentPricePerUnit;
  final double? currentValue;
  final double? costBasisTotal;
  final double? unrealizedGainLoss;
  final double accumulatedDividendInterest;
  final DateTime acquisitionDate;
  final DateTime lastPriceUpdate;
  final bool isActive;
  final bool isDeleted;

  Holding({
    required this.holdingId,
    required this.accountId,
    required this.assetId,
    required this.assetName,
    required this.assetClass,
    required this.quantity,
    required this.costBasisPerUnit,
    required this.currentPricePerUnit,
    this.currentValue,
    this.costBasisTotal,
    this.unrealizedGainLoss,
    this.accumulatedDividendInterest = 0,
    required this.acquisitionDate,
    required this.lastPriceUpdate,
    this.isActive = true,
    this.isDeleted = false,
  });

  bool get isLiability => assetClass == AssetClass.debt;

  Holding copyWith({
    String? holdingId,
    String? accountId,
    String? assetId,
    String? assetName,
    AssetClass? assetClass,
    double? quantity,
    double? costBasisPerUnit,
    double? currentPricePerUnit,
    double? currentValue,
    double? costBasisTotal,
    double? unrealizedGainLoss,
    double? accumulatedDividendInterest,
    DateTime? acquisitionDate,
    DateTime? lastPriceUpdate,
    bool? isActive,
    bool? isDeleted,
  }) {
    return Holding(
      holdingId: holdingId ?? this.holdingId,
      accountId: accountId ?? this.accountId,
      assetId: assetId ?? this.assetId,
      assetName: assetName ?? this.assetName,
      assetClass: assetClass ?? this.assetClass,
      quantity: quantity ?? this.quantity,
      costBasisPerUnit: costBasisPerUnit ?? this.costBasisPerUnit,
      currentPricePerUnit: currentPricePerUnit ?? this.currentPricePerUnit,
      currentValue: currentValue ?? this.currentValue,
      costBasisTotal: costBasisTotal ?? this.costBasisTotal,
      unrealizedGainLoss: unrealizedGainLoss ?? this.unrealizedGainLoss,
      accumulatedDividendInterest: accumulatedDividendInterest ?? this.accumulatedDividendInterest,
      acquisitionDate: acquisitionDate ?? this.acquisitionDate,
      lastPriceUpdate: lastPriceUpdate ?? this.lastPriceUpdate,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Holding && runtimeType == other.runtimeType && holdingId == other.holdingId;

  @override
  int get hashCode => holdingId.hashCode;
}
