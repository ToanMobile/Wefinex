import 'package:get/get.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/crypto.dart';

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
    getListCoin().then(
      (data) {
        //print("CURRENT listCoin== $data");
        change(data, status: RxStatus.success());
        update();
      },
      onError: (err) {
        print("CURRENT Error== $err");
        change(null, status: RxStatus.error(err.toString()));
      },
    );
  }
}
