import 'package:get/get.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/crypto.dart';

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

class CoinDetailsController extends SuperBaseController<CoinEntity> {
  @override
  void onInit() {
    super.onInit();
    /*getChart("bitcoin").then((data) {
      print("CURRENT listCoin== $data");
      change(data, status: RxStatus.success());
      update();
    }, onError: (err) {
      print("CURRENT Error== $err");
      change(null, status: RxStatus.error(err.toString()));
    });*/
  }
}
