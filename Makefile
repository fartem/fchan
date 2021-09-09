check:
	flutter pub get
	flutter pub run build_runner build
	flutter analyze
	flutter test test
