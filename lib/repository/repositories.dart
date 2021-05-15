import 'dart:convert';

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
        json.decode(response.body).forEach((element) {
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
      } catch (e) {
        print("Error:" + e.toString());
      }
    }
    return Future.value(cryptos);
  }

  Future<List<CoinEntity>> getListTop() async {
    if (hotCryptos.length > 0) {
      return Future.value(hotCryptos);
    }
    return Future.value(null);
  }

  Future<Fiat> getChart(String symbol) async {
    final response = await _service.callData(endPoint: "/$symbol/market_chart?vs_currency=vnd&days=1");
    if (response.isOk) {
      try {
        //final chartData = ChartEntity.fromJson(response);
        // return Future.value(chartData);
      } catch (e) {
        print("Error:" + e.toString());
      }
    }
    return Future.value(null);
  }
}
