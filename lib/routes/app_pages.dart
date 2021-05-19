import 'package:get/get.dart';
import 'package:wefinex/ui/bottom_nav_view/bottom_navigation_binding.dart';
import 'package:wefinex/ui/bottom_nav_view/bottom_navigation_view.dart';
import 'package:wefinex/ui/details/coin_details_binding.dart';
import 'package:wefinex/ui/details/coin_details_screen.dart';
import 'package:wefinex/ui/webview/webview_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.COIN_DETAILS,
      page: () => CoinDetailsScreen(),
      binding: CoinDetailsBinding(),
    ),
    GetPage(
      name: Routes.WEB_VIEW,
      page: () => WebViewScreen(),
    ),
    GetPage(name: Routes.HOME, page: () => BottomNavigationView(), binding: BottomNavigationBinding(), children: [
      GetPage(
        name: Routes.COIN_DETAILS,
        page: () => CoinDetailsScreen(),
        binding: CoinDetailsBinding(),
      ),
    ]),
  ];
}
