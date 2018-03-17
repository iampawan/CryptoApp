import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fluttercrypto/dependency_injection.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttercrypto/home_page.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[100]
              : null),
      home: new HomePage(),
    );
  }
}
