class Currency {
  String name;
  Currency(this.name);

  Currency.fromJSON(Map<String, dynamic> json) {
    name = json['data']['name'];
  }
}
