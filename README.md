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

The layout keeps the original colors, circular keypad buttons and typography.
Buttons remain 85 logical pixels on normal screens and shrink only when space
requires it, with a 48-pixel minimum touch target. Result labels and values stack
only when they cannot fit on one row. Wide windows use the existing side-by-side
layout, capped at 1100 logical pixels, and all layouts respect device safe areas.

## Web

The web app uses the current Flutter bootstrap and the same calculator layout.
To run without Firebase or Sentry, copy both Dart example files to their local
counterparts, then run:

```sh
flutter run -d chrome --dart-define=ENABLE_ANALYTICS=false --dart-define=ENABLE_ERROR_TRACKING=false
```

For web analytics, configure a Firebase web app with `flutterfire configure` and
include web when generating `lib/firebase_options.dart`. The `ENABLE_ANALYTICS`
and `ENABLE_ERROR_TRACKING` Dart defines override the defaults in `Env` on all
platforms. Mobile continues applying the analytics opt-out to Firebase when off.

Build the standard web release or opt into WebAssembly with its JavaScript fallback:

```sh
flutter build web --release --dart-define=ENABLE_ANALYTICS=false --dart-define=ENABLE_ERROR_TRACKING=false
flutter build web --release --wasm --dart-define=ENABLE_ANALYTICS=false --dart-define=ENABLE_ERROR_TRACKING=false
```

Serve `build/web/` from an HTTPS host. Check your host's cross-origin isolation
settings before relying on multi-threaded Wasm rendering. This project does not
install a service worker or promise offline caching of the web application.

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

## GitHub Actions

Pull requests against any branch, including stacked PRs, run formatting,
analysis, JavaScript and Wasm web builds, and unsigned Android and iOS release
builds. These builds use compile-only Firebase placeholders and do not need
production credentials. No emulator or device checks run in this workflow.

Both workflows read the Flutter version from `.flutter-version`. The iOS jobs
select Xcode 27.2 on GitHub's documented `xcode-27` preview runner because the
standard macOS images do not yet include Xcode 27. Runner capacity and availability
follow that preview image.

Publishing a GitHub release runs the signed iOS archive and TestFlight upload.
Configure these repository secrets:

- `GOOGLE_SERVICE_INFO_PLIST_BASE64`
- `SENTRY_DSN`, optional
- `SIGNING_CERTIFICATE_P12_BASE64` and `SIGNING_CERTIFICATE_P12_PASSWORD`
- `PROVISIONING_PROFILE_BASE64`, an App Store distribution profile for the bundle ID
- `APPSTORE_API_PRIVATE_KEY_BASE64`, `APPSTORE_API_KEY_ID` and `APPSTORE_ISSUER_ID`

The release workflow derives iOS Dart Firebase options from the supplied native
plist and export settings from the provisioning profile. It does not require a
separate Dart-options secret or an untracked `ExportOptions.plist`. Distribution
credentials are needed to verify signing and upload, beyond the unsigned PR build.
