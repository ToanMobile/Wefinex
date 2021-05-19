import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wefinex/shared/constant/common.dart';

class BuildWidgetIconName extends StatelessWidget {
  final icon;
  final name;

  BuildWidgetIconName(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              style: Common().textStyle.styleBold12White,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
