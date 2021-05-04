import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wefinex/base/networking/api.dart';
import 'package:wefinex/base/networking/result.dart';
import 'package:wefinex/shared/constant/common.dart';

import 'model/xoso_entity.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

///
/// --------------------------------------------
/// In this class where the [Function]s correspond to the API.
/// Which function here you will make it and you will consume it.
/// You can find and use on your Controller wich is the Controller extends [BaseController].
class Repositories {
  ApiService _service = ApiService();

  Future<List<XosoEntity>> getDataXoso() async {
    final String response = await rootBundle.loadString(Common().assetsImage.getListXoso);
    final listXoso = List<XosoEntity>.from(json.decode(response).map((x) => XosoEntity().fromJson(x)));
    return listXoso;
  }

  Future<Result> getDataBongDa() async => await _service.getData(endPoint: "test-get");
}
