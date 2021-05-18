// ignore: import_of_legacy_library_into_null_safe
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/crypto.dart';
import 'package:wefinex/shared/constant/common.dart';

import 'coin_details_binding.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class CoinDetailsScreen extends GetView<CoinDetailsController> {
  CoinEntity? crypto;
  List<bool> isSelected = [false, true, false, false, false];
  HistoricalDataType type = HistoricalDataType.one_day;
  String currPrice = "0";
  String currencySetting = "\$"; //TODO: set in Settings page

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Common().color.darkScaffoldBackgroundColor,
        body: buildSettingChart(),
      );

  buildSettingChart() => controller.obx(
        (state) {
          return Scrollbar(
            child: Padding(
              padding: const EdgeInsets.only(top: 48.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                children: [
                  buildFavourite(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            '$currPrice $currencySetting',
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            crypto?.change ??
                                "0" + ' ' + ((crypto?.changeValue == null) ? 'N/A'.toString() : double.parse(crypto?.changeValue ?? "0").abs().toStringAsFixed(2)) + '%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: (double.parse(crypto?.changeValue ?? "0") >= 0) ? Colors.greenAccent[700] : Colors.redAccent[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildChart(controller.state),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ToggleButtons(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                      color: Common().color.blueAccent,
                      selectedColor: Colors.grey[900],
                      fillColor: Common().color.blueAccent,
                      isSelected: isSelected,
                      children: [
                        Text('8H'),
                        Text('1D'),
                        Text('1W'),
                        Text('1M'),
                        Text('6M'),
                      ],
                      onPressed: (index) {
                        for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected[buttonIndex] = true;
                          } else {
                            isSelected[buttonIndex] = false;
                          }
                        }
                        type = HistoricalDataType.values[index];
                        controller.setTypeTime(type);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    if (selectedDatum.isNotEmpty) {
      currPrice = double.parse(selectedDatum.first.datum.price).toStringAsFixed(6);
      controller.update();
    }
  }

  buildChart(List<charts.Series<DataPrice, DateTime>>? listData) => Container(
        child: listData != null
            ? charts.TimeSeriesChart(
                listData,
                animate: true,
                behaviors: [
                  charts.LinePointHighlighter(
                      showHorizontalFollowLine: charts.LinePointHighlighterFollowLineType.all, showVerticalFollowLine: charts.LinePointHighlighterFollowLineType.all),
                  charts.SelectNearest(eventTrigger: charts.SelectionTrigger.pressHold)
                ],
                selectionModels: [
                  charts.SelectionModelConfig(
                    type: charts.SelectionModelType.info,
                    changedListener: _onSelectionChanged,
                  ),
                ],
                primaryMeasureAxis: charts.NumericAxisSpec(
                  renderSpec: charts.GridlineRendererSpec(
                    lineStyle: charts.LineStyleSpec(
                      color: charts.ColorUtil.fromDartColor(Colors.grey[700]),
                    ),
                    labelStyle: charts.TextStyleSpec(
                      fontSize: 13,
                      color: charts.ColorUtil.fromDartColor(Colors.grey[300]),
                    ),
                  ),
                  tickProviderSpec: charts.BasicNumericTickProviderSpec(zeroBound: false, dataIsInWholeNumbers: false),
                ),
                domainAxis: charts.DateTimeAxisSpec(
                  renderSpec: charts.SmallTickRendererSpec(
                    labelStyle: charts.TextStyleSpec(
                      fontSize: 13,
                      color: charts.ColorUtil.fromDartColor(Colors.grey[300]),
                    ),
                  ),
                ),
              )
            : Container(
                child: Text(
                  "Empty",
                  style: Common().textStyle.styleRegular12White,
                ),
              ),
      );

  buildFavourite() => Container(
      height: 50.h,
      child: TextButton.icon(
          onPressed: () => controller.addFavourite(),
          icon: controller.isFavorite.value ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined),
          label: Text(Common().string.favourite)));
}
