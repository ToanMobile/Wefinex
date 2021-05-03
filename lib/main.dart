import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'di.dart';
import 'lang/translation_service.dart';
import 'routes/app_pages.dart';
import 'shared/logger/logger_utils.dart';

void main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  print('starting services ...');
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  print('All services started...');
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
