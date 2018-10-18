import 'dart:async';
import 'dart:convert';

import 'package:fluttercrypto/data/crypto_data.dart';
import 'package:fluttercrypto/data/cryptov2_data.dart';
import 'package:http/http.dart' as http;

class ProdCryptoRepository implements CryptoRepository {
  String cryptoUrl =
      "https://api.coinmarketcap.com/v2/ticker/?start=1&limit=20&sort=rank&structure=array";
  @override
  Future<CryptoV2> fetchCurrencies() async {
    http.Response response = await http.get(cryptoUrl);
    final Map<String, dynamic> responseBody = jsonDecode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }

    var res = CryptoV2.fromJson(responseBody);

    return res;
  }
}
