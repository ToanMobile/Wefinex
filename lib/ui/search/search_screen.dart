import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wefinex/base/super_base_controller.dart';

import 'search_binding.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class SearchScreen extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildWidgetMarket(),
      );

  buildWidgetMarket() => Container();
}
