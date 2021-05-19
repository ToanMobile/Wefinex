import 'package:flutter/material.dart';
import 'package:wefinex/shared/constant/common.dart';

import 'navigation_pop.dart';

enum IconType { BACK, CLOSE }

class AppBarIconData extends StatelessWidget {
  final IconType icon;
  final String rightTitle;
  final bool isOnlyIcon;
  final Color color;
  final DetailsClassWhichYouWantToPop? data;

  AppBarIconData.back({this.rightTitle = '', this.isOnlyIcon = false, this.color = Colors.white, this.data}) : this.icon = IconType.BACK;

  AppBarIconData.close({this.rightTitle = '', this.isOnlyIcon = false, this.color = Colors.white, this.data}) : this.icon = IconType.CLOSE;

  @override
  Widget build(BuildContext context) {
    if (this.icon == IconType.BACK) {
      if (this.isOnlyIcon) {
        return buildIconButtonBack(context);
      }
      if (this.rightTitle != '') {
        return buildAppBarBackTitle(context, this.rightTitle);
      } else {
        return buildAppBarBack(context);
      }
    }
    if (this.isOnlyIcon) {
      return buildIconButtonClose(context);
    }
    if (this.rightTitle != '') {
      return buildAppBarCloseTitle(context, this.rightTitle);
    } else {
      return buildAppBarClose(context);
    }
  }

  Widget buildIconButtonBack(BuildContext context) {
    return IconButton(
      onPressed: () => data != null ? Navigator.pop(context, data) : Navigator.pop(context),
      icon: Icon(
        Icons.keyboard_arrow_left,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget buildIconButtonClose(BuildContext context) {
    return IconButton(
      onPressed: () => data != null ? Navigator.pop(context, data) : Navigator.pop(context),
      icon: Icon(
        Icons.close,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  AppBar buildAppBarBack(BuildContext context) {
    return AppBar(
      leading: buildIconButtonBack(context),
      backgroundColor: this.color,
      elevation: 0.0,
    );
  }

  AppBar buildAppBarBackTitle(BuildContext context, String title) {
    return AppBar(
      leading: buildIconButtonBack(context),
      backgroundColor: this.color,
      elevation: 0.0,
      centerTitle: true,
      title: buildAlignAppBar(title),
    );
  }

  AppBar buildAppBarClose(BuildContext context) {
    return AppBar(
      leading: buildIconButtonClose(context),
      backgroundColor: this.color,
      centerTitle: true,
      elevation: 0.0,
    );
  }

  AppBar buildAppBarCloseTitle(BuildContext context, String title) {
    return AppBar(
      leading: buildIconButtonClose(context),
      backgroundColor: this.color,
      elevation: 0.0,
      title: buildAlignAppBar(title),
    );
  }

  Widget buildAlignAppBar(String title) {
    return Text(title, style: Common().textStyle.styleBold18White);
  }
}
