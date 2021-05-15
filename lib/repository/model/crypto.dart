enum HistoricalDataType {
  eight_hour,
  one_day,
  one_week,
  one_month,
  six_month,
}

class CoinEntity {
  String? marketCapRank;
  String? name; // name of the currency (ex: Bitcoin)
  String? diminutive; // diminutive of the currency (ex: BTC)
  String? price; // price of the currency
  String? change;
  String? changeValue;
  String? logoUrl;
  String? marketCap;
  String? totalVolume;

  @override
  String toString() {
    return 'CoinEntity{marketCapRank: $marketCapRank, name: $name, diminutive: $diminutive, price: $price, change: $change, changeValue: $changeValue, logoUrl: $logoUrl, marketCap: $marketCap, totalVolume: $totalVolume, historicalData: $historicalData}';
  }

  HistoricalData historicalData = HistoricalData();

  CoinEntity({
    this.marketCapRank,
    this.name,
    this.diminutive,
    this.price,
    this.change,
    this.changeValue,
    this.logoUrl,
    this.marketCap,
    this.totalVolume,
  });
}

class HistoricalData {
  List<Data> data = [];
}

class Data {
  String price;
  DateTime date;

  Data(this.price, this.date);

  @override
  String toString() {
    return 'Data{price: $price, date: $date}';
  }
}
