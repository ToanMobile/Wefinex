import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/routes/app_pages.dart';
import 'package:wefinex/shared/constant/common.dart';
import 'home_binding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildWidgetMarket(),
      );

  buildWidgetMarket() => controller.obx(
        (state) {
          if ((state?.length != null)) {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 60.w,
                        child: Text(
                          Common().string.coin_rank,
                          style: Common().textStyle.styleBold14Black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 90.w,
                        child: Text(
                          Common().string.coin_name,
                          style: Common().textStyle.styleBold14Black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 60.w,
                        child: Text(
                          Common().string.coin_symbol,
                          style: Common().textStyle.styleBold14Black,
                        ),
                      ),
                      Container(
                        width: 60.w,
                        child: Text(
                          Common().string.coin_price,
                          style: Common().textStyle.styleBold14Black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          Common().string.coin_change_1h,
                          style: Common().textStyle.styleBold14Black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.state?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = controller.state![index];
                        return ElevatedButton(
                          onPressed: () => Get.offNamed(Routes.COIN_DETAILS),
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
                                buildWidgetNameRank(item.name.toString(), item.image.toString()),
                                SizedBox(
                                  width: 10.w,
                                ),
                                buildWidgetSymbolRank(item.symbol.toString()),
                                SizedBox(
                                  width: 10.w,
                                ),
                                buildWidgetPrice(item.currentPrice.toString()),
                                SizedBox(
                                  width: 10.w,
                                ),
                                buildWidgetChange1h(item.priceChangePercentage24h.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container(
              child: Text("Empty"),
            );
          }
        },
      );

  buildWidgetTitleRank(String title) => Expanded(
        flex: 1,
        child: Text(
          title,
          style: Common().textStyle.styleBold12Black,
        ),
      );

  buildWidgetNameRank(String name, String icon) => Expanded(
        flex: 7,
        child: Row(
          children: [
            Image.network(
              icon,
              height: 50.h,
              width: 25.w,
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

  buildWidgetSymbolRank(String symbol) => Expanded(
        flex: 3,
        child: Text(
          symbol.toUpperCase(),
          style: Common().textStyle.styleBold12Black,
        ),
      );

  buildWidgetPrice(String price) => Expanded(
        flex: 4,
        child: Text(
          price,
          style: Common().textStyle.styleBold12Black,
        ),
      );

  buildWidgetChange1h(String price1h) => Expanded(
        flex: 4,
        child: Text(
          price1h,
          style: Common().textStyle.styleBold12Black,
        ),
      );
}
