enum HistoricalDataType {
  eight_hour,
  one_day,
  one_week,
  one_month,
  six_month,
}

class ListCoinEntity {

  HistoricalData historicalData = HistoricalData();

}

class HistoricalData {
  List<DataPrice> data = [];
}

class DataPrice {
  String price;
  DateTime date;

  DataPrice(this.price, this.date);

  @override
  String toString() {
    return 'Data{price: $price, date: $date}';
  }
}
