class User {
  final String userId;
  final String name;
  final String email;
  final DateTime createdDate;
  final bool isDeleted;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.createdDate,
    this.isDeleted = false,
  });

  User copyWith({
    String? userId,
    String? name,
    String? email,
    DateTime? createdDate,
    bool? isDeleted,
  }) {
    return User(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      createdDate: createdDate ?? this.createdDate,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && userId == other.userId;

  @override
  int get hashCode => userId.hashCode;
}
