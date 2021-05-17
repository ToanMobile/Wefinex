import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService extends GetxService {
  Future<dynamic> init() async {
    await Hive.initFlutter();
    //Hive.registerAdapter(DbCoin());
  }
}
