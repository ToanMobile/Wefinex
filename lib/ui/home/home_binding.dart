import 'package:get/get.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/coin_entity.dart';

/*
Created by ToanDev on 05/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends SuperBaseController<List<CoinEntity>> {
  @override
  void onInit() async {
    super.onInit();
    getListCoin().then((data) {
      if (data.isOk) {
        change(data.body, status: RxStatus.success());
        logWhenDebug("CURRENT listCoin: ", data.body.toString());
      } else {
        change(null, status: RxStatus.error(data.statusText.toString()));
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
