import 'package:get/get.dart';
import 'package:wefinex/base/base_controller.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/Xoso/xoso_api_provider.dart';
import 'package:wefinex/repository/Xoso/xoso_repository.dart';
import 'package:wefinex/repository/model/xoso_entity.dart';

/*
Created by ToanDev on 05/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class XoSoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IXoSoProvider>(() => XoSoProvider());
    Get.lazyPut<IXoSoRepository>(() => XoSoRepository(provider: Get.find()));
    Get.lazyPut(() => XoSoController(xoSoRepository: Get.find()));
  }
}

class XoSoController extends SuperBaseController<List<XosoEntity>> {
  XoSoController({required this.xoSoRepository});

  final IXoSoRepository xoSoRepository;

  @override
  void onInit() async {
    super.onInit();
    append(() => xoSoRepository.getDataXoSo);
    logWhenDebug("CURRENT listXoSo : ", state.toString());
  }
}
