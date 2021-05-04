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
  var listXoso = XosoEntity();
  @override
  void onInit() {
    super.onInit();
    onGetListXoso();
   /* MyTranslations.init();
    logWhenDebug("CURRENT LANGUAGE : ", Get.locale.languageCode.toString());*/
  }

  void onGetListXoso() async {
    showLoadingDialog();
    listXoso = await getDataXoso();
    hideDialog();
    update();
  }
}