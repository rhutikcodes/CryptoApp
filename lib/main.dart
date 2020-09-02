import 'dart:async';
import 'dart:convert';
import 'package:flutter_crypto/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() async {
  List currencies = await getCurrencies();
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final List currencies;
  MyApp(this.currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(currencies),
    );
  }
}

Future<List> getCurrencies() async {
  String API_KEY = 'YOUR_API_KEY_HERE';
  String cryptoURL =
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=' +
          API_KEY;

  // http.Response response = await http.get(cryptoURL);
  // final Crypto cryptos = cryptoFromJson(response.body);
  // print(cryptos.data);
  http.Response response = await http.get(cryptoURL);

  var mydata = json.decode(response.body);
  var currencies = mydata['data'];

  return currencies;
}
