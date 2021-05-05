// import 'dart:convert';
//
// import 'package:flutter/services.dart';
// import 'package:get/get_connect.dart';
// import 'package:wefinex/base/networking/api.dart';
// import 'package:wefinex/base/networking/result.dart';
// import 'package:wefinex/repository/model/bong_da_entity.dart';
// import 'package:wefinex/shared/constant/common.dart';
//
// import 'model/xoso_entity.dart';
//
// /*
// Created by ToanDev on 02/05/2021
// Company: Netacom.
// Email: hvtoan.dev@gmail.com
// */
//
// ///
// /// --------------------------------------------
// /// In this class where the [Function]s correspond to the API.
// /// Which function here you will make it and you will consume it.
// /// You can find and use on your Controller wich is the Controller extends [BaseController].
// class Repositories {
//   ApiService _service = ApiService();
//
//   Future<List<XosoEntity>> getDataXoSo() async {
//     final String assets = await rootBundle.loadString(Common().assetsImage.getListXoso);
//     final listXoSo = List<XosoEntity>.from(json.decode(assets).map((x) => XosoEntity().fromJson(x)));
//     return listXoSo;
//   }
//
//   Future<Result> getDataBongDa() async => await _service.getData(endPoint: "competitions", withToken: true);
// }
