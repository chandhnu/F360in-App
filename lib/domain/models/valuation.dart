enum DataConfidence { verified, estimated, outdated }

class Valuation {
  final String valuationId;
  final String profileId;
  final String assetId;
  final DateTime valuationDate;
  final double pricePerUnit;
  final String source;
  final DataConfidence dataConfidence;
  final DateTime lastUpdated;
  final bool isDeleted;

  Valuation({
    required this.valuationId,
    required this.profileId,
    required this.assetId,
    required this.valuationDate,
    required this.pricePerUnit,
    this.source = 'MANUAL',
    this.dataConfidence = DataConfidence.estimated,
    required this.lastUpdated,
    this.isDeleted = false,
  });

  Valuation copyWith({
    String? valuationId,
    String? profileId,
    String? assetId,
    DateTime? valuationDate,
    double? pricePerUnit,
    String? source,
    DataConfidence? dataConfidence,
    DateTime? lastUpdated,
    bool? isDeleted,
  }) {
    return Valuation(
      valuationId: valuationId ?? this.valuationId,
      profileId: profileId ?? this.profileId,
      assetId: assetId ?? this.assetId,
      valuationDate: valuationDate ?? this.valuationDate,
      pricePerUnit: pricePerUnit ?? this.pricePerUnit,
      source: source ?? this.source,
      dataConfidence: dataConfidence ?? this.dataConfidence,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Valuation && runtimeType == other.runtimeType && valuationId == other.valuationId;

  @override
  int get hashCode => valuationId.hashCode;
}
