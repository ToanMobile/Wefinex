import 'package:get/get.dart';
import 'package:wefinex/base/base_controller.dart';
import 'package:wefinex/repository/model/bong_da_entity.dart';
import 'package:wefinex/shared/constant/common.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class BongDaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BongDaController());
  }
}

class BongDaController extends BaseController {
  var listData;

  @override
  void onInit() async {
    super.onInit();
    onGetListBongDa();
    logWhenDebug("CURRENT listBongda : ", listData.toString());
  }

  void onGetListBongDa() async {
    setScreenState = screenStateLoading;
    final res = await getDataBongDa();
    String text = '';
    print("onGetListBongDa="+ res.toString());
    if (res.status == true && res.body != null) {
      try {
        listData = BongDaEntity().fromJson(res.body).competitions;
        print("listData=="+ listData.toString());
        setScreenState = screenStateOk;
      } catch (e) {
        text = e.toString();
      }
    } else {
      text = res.text ?? Common().string.error_message;
      setScreenState = screenStateError;
    }
    if (res.isError == true) {
      text = Common().string.error_message;
      setScreenState = screenStateError;
    }
    if (text.isNotEmpty) {
      showSnackBar(title: "Response", message: text);
    }
    update();
  }
}
