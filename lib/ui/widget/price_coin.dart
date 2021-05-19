import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wefinex/shared/constant/common.dart';

class BuildWidgetPrice extends StatelessWidget {
  final price;
  final change;
  final changeValue;
  final formatter = NumberFormat.currency(locale: 'vi', decimalDigits: 3);

  BuildWidgetPrice(this.price, this.change, this.changeValue);

  @override
  Widget build(BuildContext context) {
    final changeColor = double.tryParse(changeValue ?? "0") == null
        ? Common().textStyle.styleBold14Grey
        : (double.parse(changeValue ?? "0") >= 0)
            ? Common().textStyle.styleBold14Green
            : Common().textStyle.styleBold14Red;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            formatter.format(double.tryParse(price ?? "0")),
            style: Common().textStyle.styleBold14Grey,
          ),
          Text(
            (change ?? "0") + ' ' + double.parse(changeValue ?? "0").abs().toStringAsFixed(2) + '%',
            style: changeColor,
          ),
        ],
      ),
    );
  }
}
