import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/crypto.dart';
import 'package:wefinex/repository/model/db_coin.dart';

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
  final coinName = Get.arguments;
  RxBool isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    getRefreshList();
    //checkFavourite();
  }

  void getRefreshList() {
    getHistoricalData(coinName, dataType).then(
      (data) {
        print("CURRENT getHistoricalData== ${data.length}");
        change(data, status: RxStatus.success());
        update();
      },
      onError: (err) {
        print("CURRENT Error== $err");
        change(null, status: RxStatus.error(err.toString()));
      },
    );
  }

  void setTypeTime(HistoricalDataType type) {
    dataType = type;
    getRefreshList();
  }

  void checkFavourite() {
    print("checkFavourite==" + hive.getAt(0));
    if (hive.getAt(0) != null) {
      isFavorite.value = true;
    } else {
      isFavorite.value = false;
    }
  }

  void addFavourite() {
    print("get==" + hive.getAt(0));
    if (hive.getAt(0) != null) {
      hive.delete(DbCoin(name: coinName));
      isFavorite.value = false;
      print("delete==" + hive.get(coinName));
    } else {
      hive.add(DbCoin(name: coinName));
      isFavorite.value = true;
      print("add==" + hive.get(coinName));
    }
  }
}
