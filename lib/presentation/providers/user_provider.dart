import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/user.dart';

final currentUserProvider = Provider((ref) {
  return User(
    userId: 'user_001',
    name: 'Demo User',
    email: 'user@f360in.local',
    createdDate: DateTime.now(),
  );
});
