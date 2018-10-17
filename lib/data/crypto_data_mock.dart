import 'dart:async';

import 'package:fluttercrypto/data/crypto_data.dart';
import 'package:fluttercrypto/data/cryptov2_data.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<CryptoV2> fetchCurrencies() {
    // TODO: implement fetchCurrencies
    return new Future.value(currencies);
  }
}

var currencies;
//  new Crypto(name: "Bitcoin", priceUsd: "800.60", percentChange1h: "-0.7"),
//  new Crypto(name: "Ethereum", priceUsd: "650.30", percentChange1h: "0.85"),
//  new Crypto(name: "Ripple", priceUsd: "300.00", percentChange1h: "-0.25"),
