# F360in Flutter Project - Complete Setup Guide

## Prerequisites

### Required
- **Flutter SDK**: 3.0 or higher
- **Dart SDK**: 3.0 or higher (comes with Flutter)
- **Git**: For version control

### For Android Development
- Android SDK 21 or higher
- Android Emulator (optional)
- Android Studio (optional)

### For iOS Development (Mac only)
- Xcode 12 or higher
- macOS 10.15 or higher

### For Web Development
- Modern browser (Chrome, Firefox, Safari, Edge)

## Installation

### 1. Install Flutter

**macOS/Linux:**
```bash
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:~/flutter/bin"
flutter --version
```

**Windows:**
- Download from https://flutter.dev/docs/get-started/install/windows
- Add to PATH
- Run `flutter --version` in command prompt

### 2. Install Dependencies

```bash
cd f360in_app
flutter pub get
```

### 3. Setup Emulator/Device

**For Android:**
```bash
flutter emulators
flutter emulators --launch <emulator_name>
```

**For iOS (Mac only):**
```bash
open -a Simulator
```

## Running the Project

### Web Version (Recommended for Testing)
```bash
flutter run -d web
```
This opens Flutter app in your default browser.

### Android Version
```bash
flutter run -d android
```

### iOS Version (Mac only)
```bash
flutter run -d ios
```

### All Devices
```bash
flutter run
```
This prompts you to select a device.

## Development Workflow

### Code Formatting
```bash
# Format all Dart files
dart format lib/

# Format specific file
dart format lib/main.dart
```

### Code Analysis
```bash
# Analyze all code
flutter analyze

# Analyze and show suggestions
flutter analyze --suggestions
```

### Running Tests
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with verbose output
flutter test --verbose
```

### Building for Release

**Web:**
```bash
flutter build web --release
```

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle:**
```bash
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

## Project Structure

```
f360in_app/
├── lib/                              # Dart source code
│   ├── main.dart                     # App entry point
│   ├── injector.dart                 # Dependency injection
│   ├── config/                       # Configuration
│   │   ├── routes.dart
│   │   └── themes.dart
│   ├── utils/                        # Utility functions
│   │   ├── logger.dart
│   │   ├── constants.dart
│   │   ├── currency_formatter.dart
│   │   ├── date_utils.dart
│   │   ├── responsive.dart
│   │   └── validators.dart
│   ├── domain/                       # Business logic
│   │   ├── exceptions.dart
│   │   ├── models/                   # Data models
│   │   └── repositories/             # Repository interfaces
│   ├── data/                         # Data access layer
│   │   └── datasources/local/
│   │       ├── sqlite_database.dart
│   │       └── migrations/
│   └── presentation/                 # UI layer
│       ├── pages/                    # Full screens
│       ├── widgets/                  # Reusable components
│       ├── providers/                # Riverpod providers
│       └── models/                   # UI models
│
├── android/                          # Android native code
├── ios/                              # iOS native code
├── web/                              # Web support
├── windows/                          # Windows support
├── linux/                            # Linux support
├── macos/                            # macOS support
├── test/                             # Test files
├── assets/                           # Images, fonts, data
│
├── pubspec.yaml                      # Dependencies
├── analysis_options.yaml             # Linter configuration
├── .gitignore                        # Git ignore rules
├── Makefile                          # Build commands
├── .env.example                      # Environment variables
├── SETUP.md                          # This file
└── README.md                         # Project overview
```

## Useful Commands

```bash
# Get help
flutter --help
flutter run --help

# Check Flutter installation
flutter doctor

# Create new Flutter project
flutter create <project_name>

# Upgrade Flutter
flutter upgrade

# Clean build
flutter clean

# Get all dependencies
flutter pub get

# Update all dependencies
flutter pub upgrade

# Analyze code quality
flutter analyze

# Run tests with coverage
flutter test --coverage

# Profile performance
flutter run --profile

# Release build (optimized)
flutter run --release
```

## Dependencies

Main dependencies (see pubspec.yaml):
- **riverpod**: State management
- **flutter_riverpod**: Riverpod for Flutter
- **go_router**: Navigation
- **sqflite**: SQLite database
- **uuid**: Unique identifiers
- **intl**: Internationalization
- **logger**: Logging

Development dependencies:
- **flutter_lints**: Code quality
- **flutter_test**: Testing framework
- **build_runner**: Code generation

## IDE Setup

### VS Code
1. Install Flutter extension
2. Install Dart extension
3. Create `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter",
      "type": "dart",
      "request": "launch",
      "program": "lib/main.dart"
    }
  ]
}
```

### Android Studio
1. Open project as Flutter project
2. Tools → Flutter → New Flutter Project
3. Select existing Flutter project

### Xcode (macOS/iOS)
```bash
open ios/Runner.xcworkspace
```

## Troubleshooting

### Flutter not found
```bash
flutter --version
# If error, add Flutter to PATH or reinstall
```

### Pub get fails
```bash
flutter pub get --reset-cache
flutter pub upgrade
```

### Dependencies conflict
```bash
rm pubspec.lock
flutter pub get
```

### Device not detected
```bash
flutter devices
adb devices  # For Android
```

### Build fails
```bash
flutter clean
flutter pub get
flutter run
```

### iOS pod issues (Mac)
```bash
cd ios
rm -rf Pods
rm Podfile.lock
cd ..
flutter clean
flutter pub get
flutter run -d ios
```

## Environment Variables

Copy `.env.example` to `.env` and modify:
```bash
cp .env.example .env
```

Then update as needed for your environment.

## Database

SQLite database is initialized automatically on first run.

### Database Location
- **Android**: `/data/data/com.f360in.app/databases/f360in.db`
- **iOS**: App Documents directory
- **Web**: IndexedDB (browser storage)

### Schema
9 tables created automatically:
- users
- profiles
- accounts
- transactions
- holdings
- valuations
- goals
- inter_profile_transfers
- cached_calculations

## Deployment

### Web
```bash
flutter build web --release
# Output: build/web/
```

### Android
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### iOS (Mac)
```bash
flutter build ios --release
# Output: build/ios/ipa/
```

## Performance Optimization

### Enable Release Mode
```bash
flutter run --release
```

### Profile Performance
```bash
flutter run --profile
```

### Check Frame Rate
```bash
flutter run
# Press 'p' in console
```

## Getting Help

- **Flutter Docs**: https://flutter.dev/docs
- **Dart API**: https://api.dart.dev
- **Stack Overflow**: Tag with `flutter` and `dart`
- **GitHub Issues**: Report bugs in repository

## Next Steps

1. ✅ Setup complete
2. Run: `flutter run -d web`
3. Review: `lib/` directory
4. Modify: `lib/presentation/pages/home/home_page.dart`
5. Add: New features and screens
6. Test: `flutter test`
7. Deploy: Follow deployment guide

---

**Version**: 1.0.0
**Last Updated**: August 2026
