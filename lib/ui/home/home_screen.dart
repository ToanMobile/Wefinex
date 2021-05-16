import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/crypto.dart';
import 'package:wefinex/routes/app_pages.dart';
import 'package:wefinex/shared/constant/common.dart';

import 'home_binding.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            buildTitleTop(),
            controller.obx(
              (state) {
                if (state?.length != null) {
                  return buildWidgetMarket(state);
                } else {
                  return Container(
                    child: Text(
                      "Empty",
                      style: Common().textStyle.styleBold14Black,
                    ),
                  );
                }
              },
            )
          ],
        ),
      );

  buildWidgetMarket(List<CoinEntity>? state) => Expanded(
        child: ListView.builder(
          itemCount: state?.length,
          itemBuilder: (BuildContext context, int index) {
            final item = state![index];
            return ElevatedButton(
              onPressed: () => Get.offNamed(Routes.COIN_DETAILS, arguments: item.name),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    buildWidgetTitleRank(item.marketCapRank.toString()),
                    SizedBox(
                      width: 10.w,
                    ),
                    buildWidgetNameRank(item.name.toString(), item.logoUrl.toString()),
                    SizedBox(
                      width: 10.w,
                    ),
                    buildWidgetChange(item.price, item.change, item.changeValue),
                  ],
                ),
              ),
            );
          },
        ),
      );

  buildTitleTop() => Padding(
        padding: EdgeInsets.fromLTRB(0.0, 10.h, 0.0, 10.h),
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            border: Border(
              bottom: BorderSide(
                width: 2.0,
                color: Common().color.darkGray,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageIcon(
                AssetImage(Common().assetsImage.icon_top),
                color: Common().color.blueAccent,
              ),
              SizedBox(width: 10.w),
              Text(
                'LIST 100 COINS TOP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Common().color.blueAccent,
                ),
              ),
              SizedBox(width: 10.w),
              ImageIcon(
                AssetImage(Common().assetsImage.icon_top),
                color: Common().color.blueAccent,
              ),
            ],
          ),
        ),
      );

  buildWidgetTitleRank(String title) => Container(
        width: 20.w,
        child: Text(
          title,
          style: Common().textStyle.styleBold12Black,
        ),
      );

  buildWidgetNameRank(String name, String icon) => Expanded(
        flex: 1,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(icon),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Text(
                name,
                style: Common().textStyle.styleBold12Black,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      );

  buildWidgetChange(String? price, String? change, String? changeValue) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            double.parse(price ?? "0").toStringAsFixed(2) + Common().myConfig.currencySetting,
            style: Common().textStyle.styleBold14Black,
          ),
          Text(
            change ?? "0" + ' ' + double.parse(changeValue ?? "0").abs().toStringAsFixed(2) + '%',
            style: Common().textStyle.styleBold14Green,
          ),
        ],
      );
}
