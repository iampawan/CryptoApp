import 'dart:async';

import 'package:fluttercrypto/data/cryptov2_data.dart';

class Crypto {
  String name;
  String priceUsd;
  String percentChange1h;

  Crypto({this.name, this.priceUsd, this.percentChange1h});

  Crypto.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        priceUsd = map['price_usd'],
        percentChange1h = map['percent_change_1h'];
}

abstract class CryptoRepository {
  Future<CryptoV2> fetchCurrencies();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
