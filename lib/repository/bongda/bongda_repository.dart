import 'package:wefinex/repository/Xoso/xoso_api_provider.dart';
import 'package:wefinex/repository/bongda/bongda_api_provider.dart';
import 'package:wefinex/repository/model/bong_da_entity.dart';
import 'package:wefinex/repository/model/xoso_entity.dart';
import 'package:wefinex/shared/constant/common.dart';

/*
Created by ToanDev on 05/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

abstract class IBongDaRepository {
  Future<BongDaEntity> getDataBongDa();
}

class BongDaRepository implements IBongDaRepository {
  BongDaRepository({required this.provider});

  final IBongDaProvider provider;

  @override
  Future<BongDaEntity> getDataBongDa() async {
    final cases = await provider.getDataBongDa("competitions");
    print("object==" + cases.toString());
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }
}
