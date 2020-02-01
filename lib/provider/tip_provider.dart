import 'package:flutter/foundation.dart';

class TipProvider extends ChangeNotifier {
  int _billAmount = 0;

  int get billAmount => _billAmount;

  set billAmount(int newValue) {
    _billAmount = newValue;
    notifyListeners();
  }

  double _tipPercent = 20;

  double get tipPercent => _tipPercent;

  set tipPercent(double newValue) {
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

  void reset() {
    billAmount = 0;
    tipPercent = 20;
  }

  void roundTipAmountToNearest(int amount) {
    var roundedTip = _roundValueToNearest(tipAmount, amount);

    tipPercent = (roundedTip / billAmount) * 100;
  }

  void roundBillTotalToNearest(int amount) {
    var roundedBill = _roundValueToNearest(billTotal, amount);

    var newTipAmount = roundedBill - billAmount;

    tipPercent = (newTipAmount / (roundedBill - newTipAmount)) * 100;
  }

  int _roundValueToNearest(int value, int amount) {
    if(value < amount) {
      return amount;
    }

    var factor = (value ~/ amount) + 1;
    return (factor * amount).toInt();
  }
}