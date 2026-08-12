# F360in Development Guidelines

## Getting Started

### First Time Setup

```bash
# 1. Clone and setup
git clone https://github.com/chandhnu/F360in.git
cd F360in/f360in_app

# 2. Install dependencies
flutter pub get

# 3. Run tests
flutter test

# 4. Start development
flutter run -d web
```

### Daily Development

```bash
# Get latest changes
git pull origin main

# Get new dependencies
flutter pub get

# Format code
dart format lib/

# Run tests
flutter test

# Run app
flutter run -d web
```

## Code Style

### Dart Code Formatting

```dart
// Good: Clear, readable
class Profile {
  final String profileId;
  final String displayName;
  
  Profile({required this.profileId, required this.displayName});
  
  Profile copyWith({String? displayName}) {
    return Profile(
      profileId: profileId,
      displayName: displayName ?? this.displayName,
    );
  }
}

// Bad: Inconsistent, hard to read
class Profile {
  String profileId; String displayName;
  Profile(this.profileId, this.displayName);
}
```

### Naming Conventions

```dart
// Classes: PascalCase
class UserProfile { }
class TransactionType { }

// Variables/Functions: camelCase
String userName;
void calculateNetWorth() { }

// Constants: UPPER_SNAKE_CASE
const String DEFAULT_CURRENCY = 'INR';
const double PADDING_DEFAULT = 16.0;

// Private: Leading underscore
class _InternalHelper { }
void _privateMethod() { }

// Enum values: lowercase
enum AccountType { savingsAccount, fixedDeposit }
```

### Comments

```dart
// Good: Explains why, not what
/// Calculates net worth across all profiles.
/// Excludes inter-profile transfers to avoid double-counting.
double calculateConsolidatedNetWorth() {
  // Sum all profile net worths
  // ...
}

// Bad: Restates obvious code
// Get the user name
String name = user.getName();
```

### Imports

```dart
// Group imports: dart → flutter → packages → relative
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import '../domain/models/profile.dart';
```

## Git Workflow

### Branching

```bash
# Create feature branch
git checkout -b feature/profile-management

# Create bugfix branch
git checkout -b fix/transaction-calculation

# Create documentation branch
git checkout -b docs/setup-guide
```

### Commit Messages

```bash
# Good commit messages
git commit -m "feat: add profile switching UI"
git commit -m "fix: correct net worth calculation"
git commit -m "docs: update setup guide"
git commit -m "refactor: extract dashboard card widgets"
git commit -m "test: add profile model tests"

# Message format: [type]: [description]
# Types: feat, fix, docs, refactor, test, style, chore
```

### Pull Requests

1. Create branch: `git checkout -b feature/xyz`
2. Make changes
3. Commit: `git commit -m "descriptive message"`
4. Push: `git push origin feature/xyz`
5. Create PR on GitHub
6. Request review
7. Merge after approval

## Adding New Features

### Example: Add a New Card Widget

```dart
// 1. Create file: lib/presentation/widgets/cards/new_card.dart
class NewCard extends StatelessWidget {
  final dynamic data;
  
  const NewCard({required this.data});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: [...]),
      ),
    );
  }
}

// 2. Add provider if needed: lib/presentation/providers/new_provider.dart
final newDataProvider = StateProvider((ref) => data);

// 3. Add to home page: lib/presentation/pages/home/home_page.dart
final newData = ref.watch(newDataProvider);
// ... use in build

// 4. Format and analyze
dart format lib/
flutter analyze
```

### Example: Add a New Domain Model

```dart
// 1. Create: lib/domain/models/new_model.dart
class NewModel {
  final String id;
  final String name;
  
  NewModel({required this.id, required this.name});
  
  NewModel copyWith({String? name}) {
    return NewModel(id: id, name: name ?? this.name);
  }
}

// 2. Create repository interface: lib/domain/repositories/new_repository.dart
abstract class NewRepository {
  Future<NewModel> getModel(String id);
  Future<void> saveModel(NewModel model);
}

// 3. Create tests: test/domain/models/new_model_test.dart
test('copyWith preserves id', () {
  final model = NewModel(id: '1', name: 'Test');
  final updated = model.copyWith(name: 'Updated');
  expect(updated.id, '1');
});

// 4. Run tests
flutter test
```

## Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific file
flutter test test/domain/models/profile_test.dart

# Run with verbose output
flutter test --verbose

# Run with coverage
flutter test --coverage

