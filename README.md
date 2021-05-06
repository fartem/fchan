# fchan

[![Codemagic](https://api.codemagic.io/apps/5f762964afe9c4000f3e41ce/5f762964afe9c4000f3e41cd/status_badge.svg)](https://codemagic.io/apps/5f762964afe9c4000f3e41ce/5f762964afe9c4000f3e41cd/latest_build)
[![Coverage](./coverage_badge.svg)](./coverage_badge.svg)

## About

4chan client on Flutter.

## Project status

In development. You can run the app on Android or iOS but current build may be slow on some screens and UI is not finally approved.

You can track a next test app version development status on [GitHub Projects](https://github.com/fartem/fchan/projects) page for this repository.

### Features progress

* [x] Boards list
* [x] Favorite boards list
* [x] History
* [ ] Bookmarks
* [ ] Gallery

## Screenshots

Soon.

## Download

Soon.

## Feedback

If you have a feature request or an issue, you can create report on [this page](https://github.com/fartem/fchan/issues).

## How to build app for Android

### From IDE

Just clone or download the project from GitHub and run it from your IDE. How to start with Flutter on your IDE search [here](https://flutter.dev/docs/get-started/editor).

### Without IDE

You can build the app for Android from terminal on your machine without installing any IDE. Follow this steps:

1. install [Flutter](https://flutter.dev/docs/get-started/install) and dependencies for it;
2. in terminal change current directory (by command `cd`) to the `android` folder int the project folder and run:

```shell
flutter build apk --profile --split-per-abi
```

3. find created `.apk` at `/build/app/outputs/flutter-apk/app-profile.apk`.

## How to build app for iOS

### From IDE

Just clone or download the project from GitHub and run it from your IDE. How to start with Flutter on your IDE search [here](https://flutter.dev/docs/get-started/editor).

## How to contribute

Read [Commit Convention](https://github.com/fartem/repository-rules/blob/master/commit-convention/COMMIT_CONVENTION.md). Make sure your build is green before you contribute your pull request. Then:

```shell
$ flutter pub global activate dart_enum_to_string_check
$ flutter pub global run dart_enum_to_string_check
$ flutter analyze
$ flutter test test
```

## Contributors

* [@fartem](https://github.com/fartem) as Artem Fomchenkov
* [@GeorgeOblomov](https://github.com/GeorgeOblomov) as Egor Grischenkov
