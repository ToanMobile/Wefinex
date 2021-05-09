import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wefinex/base/base_view_view_model.dart';
import 'package:wefinex/repository/model/coin_entity.dart';
import 'package:wefinex/shared/constant/common.dart';
import 'package:wefinex/shared/utils/market_utils.dart';

import 'home_binding.dart';
import 'market/coin_list_screen.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class HomeScreen extends BaseView<HomeController> {
  final marketColumnProps = [.32, .35, .28];
  List<CoinData>? filteredMarketData;
  List marketSortType = ["MKTCAP", true];
  String filter = "";
  final String upArrow = "⬆";
  final String downArrow = "⬇";

  @override
  Widget vBuilder() => Scaffold(
        body: _body(),
      );

  _body() {
    _filterMarketData();
    print("filteredMarketData==" + (filteredMarketData?.length ?? 0).toString());
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
                              ? Text(marketSortType[1] ? "${Common().string.currency} " + upArrow : "${Common().string.currency} " + downArrow,
                                  style: Common().textStyle.styleRegular12White)
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
                                    ? Text(marketSortType[1] ? "${Common().string.market_cap} " + downArrow : "${Common().string.market_cap} " + upArrow,
                                        style: Common().textStyle.styleRegular12White)
                                    : Text(Common().string.market_cap, style: Common().textStyle.styleRegular12White),
                              ),
                            ),
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
                              ? Text(marketSortType[1] == true ? "${Common().string.price_24h} " + downArrow : "${Common().string.price_24h} " + upArrow,
                                  style: Common().textStyle.styleRegular12White)
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

  _filterMarketData() {
    filteredMarketData = controller.listData;
    print("filteredMarketData==" + (filteredMarketData?.length ?? 0).toString());
    if (filter != "" && filter != null) {
      List<CoinData> tempFilteredMarketData = [];
      filteredMarketData?.forEach((item) {
        if ((item.coinInfo?.name ?? "").toLowerCase().contains(filter.toLowerCase()) || (item.coinInfo?.fullName ?? "").toLowerCase().contains(filter.toLowerCase())) {
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
        filteredMarketData?.sort((a, b) => (b.rAW?.uSD?.lASTMARKET?[marketSortType[0]] ?? 0).compareTo(a["RAW"]["USD"][marketSortType[0]] ?? 0));
        if (marketSortType[0] == "MKTCAP") {
          print("adding ranks to filteredMarketData");
          int i = 1;
          for (CoinData coin in filteredMarketData!) {
            coin["rank"] = i;
            i++;
          }
        }
      } else {
        // Handle sorting by name
        filteredMarketData?.sort((a, b) => (b.coinInfo[marketSortType[0]] ?? 0).compareTo(a["CoinInfo"][marketSortType[0]] ?? 0));
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
