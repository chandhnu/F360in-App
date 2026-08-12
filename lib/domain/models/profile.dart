enum ProfileType { individual, family, huf, business }

class Profile {
  final String profileId;
  final String userId;
  final ProfileType profileType;
  final String legalName;
  final String displayName;
  final DateTime createdDate;
  final DateTime updatedDate;
  final String? taxIdentifier;
  final String fiscalYearStart;
  final String baseCurrency;
  final bool isActive;
  final bool isDeleted;

  Profile({
    required this.profileId,
    required this.userId,
    required this.profileType,
    required this.legalName,
    required this.displayName,
    required this.createdDate,
    required this.updatedDate,
    this.taxIdentifier,
    this.fiscalYearStart = '04-01',
    this.baseCurrency = 'INR',
    this.isActive = true,
    this.isDeleted = false,
  });

  Profile copyWith({
    String? profileId,
    String? userId,
    ProfileType? profileType,
    String? legalName,
    String? displayName,
    DateTime? createdDate,
    DateTime? updatedDate,
    String? taxIdentifier,
    String? fiscalYearStart,
    String? baseCurrency,
    bool? isActive,
    bool? isDeleted,
  }) {
    return Profile(
      profileId: profileId ?? this.profileId,
      userId: userId ?? this.userId,
      profileType: profileType ?? this.profileType,
      legalName: legalName ?? this.legalName,
      displayName: displayName ?? this.displayName,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      taxIdentifier: taxIdentifier ?? this.taxIdentifier,
      fiscalYearStart: fiscalYearStart ?? this.fiscalYearStart,
      baseCurrency: baseCurrency ?? this.baseCurrency,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile && runtimeType == other.runtimeType && profileId == other.profileId;

  @override
  int get hashCode => profileId.hashCode;
}
