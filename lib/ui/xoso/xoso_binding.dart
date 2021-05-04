import 'package:get/get.dart';
import 'package:wefinex/base/base_controller.dart';
import 'package:wefinex/repository/model/xoso_entity.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/
class XoSoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => XoSoController());
  }
}

class XoSoController extends BaseController {
  var listXoso;

  @override
  void onInit() async {
    super.onInit();
    onGetListXoso();
    logWhenDebug("CURRENT listXoso : ", listXoso.toString());
  }

  void onGetListXoso() async {
    setScreenState = screenStateLoading;
    listXoso = await getDataXoso();
    setScreenState = screenStateOk;
    update();
  }
}
