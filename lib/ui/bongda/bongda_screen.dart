import 'package:flutter/material.dart';
import 'package:wefinex/base/base_view_view_model.dart';
import 'package:wefinex/shared/constant/common.dart';
import 'bongda_binding.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class BongDaScreen extends BaseView<BongdaController> {

  @override
  Widget vBuilder() => Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("BongDa"),
          ),
        ),
      );
}
