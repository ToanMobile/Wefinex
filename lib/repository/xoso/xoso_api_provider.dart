import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:wefinex/repository/model/xoso_entity.dart';

/*
Created by ToanDev on 05/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

abstract class IXoSoProvider {
  Future<List<XosoEntity>> getDataXoSo(String path);
}

class XoSoProvider implements IXoSoProvider {
  @override
  Future<List<XosoEntity>> getDataXoSo(String path) async {
    final String assets = await rootBundle.loadString(path);
    final listXoSo = List<XosoEntity>.from(json.decode(assets).map((x) => XosoEntity().fromJson(x)));
    return listXoSo;
  }
}
