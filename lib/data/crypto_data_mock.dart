import 'dart:async';

import 'package:fluttercrypto/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() {
    // TODO: implement fetchCurrencies
    return new Future.value(currencies);
  }
}

var currencies = <Crypto>[
  new Crypto(name: "Bitcoin", price_usd: "800.60", percent_change_1h: "-0.7"),
  new Crypto(name: "Ethereum", price_usd: "650.30", percent_change_1h: "0.85"),
  new Crypto(name: "Ripple", price_usd: "300.00", percent_change_1h: "-0.25"),
];
