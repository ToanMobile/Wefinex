import 'package:flutter/material.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/crypto.dart';

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

  List<Data> data = [];
  String currPrice = "0";
  String currencySetting = "\$"; //TODO: set in Settings page
  Widget? chart;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildSettingChart(),
      );

  buildSettingChart() => Scrollbar(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                      crypto.change + ' ' + ((crypto.changeValue == null) ? 'N/A'.toString() : double.parse(crypto.changeValue).abs().toStringAsFixed(2)) + '%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: (double.parse(crypto.changeValue) >= 0) ? Colors.greenAccent[700] : Colors.redAccent[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: chart == null ? _buildChart() : chart,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ToggleButtons(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
                color: Colors.amberAccent[400],
                selectedColor: Colors.grey[900],
                fillColor: Colors.amberAccent[400],
                isSelected: isSelected,
                children: [
                  Text('8H'),
                  Text('1D'),
                  Text('1W'),
                  Text('1M'),
                  Text('6M'),
                ],
                onPressed: (index) {
                  setState(() {
                    chart = null;

                    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }

                    type = HistoricalDataType.values[index];
                  });
                },
              ),
            ),
          ],
        ),
      );
  buildChart() {
    return FutureBuilder(
      future: _getSeriesData(),
      builder: (context, snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Expanded(
              child: charts.TimeSeriesChart(
                snapshot.data,
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
              ),
            ),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}
