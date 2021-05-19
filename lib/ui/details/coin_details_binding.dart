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
    getRefreshList();
    //checkFavourite();
  }

  void getRefreshList() {
    getHistoricalData(coin.name, dataType).then(
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
    print("checkFavourite==" + box.get(coin.id).toString());
    if (box.get(coin.id) != null) {
      isFavorite.value = true;
    } else {
      isFavorite.value = false;
    }
  }

  void addFavourite() {
    print("get==coinName$coin" + box.get(coin.id).toString());
    if (box.get(coin.id) != null) {
      box.remove(coin.id);
      isFavorite.value = false;
      print("delete==");
    } else {
      box.put(coin);
      isFavorite.value = true;
      print("add==");
    }
  }
}
