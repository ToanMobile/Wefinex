import 'package:get/get.dart';
import 'package:wefinex/base/base_controller.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class BongdaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BongdaController());
  }

}

class BongdaController extends BaseController {

  @override
  void onInit() {
    super.onInit();
   /* MyTranslations.init();
    logWhenDebug("CURRENT LANGUAGE : ", Get.locale.languageCode.toString());*/
  }

}