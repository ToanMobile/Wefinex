import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:wefinex/base/api.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/shared/constant/common.dart';

import 'model/crypto.dart';
import 'model/fiat.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

///
/// --------------------------------------------
/// In this class where the [Function]s correspond to the API.
/// Which function here you will make it and you will consume it.
/// You can find and use on your Controller wich is the Controller extends [BaseController].
class Repositories {
  ApiService _service = ApiService();
  List<CoinEntity> cryptos = [];
  List<CoinEntity> hotCryptos = [];

  /*Future<List<XosoEntity>> getDataXoSo() async {
    final String assets = await rootBundle.loadString(Common().assetsImage.getListXoso);
    final listXoSo = List<XosoEntity>.from(json.decode(assets).map((x) => XosoEntity.fromJson(x)));
    return listXoSo;
  }*/

  Future<Response> getDataBongDa() async => await _service.callData(baseUrl: Common().myConfig.BASE_URL_BONGDA, endPoint: "v2/competitions", withToken: true);

  Future<Response> getDataCoin() async => await _service.callData(baseUrl: Common().myConfig.BASE_URL_COIN, endPoint: "data/top/mktcapfull?tsym=USD&limit=100");

  Future<List<CoinEntity>> getListCoin() async {
    final response = await _service.callData(endPoint: "coins/markets?vs_currency=vnd&order=market_cap_desc&per_page=100&page=1&sparkline=false");
    if (response.isOk) {
      try {
        /*final listData = List<CoinEntity>.from(json.decode(response.body).map((x) => CoinEntity.fromJson(x)));
        return Future.value(listData);*/
        cryptos.clear();
        await json.decode(response.body).forEach((element) {
          cryptos.add(CoinEntity(
            marketCapRank: element['market_cap_rank'].toString(),
            name: element['name'],
            diminutive: element['symbol'].toString().toUpperCase(),
            price: element['current_price'].toString(),
            logoUrl: element['image'],
            change: (element['price_change_percentage_24h'] == null)
                ? "N/A"
                : (element['price_change_percentage_24h'] >= 0)
                    ? '+'
                    : '-',
            changeValue: (element['price_change_percentage_24h'] == null) ? "N/A" : element['price_change_percentage_24h'].toString(),
            marketCap: (element['market_cap'] == null) ? "N/A" : element['market_cap'].toString(),
            totalVolume: (element['total_volume'] == null) ? "N/A" : element['total_volume'].toString(),
          ));
        });
        //Hot coin
        hotCryptos.clear();
        hotCryptos.addAll(cryptos);
        hotCryptos.sort((b, a) {
          if (b.changeValue == 'null' || a.changeValue == 'null')
            return 1;
          else
            return double.parse(a.changeValue!).compareTo(double.parse(b.changeValue!));
        });
        if (hotCryptos.length > 4) hotCryptos.removeRange(4, hotCryptos.length);
        return Future.value(cryptos);
      } catch (e) {
        print("Error:" + e.toString());
      }
    }
    print("cryptos===:" + cryptos.toString());
    return Future.value(cryptos);
  }

  Future<List<CoinEntity>> getListAllCoin() async {
    print("cryptos===:" + cryptos.toString());
    if (cryptos.length > 0) {
      return Future.value(cryptos);
    }
    return Future.value(null);
  }

  Future<List<CoinEntity>> getListTop() async {
    print("hotCryptos===:" + hotCryptos.toString());
    if (hotCryptos.length > 0) {
      return Future.value(hotCryptos);
    }
    return Future.value(null);
  }

  Future<String> changeCoin(bool side, CoinEntity selectedCrypto, Fiat selectedFiat, String value) async {
    var stringError = "N/A";
    if (selectedCrypto.name == null) return Future.value(stringError);
    final response = await _service.callData(endPoint: "simple/price?ids=${selectedCrypto.name ?? "".toLowerCase()}&vs_currencies=${selectedFiat.diminutive ?? "".toLowerCase()}");
    if (response.isOk) {
      try {
        var jsonResponse = json.decode(response.body);
        double priceForOne = jsonResponse['${selectedCrypto.name ?? "".toLowerCase()}']['${selectedFiat.diminutive ?? "".toLowerCase()}'];
        if (side) {
          // Right side -> fiat to crypto
          stringError = (double.parse(value) / priceForOne).toStringAsFixed(8);
        } else {
          // Left side -> crypto to fiat
          stringError = (double.parse(value) * priceForOne).toStringAsFixed(2);
        }
      } catch (e) {
        print("Error:" + e.toString());
      }
    }
    return Future.value(stringError);
  }

  Future<List<charts.Series<Data, DateTime>>> getHistoricalData(String name, HistoricalDataType type) async {
    print('[TYPE]: ${type.toString()}');
    HistoricalData historicalData = HistoricalData();
    // Get timestamp correctly
    String to = (DateTime.now().toUtc().millisecondsSinceEpoch / 1000).round().toString();
    String from = 'N/A';
    switch (type) {
      case HistoricalDataType.eight_hour:
        from = (DateTime.now().subtract(Duration(hours: 8)).toUtc().millisecondsSinceEpoch / 1000).round().toString();
        break;
      case HistoricalDataType.one_day:
        from = (DateTime.now().subtract(Duration(days: 1)).toUtc().millisecondsSinceEpoch / 1000).round().toString();
        break;
      case HistoricalDataType.one_week:
        from = (DateTime.now().subtract(Duration(days: 7)).toUtc().millisecondsSinceEpoch / 1000).round().toString();
        break;
      case HistoricalDataType.one_month:
        from = (DateTime.now().subtract(Duration(days: 30)).toUtc().millisecondsSinceEpoch / 1000).round().toString();
        break;
      case HistoricalDataType.six_month:
        from = (DateTime.now().subtract(Duration(days: 180)).toUtc().millisecondsSinceEpoch / 1000).round().toString();
        break;
    }
    // Execute the request
    final response = await _service.callData(endPoint: "/coins/${name.toLowerCase()}/market_chart/range?vs_currency=vnd&from=$from&to=$to");
    if (response.isOk) {
      try {
        await json.decode(response.body)['prices'].forEach((element) {
          historicalData.data.add(Data(element[1].toString(), new DateTime.fromMillisecondsSinceEpoch(element[0])));
        });
        List<charts.Series<Data, DateTime>> series = [
          charts.Series(
              id: "HistoricalData",
              data: historicalData.data,
              domainFn: (Data series, _) => series.date,
              measureFn: (Data series, _) => double.parse(series.price),
              colorFn: (Data series, _) => charts.ColorUtil.fromDartColor(Colors.amberAccent[400]))
        ];
        print("historicalData:" + historicalData.data.toString());
        return Future.value(series);
      } catch (e) {
        print("Error:" + e.toString());
      }
    }
    return Future.value(null);
  }
}
