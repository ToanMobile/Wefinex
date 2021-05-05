import 'package:get/get.dart';
import 'package:wefinex/base/base_controller.dart';
import 'package:wefinex/base/super_base_controller.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends BaseController {

  @override
  void onInit() {
    super.onInit();
    logWhenDebug("HomeController", "1");
   /* MyTranslations.init();
    logWhenDebug("CURRENT LANGUAGE : ", Get.locale.languageCode.toString());*/
  }

}