# Watch for changes
flutter test --watch
```

### Writing Tests

```dart
// Unit test
void main() {
  group('Profile', () {
    test('copyWith updates displayName', () {
      final profile = Profile(
        profileId: 'prof_001',
        displayName: 'Original',
      );
      
      final updated = profile.copyWith(displayName: 'Updated');
      
      expect(updated.displayName, 'Updated');
      expect(updated.profileId, 'prof_001');
    });
  });
}

// Widget test
testWidgets('HomePage displays net worth', (WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: HomePage()));
  
  expect(find.text('Net Worth'), findsOneWidget);
  expect(find.byType(Card), findsWidgets);
});
```

## Performance Tips

### Rendering Performance

```dart
// Good: Const constructors
const EdgeInsets.all(16)

// Good: Extract widgets
class _StatCard extends StatelessWidget {
  // ...
}

// Bad: Inline complex widgets
Card(child: SizedBox(child: Row(children: [...])))

// Bad: Expensive operations in build
@override
Widget build(BuildContext context) {
  final result = expensiveCalculation(); // ❌ Recalculates every build
  return Text(result);
}
```

### State Management Performance

```dart
// Good: Watch only what you need
final selectedProfile = ref.watch(selectedProfileProvider.select((p) => p.displayName));

// Good: Use read for one-time access
final data = ref.read(dataProvider);

// Bad: Watch entire object if you only need one field
final profile = ref.watch(profileProvider); // ❌ Rebuilds on any change
```

### Database Performance

```dart
// Good: Use indexes
CREATE INDEX idx_transactions_date ON transactions(effective_date);

// Good: Batch operations
await db.transaction(() async {
  for (var tx in transactions) {
    await db.insert('transactions', tx);
  }
});

// Bad: Multiple queries
for (var id in ids) {
  final item = await db.query('table', where: 'id = ?', whereArgs: [id]);
}
```

## Debugging

### Print Debugging

```dart
// Basic print
print('Value: $value');

// Using logger
AppLogger.info('Important info');
AppLogger.debug('Debug message', error);
AppLogger.warning('Warning message');
AppLogger.error('Error message', error, stackTrace);
```

### Flutter DevTools

```bash
# Open DevTools
flutter pub global activate devtools
devtools

# Or use with running app
flutter run --devtools
```

## Common Issues

### Issue: Hot Reload Not Working

**Solution:**
```bash
flutter clean
flutter pub get
flutter run
```

### Issue: Build Cache Issues

**Solution:**
```bash
flutter clean
rm pubspec.lock
flutter pub get
flutter run
```

### Issue: Riverpod Provider Not Updating

**Solution:**
```dart
// Make sure you're using StateProvider for mutable state
final provider = StateProvider((ref) => initialValue);

// Update it with:
ref.read(provider.notifier).state = newValue;

// Not like this:
ref.read(provider) = newValue; // ❌ Wrong
```

### Issue: Tap Gesture Not Working

**Solution:**
```dart
// Wrap with GestureDetector
GestureDetector(
  onTap: () { /* handle tap */ },
  child: SizedBox(
    height: 48, // ✅ Give sufficient touch area
    child: Text('Tap me'),
  ),
)
```

## Code Review Checklist

Before submitting PR:

- [ ] Code is formatted: `dart format lib/`
- [ ] No analyzer errors: `flutter analyze`
- [ ] Tests pass: `flutter test`
- [ ] No hardcoded strings (use constants)
- [ ] No commented-out code
- [ ] No print statements (use logger)
- [ ] Follows naming conventions
- [ ] Has appropriate comments
- [ ] Handles errors gracefully
- [ ] No console warnings

## IDE Shortcuts

### VS Code

```
Ctrl+Shift+P     Command palette
Ctrl+Space       Code completion
Ctrl+H           Find and replace
Ctrl+/           Toggle comment
Shift+Alt+F      Format document
F5               Debug
Ctrl+Shift+D     Open DevTools
```

### Android Studio

```
Cmd+N            New file
Cmd+O            Open file
Cmd+,            Settings
Cmd+/            Toggle comment
Cmd+Option+L     Reformat code
Cmd+Shift+F      Find in files
Shift+F6         Rename
```

## Resources

### Documentation
- Flutter: https://flutter.dev/docs
- Dart: https://dart.dev/guides
- Riverpod: https://riverpod.dev
- GoRouter: https://pub.dev/packages/go_router

### Tools
- Flutter DevTools: https://flutter.dev/docs/development/tools/devtools
- Dart Analyzer: Built into VS Code
- Pub.dev: https://pub.dev (package search)

### Learning
- Flutter Codelabs: https://flutter.dev/codelabs
- Dart Samples: https://dart.dev/samples
- YouTube Tutorials: Search "Flutter tutorial"

---

**Happy coding!** 🚀

**Last Updated**: August 2026
