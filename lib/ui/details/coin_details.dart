import 'package:flutter/material.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/shared/constant/common.dart';
import 'coin_details_binding.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("Home"),
          ),
        ),
      );
}
