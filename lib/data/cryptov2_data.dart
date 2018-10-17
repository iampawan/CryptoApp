class CryptoV2 {
  List<Data> data;
//  Metadata metadata;

  CryptoV2({this.data});

  CryptoV2.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
//    metadata = json['metadata'] != null
//        ? new Metadata.fromJson(json['metadata'])
//        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
//    if (this.metadata != null) {
//      data['metadata'] = this.metadata.toJson();
//    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String symbol;
  String websiteSlug;
  int rank;
  Quotes quotes;
  int lastUpdated;

  Data(
      {this.id,
      this.name,
      this.symbol,
      this.websiteSlug,
      this.rank,
      this.quotes,
      this.lastUpdated});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    websiteSlug = json['website_slug'];
    rank = json['rank'];
    quotes =
        json['quotes'] != null ? new Quotes.fromJson(json['quotes']) : null;
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['website_slug'] = this.websiteSlug;
    data['rank'] = this.rank;
    if (this.quotes != null) {
      data['quotes'] = this.quotes.toJson();
    }
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}

class Quotes {
  USD uSD;

  Quotes({this.uSD});

  Quotes.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uSD != null) {
      data['USD'] = this.uSD.toJson();
    }
    return data;
  }
}

class USD {
  double price;
  double volume24h;
  double marketCap;
  double percentChange1h;
  double percentChange24h;
  double percentChange7d;

  USD(
      {this.price,
      this.volume24h,
      this.marketCap,
      this.percentChange1h,
      this.percentChange24h,
      this.percentChange7d});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    marketCap = json['market_cap'] ?? 0.0;
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['volume_24h'] = this.volume24h;
    data['market_cap'] = this.marketCap;
    data['percent_change_1h'] = this.percentChange1h;
    data['percent_change_24h'] = this.percentChange24h;
    data['percent_change_7d'] = this.percentChange7d;
    return data;
  }
}

class Metadata {
  int timestamp;
  int numCryptocurrencies;
  String error;

  Metadata({this.timestamp, this.numCryptocurrencies, this.error});

  Metadata.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    numCryptocurrencies = json['num_cryptocurrencies'];
    error = json['error'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['num_cryptocurrencies'] = this.numCryptocurrencies;
    data['error'] = this.error;
    return data;
  }
}
