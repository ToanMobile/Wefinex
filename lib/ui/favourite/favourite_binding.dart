import 'package:get/get.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/crypto.dart';

/*
Created by ToanDev on 05/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/
class FavouriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavouriteController());
  }
}

class FavouriteController extends SuperBaseController<List<CoinEntity>> {
  @override
  void onReady() async {
    getListTop().then(
      (data) {
        if (data != null && data.length > 0) {
          change(data, status: RxStatus.success());
        } else {
          change(data, status: RxStatus.empty());
        }
      },
      onError: (err) {
        print("CURRENT Error== $err");
        change(null, status: RxStatus.error(err.toString()));
      },
    );
    super.onReady();
  }
}
