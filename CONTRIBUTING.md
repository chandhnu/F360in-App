# Contributing to F360in

## Welcome! 👋

F360in is a personal project building the ultimate wealth management system. Contributions are welcome!

## Code of Conduct

- Be respectful and inclusive
- Help others learn and grow
- Focus on what's best for the project
- Report issues constructively

## How to Contribute

### 1. Report Bugs

Found a bug? Create an issue with:
- Clear title: "Bug: [description]"
- Reproduce steps
- Expected behavior
- Actual behavior
- Screenshots (if applicable)
- Environment info (Flutter version, OS, etc.)

### 2. Suggest Features

Have an idea? Open an issue with:
- Clear title: "Feature: [description]"
- Use case / problem it solves
- Proposed solution
- Alternative solutions considered
- Examples / mockups

### 3. Submit Code

### Fork & Clone
```bash
# Fork on GitHub first, then:
git clone https://github.com/YOUR-USERNAME/F360in.git
cd F360in/f360in_app
```

### Create Branch
```bash
# Feature branch
git checkout -b feature/profile-management

# Bug fix branch
git checkout -b fix/transaction-calculation
```

### Make Changes
- Follow code style guide (see DEVELOPMENT.md)
- Write/update tests
- Add comments for complex logic
- Update documentation if needed

### Commit & Push
```bash
# Commit with descriptive message
git commit -m "feat: add profile management UI"

# Push to your fork
git push origin feature/profile-management
```

### Create Pull Request
1. Go to GitHub repository
2. Click "Compare & pull request"
3. Fill PR description:
   - What does it do?
   - Why is it needed?
   - How to test?
   - Any breaking changes?
4. Request review
5. Address feedback
6. Merge when approved

## Development Setup

See SETUP.md for complete setup guide.

Quick start:
```bash
cd f360in_app
flutter pub get
flutter run -d web
```

## Code Style

### Follow These Standards

**Dart Formatting**
```bash
dart format lib/
```

**Code Analysis**
```bash
flutter analyze
```

**Naming Conventions**
- Classes: `PascalCase`
- Variables/Functions: `camelCase`
- Constants: `UPPER_SNAKE_CASE`
- Private members: Leading underscore `_privateVar`

**Comments**
- Add docstrings to public APIs
- Explain WHY, not WHAT
- Keep comments concise

### Example

```dart
/// Calculates consolidated net worth across all profiles.
/// Excludes inter-profile transfers to avoid double-counting.
///
/// Returns the total net worth in base currency (INR).
double calculateConsolidatedNetWorth() {
  // ... implementation
}
```

## Testing Requirements

All submissions must include tests:

```bash
# Add tests to test/ directory
# Run before submitting PR
flutter test
```

**Test Examples:**

```dart
// Unit test
test('Profile.copyWith preserves ID', () {
  final original = Profile(profileId: 'p1', displayName: 'Original');
  final updated = original.copyWith(displayName: 'Updated');
  
  expect(updated.profileId, 'p1');
  expect(updated.displayName, 'Updated');
});

// Widget test
testWidgets('HomePage displays dashboard', (tester) async {
  await tester.pumpWidget(const MaterialApp(home: HomePage()));
  
  expect(find.byType(Card), findsWidgets);
});
```

## Documentation

**Update documentation if you:**
- Add new features
- Change API
- Add new screens
- Modify architecture

Files to update:
- `README.md` - Overview changes
- `ARCHITECTURE.md` - Architecture changes
- `DEVELOPMENT.md` - Development guideline changes
- `SETUP.md` - Setup process changes

## Pull Request Checklist

Before submitting:

- [ ] Code formatted: `dart format lib/`
- [ ] No analyzer issues: `flutter analyze`
- [ ] Tests pass: `flutter test`
- [ ] Tests written for changes
- [ ] No commented-out code
- [ ] No hardcoded values
- [ ] Comments added for complex logic
- [ ] Documentation updated
- [ ] Commit messages descriptive
- [ ] No merge conflicts

## Review Process

1. **Automated Checks**
   - GitHub Actions runs tests
   - Analyzer checks code quality
   - Coverage reports generated

2. **Code Review**
   - Maintainer reviews changes
   - Suggests improvements
   - Approves when ready

3. **Merge**
   - Squash commits if needed
   - Merge to main branch
   - Close associated issues

## Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Type:**
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Code style
- `refactor:` Code refactoring
- `test:` Test additions
- `chore:` Build/tooling

**Examples:**
```
feat(dashboard): add cash flow card
fix(transaction): correct amount calculation
docs(setup): update installation steps
refactor(theme): extract color constants
```

## Areas for Contribution

### High Priority
1. **Milestone 2**: Profile engine (database integration)
2. **Bug Fixes**: Critical issues
3. **Performance**: Optimization opportunities
4. **Documentation**: Missing guides

### Medium Priority
1. **Testing**: Increase coverage
2. **Code Quality**: Refactoring suggestions
3. **UI/UX**: Visual improvements
4. **Localization**: Multi-language support (future)

### Low Priority
1. **Nice-to-haves**: Polish features
2. **Examples**: Sample apps
3. **Tools**: Development utilities

## Getting Help

### Resources
- **SETUP.md** - Installation guide
- **ARCHITECTURE.md** - Code structure
- **DEVELOPMENT.md** - Coding guidelines
- **Flutter Docs** - https://flutter.dev/docs
- **Dart Docs** - https://dart.dev

### Questions?
- Open a discussion on GitHub
- Comment on relevant issues
- Check existing documentation

## Recognition

Contributors are recognized in:
- CONTRIBUTORS.md (when created)
- Release notes
- Project documentation

Thank you for helping build F360in! 🙌

---

**Version**: 1.0
**Last Updated**: August 2026
