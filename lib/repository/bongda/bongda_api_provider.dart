
import 'package:get/get.dart';
import 'package:wefinex/repository/model/bong_da_entity.dart';
import 'package:wefinex/shared/constant/common.dart';

/*
Created by ToanDev on 05/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

abstract class IBongDaProvider {
  Future<Response<BongDaEntity>> getDataBongDa(String path);
}

class BongDaProvider extends GetConnect implements IBongDaProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => BongDaEntity().fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = Common().myConfig.BASE_URL_BONGDA;
  }

  @override
  Future<Response<BongDaEntity>> getDataBongDa(String path) => get(path);
}
