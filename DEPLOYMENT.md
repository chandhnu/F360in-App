# F360in Deployment Guide

## Overview

F360in can be deployed to multiple platforms:
- Web (Progressive Web App)
- Android (Google Play Store)
- iOS (Apple App Store)
- Windows
- Linux
- macOS

## Web Deployment

### Build Web Version

```bash
flutter build web --release
# Output: build/web/
```

### Deploy to GitHub Pages

```bash
# 1. Build web
flutter build web --release

# 2. Create gh-pages branch (one time)
git checkout --orphan gh-pages
git rm -rf .

# 3. Copy build output
cp -r build/web/* .
git add .
git commit -m "Deploy web app"
git push -u origin gh-pages

# 4. Configure GitHub Pages
# Go to GitHub repo → Settings → Pages
# Select branch: gh-pages
# Save
```

**Access at**: `https://chandhnu.github.io/F360in/`

### Deploy to Firebase Hosting

```bash
# 1. Install Firebase CLI
npm install -g firebase-tools

# 2. Login
firebase login

# 3. Initialize project
firebase init

# 4. Build and deploy
flutter build web --release
firebase deploy

# 5. Your app is live at your Firebase URL
```

### Deploy to Netlify

```bash
# 1. Build web
flutter build web --release

# 2. Deploy
npm install -g netlify-cli
netlify deploy --prod --dir=build/web
```

## Android Deployment

### Prerequisites

- Android SDK 21+
- Keystore file for signing (create once)
- Google Play Developer Account ($25)

### Create Signing Key

```bash
# One-time setup
keytool -genkey -v -keystore ~/f360in-release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias f360in-key

# Enter password and details when prompted
```

### Build APK

```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Build App Bundle (Recommended for Play Store)

```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

### Upload to Google Play Store

1. Go to Google Play Console (https://play.google.com/console)
2. Create app: "F360in"
3. Upload app bundle: `build/app/outputs/bundle/release/app-release.aab`
4. Fill app details:
   - Title: F360in
   - Description: Personal Wealth Operating System
   - Screenshots: Add 4-8 screenshots
   - Category: Finance
5. Set pricing (free)
6. Submit for review
7. Wait 2-4 hours for review

## iOS Deployment

### Prerequisites

- Mac with Xcode 12+
- Apple Developer Account ($99/year)
- Provisioning profiles and certificates

### Build iOS App

```bash
# Build for release
flutter build ios --release

# This creates .xcarchive
# Use Xcode to manage further
```

### Prepare in Xcode

```bash
# 1. Open Xcode project
open ios/Runner.xcworkspace

# 2. Select team in Xcode
# 3. Set version number and build number
# 4. Archive for submission
# Product → Archive
```

### Upload to App Store

1. Sign in to App Store Connect (https://appstoreconnect.apple.com)
2. Create new app:
   - Name: F360in
   - Bundle ID: com.f360in.app
   - Primary Language: English
   - Category: Finance
3. Add screenshots and description
4. Upload build via Xcode or Transporter
5. Submit for review
6. Wait 24-48 hours for review

## Windows Deployment

### Build Windows App

```bash
flutter build windows --release
# Output: build/windows/runner/Release/
```

### Create Windows Installer

Use MSIX (modern approach):

```bash
flutter pub add msix
flutter pub run msix:create
# Creates .msix file for Microsoft Store
```

## macOS Deployment

### Build macOS App

```bash
flutter build macos --release
# Output: build/macos/Build/Products/Release/
```

### Notarize for Distribution

```bash
# macOS requires notarization
xcrun notarytool submit /path/to/app.dmg
```

## Linux Deployment

### Build Linux App

```bash
flutter build linux --release
# Output: build/linux/x64/release/bundle/
```

### Create Snap

```bash
flutter pub add snap
flutter pub run snap:build
# Creates .snap file for Linux Store
```

## Environment-Specific Configuration

### Development

```bash
flutter run -d web
# Uses development settings
# Logging enabled
# Hot reload enabled
```

### Staging

```bash
flutter run --release -d web
# Uses release settings
# Some logging
# Optimized
```

### Production

```bash
flutter build web --release
# Maximum optimization
# No debug code
# Minimum logging
```

## Pre-Deployment Checklist

### Code Quality
- [ ] All tests pass: `flutter test`
- [ ] No analyzer warnings: `flutter analyze`
- [ ] Code formatted: `dart format lib/`
- [ ] No console errors
- [ ] No hardcoded URLs or credentials

### Features
- [ ] All features working
- [ ] No known bugs
- [ ] Performance acceptable
- [ ] Offline mode working (if applicable)
- [ ] Error handling complete

### Documentation
- [ ] README updated
- [ ] Changelog updated
- [ ] Version number updated
- [ ] Privacy policy updated
- [ ] Terms of service updated

### Versioning

Update in `pubspec.yaml`:
```yaml
version: 1.1.0+2
# Format: semantic.version+build.number
# 1.1.0 = major.minor.patch
# +2 = build number for same version (iOS/Android)
```

### Git

```bash
# Create release tag
git tag -a v1.1.0 -m "Release version 1.1.0"
git push origin v1.1.0

# Create release branch
git checkout -b release/1.1.0
```

## Post-Deployment

### Monitoring

- Monitor crash reports
- Check user feedback
- Monitor performance metrics
- Check error logs

### Update Strategy

1. Deploy to web first (instant, low risk)
2. Monitor for issues (24 hours)
3. If stable, deploy to app stores
4. Wait for app store review
5. Publish when approved

### Hotfix

If critical bug found:

```bash
# Create hotfix branch
git checkout -b hotfix/critical-bug

# Make fix and test
# ...

# Merge back to main
git checkout main
git merge hotfix/critical-bug

# Tag and deploy
git tag -a v1.1.1 -m "Hotfix for critical bug"
```

## CI/CD Pipeline

GitHub Actions workflow (`.github/workflows/flutter.yml`) automates:

1. **On Push to main:**
   - Run tests
   - Analyze code
   - Build web
   - Deploy to GitHub Pages

2. **Manual Deployment:**
   - Build APK/AAB (Android)
   - Build iOS
   - Create releases

## Rollback

If deployment fails:

### Web
```bash
# Rollback GitHub Pages
git checkout previous-version
git push origin gh-pages --force

# Or restore from backup
```

### App Stores
- Contact app store support
- Remove from store
- Fix issue
- Resubmit

## Performance Targets

### Web
- **First Contentful Paint**: < 3s
- **Time to Interactive**: < 5s
- **Lighthouse Score**: > 90

### Mobile
- **App Size**: < 30MB (Android), < 50MB (iOS)
- **Startup Time**: < 2s
- **Memory Usage**: < 150MB

### Database
- **Query Time**: < 100ms
- **Data Sync**: < 1s

## Security Checklist

- [ ] No hardcoded secrets
- [ ] All inputs validated
- [ ] HTTPS only
- [ ] Database encrypted (Phase 2)
- [ ] User data encrypted (Phase 2)
- [ ] No unnecessary permissions
- [ ] Privacy policy compliant
- [ ] GDPR compliant (if needed)

## Support

For deployment issues:
- Check Flutter documentation
- Review GitHub Actions logs
- Check app store guidelines
- Contact app store support

---

**Version**: 1.0
**Last Updated**: August 2026
