import 'package:flutter/material.dart';
import 'package:fluttercrypto/data/cryptov2_data.dart';
import 'package:fluttercrypto/modules/crypto_presenter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements CryptoListViewContract {
  CryptoListPresenter _presenter;
  List<Data> _currencies;
  bool _isLoading;
  BuildContext _context;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  _HomePageState() {
    _presenter = new CryptoListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: new Text(
            "Crypto App",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
        ),
        body: _isLoading
            ? new Center(
                child: new CircularProgressIndicator(),
              )
            : _cryptoWidget());
  }

  Widget _cryptoWidget() {
    return Column(
      children: <Widget>[
        Card(
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Favourite Currencies",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/icons/coin_btc.png",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    _currencies[0].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_currencies[0].symbol),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "\$${_currencies[0].quotes.uSD.price.toStringAsFixed(2)}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${_currencies[0].quotes.uSD.percentChange1h.toString()}%",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/icons/coin_eth.png",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    _currencies[1].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_currencies[1].symbol),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "\$${_currencies[1].quotes.uSD.price.toStringAsFixed(2)}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${_currencies[1].quotes.uSD.percentChange1h.toString()}%",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/icons/coin_xrp.png",
                    width: 30.0,
                    height: 30.0,
                  ),
                  title: Text(
                    "Ripple",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_currencies[2].symbol),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "\$${_currencies[2].quotes.uSD.price.toStringAsFixed(2)}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${_currencies[2].quotes.uSD.percentChange1h.toString()}%",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _currencies.length,
            itemBuilder: (BuildContext context, int index) {
              final Data currency = _currencies[index];
              final MaterialColor color = _colors[index % _colors.length];
              if (index > 2) return _getListItemUi(currency, color, index);
            },
          ),
        )
      ],
    );
  }

  Card _getListItemUi(Data currency, MaterialColor color, int index) {
    return Card(
      elevation: 0.0,
      child: new ListTile(
        leading: new CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[100],
          child: new Text(
            currency.name[0],
            style: TextStyle(color: Colors.black),
          ),
        ),
        title: new Text(currency.name,
            style: new TextStyle(fontWeight: FontWeight.bold)),
        subtitle: _getSubtitleText(currency.quotes.uSD.price.toString(),
            currency.quotes.uSD.percentChange1h.toString()),
        isThreeLine: true,
      ),
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD\n", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }

  @override
  void onLoadCryptoComplete(CryptoV2 items) {
    setState(() {
      _currencies = items.data;
      _isLoading = false;
    });
  }

  @override
  void onLoadCryptoError(String error) {
    print(error);
  }
}
