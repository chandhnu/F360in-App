# F360in Architecture Guide

## Overview

F360in follows **Clean Architecture** with clear separation of concerns across 4 layers:

```
┌─────────────────────────────────────────┐
│     Presentation Layer (Flutter UI)     │
│  Pages, Widgets, Providers, Models      │
└──────────────┬──────────────────────────┘
               │
┌──────────────▼──────────────────────────┐
│    Application Layer (Services)         │
│  Business Logic, Riverpod Providers     │
└──────────────┬──────────────────────────┘
               │
┌──────────────▼──────────────────────────┐
│      Domain Layer (Business Rules)      │
│  Models, Repositories (Interfaces)      │
└──────────────┬──────────────────────────┘
               │
┌──────────────▼──────────────────────────┐
│      Data Layer (Persistence)           │
│  SQLite, DataSources, Repositories      │
└─────────────────────────────────────────┘
```

## Layer Responsibilities

### 1. Presentation Layer (`lib/presentation/`)

**Responsibility**: Handle all UI and user interaction

**Components**:
- `pages/` - Full-screen widgets (routes)
- `widgets/` - Reusable UI components
- `providers/` - Riverpod state providers
- `models/` - UI-specific data models

**Key Rules**:
- ✅ No business logic
- ✅ No database access
- ✅ Use Riverpod for state
- ✅ Use GoRouter for navigation
- ✅ Make UI reactive

**Example**:
```dart
class HomePage extends ConsumerStatefulWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read from providers
    final data = ref.watch(sampleDataProvider);
    
    // Build UI
    return Scaffold(...);
  }
}
```

### 2. Application Layer (`lib/application/`)

**Responsibility**: Coordinate between Presentation and Domain/Data

**Components**:
- `providers/` - Business logic providers
- `services/` - Application services
- `use_cases/` - Specific business operations (future)

**Key Rules**:
- ✅ No UI code
- ✅ Implement business rules
- ✅ Convert between data formats
- ✅ Handle state management
- ✅ Coordinate domain & data

**Example** (future):
```dart
final profileServiceProvider = Provider((ref) {
  final database = ref.watch(sqliteDatabaseProvider);
  return ProfileService(database);
});
```

### 3. Domain Layer (`lib/domain/`)

**Responsibility**: Define business entities and interfaces

**Components**:
- `models/` - Pure Dart data entities
- `repositories/` - Abstract repository interfaces
- `exceptions.dart` - Custom exceptions

**Key Rules**:
- ✅ Pure Dart (no Flutter)
- ✅ No database dependencies
- ✅ Define "what the app does"
- ✅ Use interfaces, not implementations
- ✅ Immutable data classes

**Example**:
```dart
// Pure Dart, no Flutter dependencies
class Profile {
  final String profileId;
  final String displayName;
  
  Profile copyWith({String? displayName}) => Profile(...);
}

// Abstract interface
abstract class ProfileRepository {
  Future<Profile> getProfile(String id);
}
```

### 4. Data Layer (`lib/data/`)

**Responsibility**: Handle persistence and external data sources

**Components**:
- `datasources/local/` - SQLite database
  - `sqlite_database.dart` - Singleton
  - `migrations/` - Schema versions
- `repositories/` - Repository implementations
- `models/` - Data transfer objects (future)

**Key Rules**:
- ✅ Implement repository interfaces
- ✅ Handle database operations
- ✅ Convert data formats
- ✅ Error handling
- ✅ Query optimization

**Example** (future):
```dart
class ProfileRepositoryImpl implements ProfileRepository {
  final SQLiteDatabase _database;
  
  @override
  Future<Profile> getProfile(String id) async {
    final db = await _database.database;
    final result = await db.query('profiles', where: 'profile_id = ?', whereArgs: [id]);
    return Profile.fromMap(result.first);
  }
}
```

## Data Flow

### Unidirectional Data Flow

```
1. User interacts with UI
        ↓
2. Presentation calls Provider/Service
        ↓
3. Application Service processes request
        ↓
4. Domain Service applies business rules
        ↓
5. Data Repository fetches/saves
        ↓
6. SQLite Database performs I/O
        ↓
7. Result flows back up through layers
        ↓
8. UI updates automatically (Riverpod watches)
```

### Example: Loading Profile Data

```
HomePage (UI)
    ↓
    └→ ref.watch(profileProvider)
        ↓
        ProfileProvider (Riverpod)
            ↓
            ProfileService (Application)
                ↓
                ProfileRepository.getProfile() (Domain Interface)
                    ↓
                    ProfileRepositoryImpl (Data)
                        ↓
                        SQLiteDatabase.query()
                            ↓
                            SQLite (returns data)
                        ↓
                    ProfileRepositoryImpl (converts to Profile)
                        ↓
                    ProfileService (applies logic)
                        ↓
                    ProfileProvider (emits data)
                        ↓
                    HomePage (rebuilds with new data)
```

## State Management (Riverpod)

### Provider Types Used

**StateProvider**: Simple mutable state
```dart
final selectedProfileProvider = StateProvider<ProfileType>((ref) {
  return ProfileType.individual;
});
```

**Provider**: Immutable computed state
```dart
final currentUserProvider = Provider((ref) {
  return User(userId: 'user_001', ...);
});
```

