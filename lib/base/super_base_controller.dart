import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:wefinex/repository/model/db_coin.dart';
import 'package:wefinex/repository/repositories.dart';
import 'package:wefinex/shared/utils/utilities.dart';

import 'base_common_widgets.dart';

export 'package:get/get.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

///
/// --------------------------------------------
/// [Example]
///
/// class HomeController extends BaseController {
///
///   var count = 0.obs;
///
///   @override
///   void onInit() {
///     super.onInit();
///   }
///
///   void increment() => count ++;
///
/// }
///
/// RECOMENDED FOR your [Controller].
/// Please extends to your [Controller].
/// read the [Example] above.

class SuperBaseController<T> extends SuperController<T> with BaseCommonWidgets, Utilities, Repositories {
  var hive;

  @override
  void onReady() async {
    print('The build method is done. ' 'Your controller is ready to call dialogs and snackbars');
    hive = Hive.openBox<DbCoin>('dbCoin');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose called');
    hive.close();
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    print('platform change ThemeMode');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('the route $route will be open');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    print('the current route will be closed');
    return super.didPopRoute();
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }
}
