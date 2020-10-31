import 'package:money2/money2.dart';

String formatCents(int cents) {
  var usd = Currency.create('USD', 2);
  var money = Money.fromInt(cents, usd);

  return money.toString();
}
