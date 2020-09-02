import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List _currencies;
  HomePage(this._currencies);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MaterialColor> _colors = [Colors.amber, Colors.indigo, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto App'),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final Map currency = widget._currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                return _getListTile(currency, color);
              },
              itemCount: widget._currencies.length,
            ),
          )
        ],
      ),
    );
  }

  Widget _getListTile(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: Text(
        currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(currency['quote']['USD']['price'],
          currency['quote']['USD']['percent_change_1h'].toString()),
    );
  }

  Widget _getSubtitleText(var priceUSD, var percentageChange) {
    TextSpan priceTextWidget = TextSpan(
        text: '\$$priceUSD\n', style: new TextStyle(color: Colors.black));
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

    return RichText(
      text: TextSpan(children: [
        priceTextWidget,
        percentageChangeTextWidget,
      ]),
    );
  }
}
