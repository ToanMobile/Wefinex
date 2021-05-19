import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wefinex/shared/constant/common.dart';

class BuildWidgetTitleRank extends StatelessWidget {
  final titleRank;

  BuildWidgetTitleRank(this.titleRank);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 50.h,
      child: Center(
        child: Text(
          titleRank,
          style: Common().textStyle.styleBold12White,
        ),
      ),
    );
  }
}
