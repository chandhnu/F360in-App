enum GoalType { retirement, education, purchase, debtPayoff, investmentTarget, custom }
enum Priority { low, medium, high }

class Goal {
  final String goalId;
  final String profileId;
  final String goalName;
  final GoalType goalType;
  final double targetAmount;
  final DateTime targetDate;
  final Priority priority;
  final String? description;
  final DateTime createdDate;
  final DateTime updatedDate;
  final bool isActive;
  final bool isDeleted;

  Goal({
    required this.goalId,
    required this.profileId,
    required this.goalName,
    required this.goalType,
    required this.targetAmount,
    required this.targetDate,
    this.priority = Priority.medium,
    this.description,
    required this.createdDate,
    required this.updatedDate,
    this.isActive = true,
    this.isDeleted = false,
  });

  Goal copyWith({
    String? goalId,
    String? profileId,
    String? goalName,
    GoalType? goalType,
    double? targetAmount,
    DateTime? targetDate,
    Priority? priority,
    String? description,
    DateTime? createdDate,
    DateTime? updatedDate,
    bool? isActive,
    bool? isDeleted,
  }) {
    return Goal(
      goalId: goalId ?? this.goalId,
      profileId: profileId ?? this.profileId,
      goalName: goalName ?? this.goalName,
      goalType: goalType ?? this.goalType,
      targetAmount: targetAmount ?? this.targetAmount,
      targetDate: targetDate ?? this.targetDate,
      priority: priority ?? this.priority,
      description: description ?? this.description,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Goal && runtimeType == other.runtimeType && goalId == other.goalId;

  @override
  int get hashCode => goalId.hashCode;
}
