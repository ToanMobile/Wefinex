import 'package:get/get.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/crypto.dart';

/*
Created by ToanDev on 05/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/
class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}

class SearchController extends SuperBaseController<List<CoinEntity>> {
  List<CoinEntity> cryptos = [];

  @override
  void onInit() async {
    super.onInit();
    getListAllCoin().then((data) {
      print("CURRENT listCoin== $data");
      cryptos = data;
      if (cryptos != null && cryptos.length > 0) {
        change(cryptos, status: RxStatus.success());
      } else {
        change(cryptos, status: RxStatus.empty());
      }
    }, onError: (err) {
      print("CURRENT Error== $err");
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
