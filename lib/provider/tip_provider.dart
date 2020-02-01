import 'package:flutter/foundation.dart';

class TipProvider extends ChangeNotifier {
  int _billAmount = 1000;

  int get billAmount => _billAmount;

  set billAmount(int newValue) {
    _billAmount = newValue;
    notifyListeners();
  }

  int _tipPercent = 20;

  int get tipPercent => _tipPercent;

  set tipPercent(int newValue) {
    _tipPercent = newValue;
    notifyListeners();
  }

  double get _tipPercentDecimal {
    return tipPercent / 100;
  }

  int get tipAmount {
    return (_tipPercentDecimal * billAmount).round();
  }

  int get billTotal {
    return billAmount + tipAmount;
  }
}