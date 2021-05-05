import 'package:get/get.dart';
import 'package:wefinex/base/base_controller.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/bongda/bongda_api_provider.dart';
import 'package:wefinex/repository/bongda/bongda_repository.dart';
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
   /* Get.lazyPut<IBongDaProvider>(() => BongDaProvider());
    Get.lazyPut<IBongDaRepository>(() => BongDaRepository(provider: Get.find()));
    Get.lazyPut(() => BongDaController(bongDaRepository: Get.find()));*/
    Get.lazyPut(() => BongDaController(bongDaRepository: Get.find()));
  }
}

class BongDaController extends SuperBaseController<BongDaEntity> {
  BongDaController({required this.bongDaRepository});

  final IBongDaRepository bongDaRepository;

  @override
  void onInit() async {
    super.onInit();
    bongDaRepository.getDataBongDa().then((data) {
      change(data, status: RxStatus.success());
      logWhenDebug("CURRENT listBongDa : ", data.toString());
    }, onError: (err) {
      print('Error : $err');
      change(null, status: RxStatus.error(Common().string.error_message));
    });
  }
//append(() => bongDaRepository.getDataBongDa);
}
/*
  void onGetListBongDa() async {
    setScreenState = screenStateLoading;
    final res = await getDataBongDa();
    String text = '';
    if (res.isError == true) {
      text = Common().string.error_message;
      setScreenState = screenStateError;
    }
    if (res.status == true) {
      try {
        logWhenDebug("CURRENT res.body : ", res.body);
        listBongda = BongDaEntity().fromJson(res.body).competitions;
        setScreenState = screenStateOk;
      } catch (e) {
        text = e.toString();
      }
    } else {
      text = res.text ?? Common().string.error_message;
      setScreenState = screenStateError;
    }
    if (text.isNotEmpty) {
      showSnackBar(title: "Response", message: text);
    }
    update();
  }*/
