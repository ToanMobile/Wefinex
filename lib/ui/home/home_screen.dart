import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wefinex/base/base_view_view_model.dart';
import 'package:wefinex/shared/constant/common.dart';

import 'home_binding.dart';
import 'market/market_coin_item.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class HomeScreen extends BaseView<HomeController> {
  final marketColumnProps = [.32, .35, .28];
  List? filteredMarketData;
  Map? globalData;
  List marketSortType = ["MKTCAP", true];
  String filter = "";
  final String upArrow = "⬆";
  final String downArrow = "⬇";

  @override
  Widget vBuilder() => Scaffold(
        body: _body(),
      );

  _body() {
    if (controller.screenStateIsLoading) return Center(child: CircularProgressIndicator());
    if (controller.screenStateIsError) return Text(Common().string.error_message);
    if (controller.screenStateIsOK) return buildWidgetMarket();
  }

  buildWidgetMarket() => filteredMarketData != null
      ? RefreshIndicator(
          onRefresh: () => controller.onGetListCoin(),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                globalData != null
                    ? Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(Common().string.total_market_cap, style: Common().textStyle.styleRegular12White),
                                Padding(padding: const EdgeInsets.symmetric(vertical: 1.0)),
                                Text(Common().string.total_24h_volume, style: Common().textStyle.styleRegular12White),
                              ],
                            ),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 1.0)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text("\$" + normalizeNum(globalData!["total_market_cap"]), style: Common().textStyle.styleRegular12White),
                                Text("\$" + normalizeNum(globalData!["total_volume_24h"]), style: Common().textStyle.styleRegular12White),
                              ],
                            )
                          ],
                        ))
                    : Container(),
                Container(
                  margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Common().color.darkGray, width: 1.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          if (marketSortType[0] == "Name") {
                            marketSortType[1] = !marketSortType[1];
                          } else {
                            marketSortType = ["Name", false];
                          }
                          /*setState(() {
                            _sortMarketData();
                          });*/
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          width: ScreenUtil.defaultSize.width * marketColumnProps[0],
                          child: marketSortType[0] == "Name"
                              ? Text(marketSortType[1] ? "${Common().string.currency} " + upArrow : "${Common().string.currency} " + downArrow, style: Common().textStyle.styleRegular12White)
                              : Text(Common().string.currency, style: Common().textStyle.styleRegular12White),
                        ),
                      ),
                      Container(
                        width: ScreenUtil.defaultSize.width * marketColumnProps[1],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  if (marketSortType[0] == "MKTCAP") {
                                    marketSortType[1] = !marketSortType[1];
                                  } else {
                                    marketSortType = ["MKTCAP", true];
                                  }
                                  /*setState(() {
                                    _sortMarketData();
                                  });*/
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: marketSortType[0] == "MKTCAP"
                                      ? Text(marketSortType[1] ? "${Common().string.market_cap} " + downArrow : "${Common().string.market_cap} " + upArrow, style: Common().textStyle.styleRegular12White)
                                      : Text(Common().string.market_cap, style: Common().textStyle.styleRegular12White),
                                )),
                            Text("/", style: Common().textStyle.styleRegular12White),
                            InkWell(
                              onTap: () {
                                if (marketSortType[0] == "TOTALVOLUME24H") {
                                  marketSortType[1] = !marketSortType[1];
                                } else {
                                  marketSortType = ["TOTALVOLUME24H", true];
                                }
                                /*setState(() {
                                  _sortMarketData();
                                });*/
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: marketSortType[0] == "TOTALVOLUME24H"
                                    ? Text(marketSortType[1] ? "24h " + downArrow : "24h " + upArrow, style: Common().textStyle.styleRegular12White)
                                    : Text("24h", style: Common().textStyle.styleRegular12White),
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (marketSortType[0] == "CHANGEPCT24HOUR") {
                            marketSortType[1] = !marketSortType[1];
                          } else {
                            marketSortType = ["CHANGEPCT24HOUR", true];
                          }
                          /*setState(() {
                            _sortMarketData();
                          });*/
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          width: ScreenUtil.defaultSize.width * marketColumnProps[2],
                          child: marketSortType[0] == "CHANGEPCT24HOUR"
                              ? Text(marketSortType[1] == true ? "${Common().string.price_24h} " + downArrow : "${Common().string.price_24h} " + upArrow, style: Common().textStyle.styleRegular12White)
                              : Text(Common().string.price_24h, style: Common().textStyle.styleRegular12White),
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
              filteredMarketData!.isEmpty
                  ? SliverList(
                      delegate: SliverChildListDelegate(<Widget>[
                      Container(
                        padding: const EdgeInsets.all(30.0),
                        alignment: Alignment.topCenter,
                        child: Text("empty".tr, style: Common().textStyle.styleRegular12White),
                      )
                    ]))
                  : SliverList(
                      delegate: SliverChildBuilderDelegate((BuildContext context, int index) => CoinListItem(filteredMarketData![index], marketColumnProps),
                          childCount: filteredMarketData == null ? 0 : filteredMarketData?.length))
            ],
          ))
      : Container(
          child: Center(child: CircularProgressIndicator()),
        );

  normalizeNum(num? input) {
    if (input == null) {
      input = 0;
    }
    if (input >= 100000) {
      return numCommaParse(input.round().toString());
    } else if (input >= 1000) {
      return numCommaParse(input.toStringAsFixed(2));
    } else {
      return input.toStringAsFixed(6 - input.round().toString().length);
    }
  }

  numCommaParse(numString) {
    final shortenOn = false;
    if (shortenOn) {
      String str = num.parse(numString ?? "0").round().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
      List<String> strList = str.split(",");

      if (strList.length > 3) {
        return strList[0] + "." + strList[1].substring(0, 4 - strList[0].length) + "B";
      } else if (strList.length > 2) {
        return strList[0] + "." + strList[1].substring(0, 4 - strList[0].length) + "M";
      } else {
        return num.parse(numString ?? "0").toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
      }
    }

    return num.parse(numString ?? "0").toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  }

  _filterMarketData() {
    print("filtering market data");
    filteredMarketData = controller.listData;
    if (filter != "" && filter != null) {
      List tempFilteredMarketData = [];
      filteredMarketData?.forEach((item) {
        if (item["CoinInfo"]["Name"].toLowerCase().contains(filter.toLowerCase()) || item["CoinInfo"]["FullName"].toLowerCase().contains(filter.toLowerCase())) {
          tempFilteredMarketData.add(item);
        }
      });
      filteredMarketData = tempFilteredMarketData;
    }
    _sortMarketData();
  }

  _sortMarketData() {
    if (filteredMarketData == [] || filteredMarketData == null) {
      return;
    }
    // highest to lowest
    if (marketSortType[1]) {
      if (marketSortType[0] == "MKTCAP" || marketSortType[0] == "TOTALVOLUME24H" || marketSortType[0] == "CHANGEPCT24HOUR") {
        print(filteredMarketData);
        filteredMarketData?.sort((a, b) => (b["RAW"]["USD"][marketSortType[0]] ?? 0).compareTo(a["RAW"]["USD"][marketSortType[0]] ?? 0));
        if (marketSortType[0] == "MKTCAP") {
          print("adding ranks to filteredMarketData");
          int i = 1;
          for (Map coin in filteredMarketData!) {
            coin["rank"] = i;
            i++;
          }
        }
      } else {
        // Handle sorting by name
        filteredMarketData?.sort((a, b) => (b["CoinInfo"][marketSortType[0]] ?? 0).compareTo(a["CoinInfo"][marketSortType[0]] ?? 0));
      }
      // lowest to highest
    } else {
      if (marketSortType[0] == "MKTCAP" || marketSortType[0] == "TOTALVOLUME24H" || marketSortType[0] == "CHANGEPCT24HOUR") {
        filteredMarketData?.sort((a, b) => (a["RAW"]["USD"][marketSortType[0]] ?? 0).compareTo(b["RAW"]["USD"][marketSortType[0]] ?? 0));
      } else {
        filteredMarketData?.sort((a, b) => (a["CoinInfo"][marketSortType[0]] ?? 0).compareTo(b["CoinInfo"][marketSortType[0]] ?? 0));
      }
    }
  }
}
