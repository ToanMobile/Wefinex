import 'package:floor/floor.dart';

@Entity(tableName: 'coinEntity')
class CoinEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? name; // name of the currency (ex: Bitcoin)
  String? marketCapRank;
  String? diminutive; // diminutive of the currency (ex: BTC)
  String? price; // price of the currency
  String? change;
  String? changeValue;
  String? logoUrl;
  String? marketCap;
  String? totalVolume;

  @override
  String toString() {
    return 'CoinEntity{id:$id marketCapRank: $marketCapRank, name: $name, diminutive: $diminutive, price: $price, change: $change, changeValue: $changeValue, logoUrl: $logoUrl, marketCap: $marketCap, totalVolume: $totalVolume}';
  }

  CoinEntity({
    this.id,
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
