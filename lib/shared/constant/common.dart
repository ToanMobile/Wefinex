import 'package:get/get.dart';
import 'package:flutter/material.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class Common {
  _String string = _String();
  _AssetsImage assetsImage = _AssetsImage();
  _Color color = _Color();
  _MyConfig myConfig = _MyConfig();
  _Storage storage = _Storage();
  _Dimen dimen = _Dimen();
}

class _AssetsImage {
  static const String images = 'assets/images/';
  static const String icons = 'assets/icons/';
  String img_logo = images + 'img_logo.png';
  String icon_bottom_home = icons + 'settings_icon.svg';
  String icon_bottom_soxo = icons + 'settings_icon.svg';
  String icon_bottom_bongda = icons + 'settings_icon.svg';

  //Screen Soxo
  String icon_soxo = icons + 'soxo.webp';

  //Get data Xoso
  String getListXoso = 'assets/json/soxo.json';
}

class _String {
  String title_app = 'title_app'.tr;
  String coin = 'coin'.tr;
  String xoso = 'xoso'.tr;
  String bongda = 'bongda'.tr;
  String peringatan = 'peringatan'.tr;
  String tutup = 'tutup'.tr;
  String reload = 'reload'.tr;
  String error_message = 'error_message'.tr;
  String beranda = 'beranda'.tr;
  String change_lang = 'change_lang'.tr;
  String increment = 'increment'.tr;
  String goto_test = 'goto_test'.tr;
  String test_screen = 'test_screen'.tr;
  String my_flutter = 'my_flutter'.tr;
  String change_theme = 'change_theme'.tr;
}

class _Storage {
  final String token = 'token';
  final String userInfo = 'userInfo';
  final String theme = 'darkMode';
}

class _Color {
  Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  Color secondaryAppColor = hexToColor('#22DDA6');
  Color secondaryDarkAppColor = Colors.white;
  Color tipColor = hexToColor('#B6B6B6');
  Color lightGray = Color(0xFFF6F6F6);
  Color darkGray = Color(0xFF9F9F9F);
  Color black = Color(0xFF000000);
  Color white = Color(0xFFFFFFFF);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex), 'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class _Dimen {
  /// Padding
  final double paddingZero = 0.0;
  final double paddingXS = 2.0;
  final double paddingS = 4.0;
  final double paddingM = 8.0;
  final double paddingL = 16.0;
  final double paddingXL = 32.0;
  final double paddingXXL = 36.0;

  /// Margin
  final double marginZero = 0.0;
  final double marginXS = 2.0;
  final double marginS = 4.0;
  final double marginM = 8.0;
  final double marginL = 16.0;
  final double marginXL = 32.0;

  /// Spacing
  final double spaceXS = 2.0;
  final double spaceS = 4.0;
  final double spaceM = 8.0;
  final double spaceL = 16.0;
  final double spaceXL = 32.0;
}

class _MyConfig {
  /// APP CONFIG
  final String APP_NAME = "-- WEFINEX --";
  final String BASE_URL_XOSO = "https://xskt.com.vn/";
  final String TOKEN_STRING_KEY = 'TOKEN_STRING_KEY';
  final String EMAIL_KEY = 'EMAIL_KEY';
  final String FCM_TOKEN_KEY = 'EMAIL_KEY';

  /// CUSTOM CONFIG APP
  final String LANGUAGE = 'LANGUAGE';
}
