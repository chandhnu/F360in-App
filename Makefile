.PHONY: help setup clean build test format analyze docs

help:
	@echo "F360in Flutter Project - Available Commands:"
	@echo ""
	@echo "Setup & Install:"
	@echo "  make setup              - Install dependencies"
	@echo "  make clean              - Clean build artifacts"
	@echo ""
	@echo "Development:"
	@echo "  make run-web            - Run web version"
	@echo "  make run-android        - Run Android version"
	@echo "  make run-ios            - Run iOS version"
	@echo ""
	@echo "Code Quality:"
	@echo "  make analyze            - Analyze code"
	@echo "  make format             - Format code"
	@echo "  make test               - Run tests"
	@echo ""
	@echo "Build:"
	@echo "  make build-web          - Build web release"
	@echo "  make build-apk          - Build Android APK"
	@echo "  make build-ios          - Build iOS app"
	@echo ""

setup:
	flutter pub get
	flutter pub upgrade

clean:
	flutter clean
	rm -rf build/

run-web:
	flutter run -d web

run-android:
	flutter run -d android

run-ios:
	flutter run -d ios

analyze:
	flutter analyze

format:
	dart format lib/ test/

test:
	flutter test

build-web:
	flutter build web --release

build-apk:
	flutter build apk --release

build-ios:
	flutter build ios --release

docs:
	@echo "Generating documentation..."
	dartdoc lib/

.DEFAULT_GOAL := help
