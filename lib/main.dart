import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrypto/dependency_injection.dart';
import 'package:fluttercrypto/home_page.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          fontFamily: "GoogleSans",
          primarySwatch: Colors.red,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[100]
              : null),
      home: new HomePage(),
    );
  }
}
