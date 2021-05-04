import 'package:get/get.dart';
import 'package:wefinex/ui/bongda/bongda_binding.dart';
import 'package:wefinex/ui/bongda/bongda_screen.dart';
import 'package:wefinex/ui/bottom_nav_view/bottom_navigation_view.dart';
import 'package:wefinex/ui/bottom_nav_view/bottom_navigation_view_controller.dart';
import 'package:wefinex/ui/home/home_binding.dart';
import 'package:wefinex/ui/home/home_screen.dart';
import 'package:wefinex/ui/xoso/xoso_binding.dart';
import 'package:wefinex/ui/xoso/xoso_screen.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => BottomNavigationView(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => BottomNavigationViewController()),
            Get.lazyPut(() => HomeController()),
            Get.lazyPut(() => XoSoController()),
            Get.lazyPut(() => BongdaController()),
          }),
    ),
    GetPage(
      name: Routes.COIN,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SO_XO,
      page: () => XoSoScreen(),
      binding: XoSoBinding(),
    ),
    GetPage(
      name: Routes.BONG_DA,
      page: () => BongDaScreen(),
      binding: BongdaBinding(),
    )
  ];
}
