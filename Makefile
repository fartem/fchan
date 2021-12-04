clean:
	flutter clean
	flutter pub get

generate:
	flutter pub run build_runner build --delete-conflicting-outputs

check:
	flutter analyze
	flutter test test
