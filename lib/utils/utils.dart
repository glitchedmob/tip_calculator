import 'package:flutter/foundation.dart';

String getEnvironment() {
  var environment = 'debug';
  if (kReleaseMode) {
    environment = 'release';
  } else if (kProfileMode) {
    environment = 'profile';
  }

  return environment;
}
