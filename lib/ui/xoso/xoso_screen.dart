import 'package:flutter/material.dart';
import 'package:wefinex/base/base_view_view_model.dart';
import 'package:wefinex/shared/constant/common.dart';
import 'xoso_binding.dart';

/*
Created by ToanDev on 04/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class XoSoScreen extends BaseView<XoSoController> {
  @override
  Widget vBuilder() => Scaffold(
        body: _body(),
      );

  _body() {
    print('controller='+ controller.getScreenState.toString());
    if (controller.screenStateIsLoading) return Center(child: CircularProgressIndicator());
    if (controller.screenStateIsError) return Text(Common().string.error_message);
    if (controller.screenStateIsOK)
      return Center(
        key: UniqueKey(),
        child: ListView(
          children: [
            Text("${controller.listXoso[0].toString()}"),
          ],
        ),
      );
  }
}
