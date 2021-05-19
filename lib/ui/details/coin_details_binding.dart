import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/list_crypto.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class CoinDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoinDetailsController());
  }
}

class CoinDetailsController extends SuperBaseController<List<charts.Series<DataPrice, DateTime>>> {
  HistoricalDataType dataType = HistoricalDataType.one_day;
  final coin = Get.arguments;
  var isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
    getRefreshList();
  }

  void getRefreshList() {
    if (coin.name != null) {
      getHistoricalData(coin.name, dataType).then(
        (data) {
          if (data != null && data.length > 0) {
            change(data, status: RxStatus.success());
          } else {
            change(data, status: RxStatus.empty());
          }
          checkFavourite();
        },
        onError: (err) {
          print("CURRENT Error== $err");
          change(null, status: RxStatus.error(err.toString()));
          checkFavourite();
        },
      );
    }
  }

  void setTypeTime(HistoricalDataType type) {
    dataType = type;
    getRefreshList();
  }

  void checkFavourite() async {
    try {
      print("checkFavourite query== ${coin.name}");
      final isFavourite = await coinDao?.findCoinByName(coin.name);
      print("checkFavourite query== $isFavourite");
      if (isFavourite != null) {
        isFavorite.value = true;
      } else {
        isFavorite.value = false;
      }
    } catch (e) {
      e.printError();
      print("checkFavourite error== ${e.toString()}");
    }
  }

  void addFavourite() async {
    print("addFavourite query== ${coin.name}");
    final isFavourite = await coinDao?.findCoinByName(coin.name);
    print("addFavourite query== $isFavourite");
    if (isFavourite != null) {
      await coinDao?.deleteCoin(coin.name);
      isFavorite.value = false;
      print("delete==");
    } else {
      await coinDao?.insertCoin(coin);
      isFavorite.value = true;
      print("add==");
    }
  }
}