**FutureProvider**: Async data (future)
```dart
final profileFutureProvider = FutureProvider((ref) async {
  final repo = ref.watch(profileRepositoryProvider);
  return repo.getProfile('prof_001');
});
```

### Riverpod Best Practices

✅ **DO**:
- Keep providers small and focused
- Use `ref.watch()` in UI
- Use `ref.read()` in callbacks
- Create separate providers for related data
- Use `.select()` to watch specific fields

❌ **DON'T**:
- Mix UI logic in providers
- Call database directly from UI
- Create circular provider dependencies
- Watch providers in setState
- Mutate data directly (use copyWith)

## Navigation (GoRouter)

Routes defined in `lib/config/routes.dart`:

```dart
final goRouterProvider = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(path: '/accounts', builder: (context, state) => AccountsPage()),
    // ...
  ],
);
```

## Theme & Design System

Centralized in `lib/config/themes.dart`:
- Color palette
- Typography
- Component styles
- Spacing system

```dart
class AppTheme {
  static const Color wealthGreen = Color(0xFF00C853);
  static const Color darkBackground = Color(0xFF0A0E27);
  
  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.dark(primary: wealthGreen),
      textTheme: ...,
      // ...
    );
  }
}
```

## Error Handling

### Exception Hierarchy

```dart
ServiceException        // API/service errors
  ├─ code: String
  ├─ message: String
  └─ details: Map

RepositoryException    // Data access errors
  ├─ message: String
  └─ originalError: dynamic

ValidationException    // Input validation errors
  └─ message: String
```

## Database Schema

9 tables with proper relationships:

```
users
  ├─ profile (1:N)
  │   ├─ account (1:N)
  │   │   ├─ transaction (1:N)
  │   │   └─ holding (1:N)
  │   ├─ goal (1:N)
  │   └─ valuation (1:N)
```

Indexes for performance:
- `idx_users_email` - ON users(email)
- `idx_profiles_user_type` - ON profiles(user_id, profile_type)
- `idx_transactions_date` - ON transactions(effective_date)
- And more...

## Testing Strategy

### Unit Tests (Domain & Data)
```dart
test('Profile copyWith preserves data', () {
  final profile = Profile(...);
  final updated = profile.copyWith(displayName: 'New Name');
  expect(updated.displayName, 'New Name');
});
```

### Widget Tests (Presentation)
```dart
testWidgets('HomePage displays net worth', (tester) async {
  await tester.pumpWidget(MaterialApp(home: HomePage()));
  expect(find.byText('Net Worth'), findsOneWidget);
});
```

## Code Organization Guidelines

### File Naming
- Classes: `PascalCase` → `profile.dart`
- Functions: `camelCase` → `calculateNetWorth()`
- Constants: `UPPER_SNAKE_CASE` → `DEFAULT_CURRENCY`

### Directory Structure
```
lib/
├── domain/           ← Pure business logic
├── data/             ← Concrete implementations
├── presentation/     ← UI only
├── config/           ← Global configuration
└── utils/            ← Shared utilities
```

### Imports Order
```dart
// 1. Dart imports
import 'dart:async';

// 2. Flutter imports
import 'package:flutter/material.dart';

// 3. Package imports
import 'package:riverpod/riverpod.dart';

// 4. Relative imports
import '../../domain/models/profile.dart';
```

## Performance Considerations

### Database Queries
- Use indexes wisely
- Batch operations when possible
- Lazy load large datasets (future)
- Cache frequently accessed data

### State Management
- Use `.select()` to watch specific fields
- Avoid unnecessary rebuilds
- Keep providers focused and small
- Use `.family` for multiple instances (future)

### UI Rendering
- Limit widget tree depth
- Use `const` constructors
- Separate build logic into widgets
- Use RepaintBoundary for expensive widgets

## Security Best Practices

✅ **DO**:
- Validate all inputs
- Use immutable data classes
- Never log sensitive data
- Validate before persisting
- Use secure database (encryption in Milestone 2)

❌ **DON'T**:
- Store sensitive data in plain text
- Log passwords or tokens
- Use eval() or dynamic code
- Trust external input
- Commit secrets to git

## Dependency Injection

Using Riverpod for DI:

```dart
// Define provider
final sqliteDatabaseProvider = Provider((ref) => SQLiteDatabase());

// Use in other providers
final profileRepoProvider = Provider((ref) {
  final db = ref.watch(sqliteDatabaseProvider);
  return ProfileRepositoryImpl(db);
});

// Use in UI
@override
Widget build(BuildContext context, WidgetRef ref) {
  final repo = ref.watch(profileRepoProvider);
  // ...
}
```

## Future Improvements

### Milestone 2+
- [ ] Implement repository pattern in data layer
- [ ] Add use cases for complex operations
- [ ] Implement caching layer
- [ ] Add local encryption
- [ ] Add API layer for backend integration
- [ ] Implement offline-first sync
- [ ] Add comprehensive error handling
- [ ] Add logging and analytics (privacy-safe)

## References

- **Flutter Docs**: https://flutter.dev
- **Riverpod Docs**: https://riverpod.dev
- **Clean Architecture**: Uncle Bob's Clean Architecture
- **SOLID Principles**: https://en.wikipedia.org/wiki/SOLID

---

**Architecture Version**: 1.0
**Last Updated**: August 2026
