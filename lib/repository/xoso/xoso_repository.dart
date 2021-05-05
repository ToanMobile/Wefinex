import 'package:wefinex/repository/Xoso/xoso_api_provider.dart';
import 'package:wefinex/repository/model/xoso_entity.dart';
import 'package:wefinex/shared/constant/common.dart';

/*
Created by ToanDev on 05/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

abstract class IXoSoRepository {
  Future<List<XosoEntity>> getDataXoSo();
}

class XoSoRepository implements IXoSoRepository {
  XoSoRepository({required this.provider});
  final IXoSoProvider provider;

  @override
  Future<List<XosoEntity>> getDataXoSo() async => await provider.getDataXoSo(Common().assetsImage.getListXoso);
}
