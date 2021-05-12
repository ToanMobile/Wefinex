/// id : "bitcoin"
/// symbol : "btc"
/// name : "Bitcoin"
/// image : "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
/// current_price : 58017
/// market_cap : 1085258241226
/// market_cap_rank : 1
/// fully_diluted_valuation : 1218366654825
/// total_volume : 65830648663
/// high_24h : 59578
/// low_24h : 56637
/// price_change_24h : 184.19
/// price_change_percentage_24h : 0.31849
/// market_cap_change_24h : 1457924529
/// market_cap_change_percentage_24h : 0.13452
/// circulating_supply : 18705718.0
/// total_supply : 21000000.0
/// max_supply : 21000000.0
/// ath : 64805
/// ath_change_percentage : -10.47341
/// ath_date : "2021-04-14T11:54:46.763Z"
/// atl : 67.81
/// atl_change_percentage : 85460.11703
/// atl_date : "2013-07-06T00:00:00.000Z"
/// roi : null
/// last_updated : "2021-05-10T09:59:53.950Z"

class CoinEntity {
  String? _id;
  String? _symbol;
  String? _name;
  String? _image;
  num? _currentPrice;
  num? _marketCap;
  num? _marketCapRank;
  num? _fullyDilutedValuation;
  num? _totalVolume;
  num? _high24h;
  num? _low24h;
  num? _priceChange24h;
  num? _priceChangePercentage24h;
  num? _marketCapChange24h;
  num? _marketCapChangePercentage24h;
  num? _circulatingSupply;
  num? _totalSupply;
  num? _maxSupply;
  num? _ath;
  num? _athChangePercentage;
  String? _athDate;
  num? _atl;
  num? _atlChangePercentage;
  String? _atlDate;
  dynamic? _roi;
  String? _lastUpdated;

  String? get id => _id;
  String? get symbol => _symbol;
  String? get name => _name;
  String? get image => _image;
  num? get currentPrice => _currentPrice;
  num? get marketCap => _marketCap;
  num? get marketCapRank => _marketCapRank;
  num? get fullyDilutedValuation => _fullyDilutedValuation;
  num? get totalVolume => _totalVolume;
  num? get high24h => _high24h;
  num? get low24h => _low24h;
  num? get priceChange24h => _priceChange24h;
  num? get priceChangePercentage24h => _priceChangePercentage24h;
  num? get marketCapChange24h => _marketCapChange24h;
  num? get marketCapChangePercentage24h => _marketCapChangePercentage24h;
  num? get circulatingSupply => _circulatingSupply;
  num? get totalSupply => _totalSupply;
  num? get maxSupply => _maxSupply;
  num? get ath => _ath;
  num? get athChangePercentage => _athChangePercentage;
  String? get athDate => _athDate;
  num? get atl => _atl;
  num? get atlChangePercentage => _atlChangePercentage;
  String? get atlDate => _atlDate;
  dynamic? get roi => _roi;
  String? get lastUpdated => _lastUpdated;

  @override
  String toString() {
    return 'CoinEntity{_id: $_id, _symbol: $_symbol, _name: $_name, _image: $_image, _currentPrice: $_currentPrice, _marketCap: $_marketCap, _marketCapRank: $_marketCapRank, _fullyDilutedValuation: $_fullyDilutedValuation, _totalVolume: $_totalVolume, _high24h: $_high24h, _low24h: $_low24h, _priceChange24h: $_priceChange24h, _priceChangePercentage24h: $_priceChangePercentage24h, _marketCapChange24h: $_marketCapChange24h, _marketCapChangePercentage24h: $_marketCapChangePercentage24h, _circulatingSupply: $_circulatingSupply, _totalSupply: $_totalSupply, _maxSupply: $_maxSupply, _ath: $_ath, _athChangePercentage: $_athChangePercentage, _athDate: $_athDate, _atl: $_atl, _atlChangePercentage: $_atlChangePercentage, _atlDate: $_atlDate, _roi: $_roi, _lastUpdated: $_lastUpdated}';
  }

