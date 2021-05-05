import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wefinex/base/base_view_view_model.dart';
import 'package:wefinex/shared/constant/common.dart';
import 'bongda_binding.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class BongDaScreen extends BaseView<BongDaController> {
  @override
  Widget vBuilder() => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              buildWidgetTitle(),
              SizedBox(
                height: Common().dimen.marginM,
              ),
              buildWidgetGrid(),
            ],
          ),
        ),
      );

  buildWidgetTitle() => Text(
        "Bảng xếp hạng",
        style: Common().textStyle.styleBold18White,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );

  buildWidgetGrid() => GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: List.generate(
          controller.state?.competitions?.length ?? 0,
          (index) {
            return Column(
              children: [
                SvgPicture.network(
                  controller.state?.competitions?[index].emblemUrl ?? "",
                  width: 100,
                  height: 50,
                ),
                Text(controller.state?.competitions?[index].name ?? "", style: Common().textStyle.styleRegular12Black),
              ],
            );
          },
        ),
      );
}
