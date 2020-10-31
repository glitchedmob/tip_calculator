# tip_calculator

A tip calculator app written in flutter 

## Getting Started

- Ensure you have [Flutter installed](https://flutter.dev/docs/get-started/install)
- Run `flutter pub get`
- Add `sentry.dsn=https://dsn-url` to `android/local.properties`
    - if `android/local.properties` doesn't exist open the `android` folder in Android Studio and sync Gradle
- Create `ios/Runner/Config.xcconfig` and add `SENTRY_DSN = 'https://dsn-url'`
- Copy `lib/env.dart.example` to `lib/env.dart` and populate variables 