  CoinEntity({
      String? id, 
      String? symbol, 
      String? name, 
      String? image, 
      num? currentPrice, 
      num? marketCap, 
      num? marketCapRank, 
      num? fullyDilutedValuation, 
      num? totalVolume, 
      num? high24h, 
      num? low24h, 
      num? priceChange24h, 
      num? priceChangePercentage24h, 
      num? marketCapChange24h, 
      num? marketCapChangePercentage24h, 
      num? circulatingSupply, 
      num? totalSupply, 
      num? maxSupply, 
      num? ath, 
      num? athChangePercentage, 
      String? athDate, 
      num? atl, 
      num? atlChangePercentage, 
      String? atlDate, 
      dynamic? roi, 
      String? lastUpdated}){
    _id = id;
    _symbol = symbol;
    _name = name;
    _image = image;
    _currentPrice = currentPrice;
    _marketCap = marketCap;
    _marketCapRank = marketCapRank;
    _fullyDilutedValuation = fullyDilutedValuation;
    _totalVolume = totalVolume;
    _high24h = high24h;
    _low24h = low24h;
    _priceChange24h = priceChange24h;
    _priceChangePercentage24h = priceChangePercentage24h;
    _marketCapChange24h = marketCapChange24h;
    _marketCapChangePercentage24h = marketCapChangePercentage24h;
    _circulatingSupply = circulatingSupply;
    _totalSupply = totalSupply;
    _maxSupply = maxSupply;
    _ath = ath;
    _athChangePercentage = athChangePercentage;
    _athDate = athDate;
    _atl = atl;
    _atlChangePercentage = atlChangePercentage;
    _atlDate = atlDate;
    _roi = roi;
    _lastUpdated = lastUpdated;
}

  CoinEntity.fromJson(dynamic json) {
    _id = json["id"];
    _symbol = json["symbol"];
    _name = json["name"];
    _image = json["image"];
    _currentPrice = json["current_price"];
    _marketCap = json["market_cap"];
    _marketCapRank = json["market_cap_rank"];
    _fullyDilutedValuation = json["fully_diluted_valuation"];
    _totalVolume = json["total_volume"];
    _high24h = json["high_24h"];
    _low24h = json["low_24h"];
    _priceChange24h = json["price_change_24h"];
    _priceChangePercentage24h = json["price_change_percentage_24h"];
    _marketCapChange24h = json["market_cap_change_24h"];
    _marketCapChangePercentage24h = json["market_cap_change_percentage_24h"];
    _circulatingSupply = json["circulating_supply"];
    _totalSupply = json["total_supply"];
    _maxSupply = json["max_supply"];
    _ath = json["ath"];
    _athChangePercentage = json["ath_change_percentage"];
    _athDate = json["ath_date"];
    _atl = json["atl"];
    _atlChangePercentage = json["atl_change_percentage"];
    _atlDate = json["atl_date"];
    _roi = json["roi"];
    _lastUpdated = json["last_updated"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["symbol"] = _symbol;
    map["name"] = _name;
    map["image"] = _image;
    map["current_price"] = _currentPrice;
    map["market_cap"] = _marketCap;
    map["market_cap_rank"] = _marketCapRank;
    map["fully_diluted_valuation"] = _fullyDilutedValuation;
    map["total_volume"] = _totalVolume;
    map["high_24h"] = _high24h;
    map["low_24h"] = _low24h;
    map["price_change_24h"] = _priceChange24h;
    map["price_change_percentage_24h"] = _priceChangePercentage24h;
    map["market_cap_change_24h"] = _marketCapChange24h;
    map["market_cap_change_percentage_24h"] = _marketCapChangePercentage24h;
    map["circulating_supply"] = _circulatingSupply;
    map["total_supply"] = _totalSupply;
    map["max_supply"] = _maxSupply;
    map["ath"] = _ath;
    map["ath_change_percentage"] = _athChangePercentage;
    map["ath_date"] = _athDate;
    map["atl"] = _atl;
    map["atl_change_percentage"] = _atlChangePercentage;
    map["atl_date"] = _atlDate;
    map["roi"] = _roi;
    map["last_updated"] = _lastUpdated;
    return map;
  }

}