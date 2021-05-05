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
  Widget vBuilder() => SingleChildScrollView(
        child: Column(
          children: [
            buildWidgetTitle(),
            SizedBox(
              height: Common().dimen.margin_10,
            ),
            buildWidgetGrid(),
          ],
        ),
      );

  buildWidgetTitle() => Text(
        "Bảng xếp hạng",
        style: Common().textStyle.styleBold18Black,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  buildWidgetGrid() {
    print("getScreenState=" + controller.getScreenState.toString());
    if (controller.screenStateIsLoading) return Center(child: CircularProgressIndicator());
    if (controller.screenStateIsError) return Text(Common().string.error_message);
    if (controller.screenStateIsOK)
      return GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: List.generate(
          controller.listData.length,
          (index) {
            return Column(
              children: [
                controller.listData[index].emblemUrl != null
                    ? SvgPicture.network(
                        controller.listData[index].emblemUrl,
                        width: 400.0,
                        height: 150.0,
                        allowDrawingOutsideViewBox: true,
                      )
                    : SvgPicture.asset(
                        Common().assetsImage.icon_bottom_soxo,
                        width: 400.0,
                        height: 150.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                SizedBox(
                  height: Common().dimen.margin_10,
                ),
                Text(controller.listData[index].name ?? "", style: Common().textStyle.styleRegular16Black),
              ],
            );
          },
        ),
      );
  }
}
