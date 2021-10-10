clean:
	flutter clean
	flutter pub get

rebuild:
	rm -rf .dart_tool
	$(MAKE) clean
	flutter pub run build_runner build --delete-conflicting-outputs

check:
	flutter analyze
	flutter test test
