import 'package:flutter/material.dart';
import 'package:wefinex/base/super_base_controller.dart';

import 'coin_details_binding.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class CoinDetailsScreen extends GetView<CoinDetailsController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: controller.obx((state) {
          return Container();
        }),
      );
}
