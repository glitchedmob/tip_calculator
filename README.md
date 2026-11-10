# Tip Calculator

A Flutter tip calculator with a cents-entry keypad and quick tip and total rounding.

## Toolchain and platform support

- Flutter 3.47.9, pinned in `.flutter-version`, with Dart 3.13.7.
- Android 8.0 or later, API 26. The app compiles and targets Android 17, API 37.
  Sentry 10 requires the Android minimum; it is not a layout requirement.
- iOS 15 or later. Use Xcode 27.2 or a newer compatible stable Xcode.
- Apple plugins use Swift Package Manager. CocoaPods is not required.
- Android builds use Java 17, Gradle 9.3.1 and AGP 9.1 with built-in Kotlin.

## Local setup

1. Install the pinned Flutter version and run `flutter pub get`.
2. Copy `lib/env.dart.example` to `lib/env.dart`.
3. Configure Firebase for your project with the FlutterFire CLI. Keep the generated
   `lib/firebase_options.dart`, `android/app/google-services.json` and
   `ios/Runner/GoogleService-Info.plist` local. Example Dart options are provided
   for analysis, not as credentials for a real Firebase project.
4. Copy `ios/Runner/Config.xcconfig.example` to `ios/Runner/Config.xcconfig`.
5. To enable Sentry, populate `Env.sentryDsn` and the native settings:
   `sentry.dsn` in `android/local.properties` and `SENTRY_DSN` in the iOS config.
   Enable error tracking in `lib/env.dart`. Enable analytics there only when wanted.

The bundle ID remains `com.levizitting.tipcalculator` on both mobile platforms.
Roboto Mono is bundled under `assets/fonts/` with its license, so the app does not
need to download fonts at runtime.

## Building

```sh
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter build apk --release
flutter build ios --release --no-codesign
```

Android release builds are unsigned unless `android/key.properties` exists.
Copy `android/key.properties.example`, supply your upload keystore and passwords,
and keep them out of version control. Release builds never fall back to the debug
signing key. Use a debug build for development without release credentials.

The unsigned iOS build verifies compilation only. Distribution requires the
appropriate Apple certificate, provisioning profile and export settings.
