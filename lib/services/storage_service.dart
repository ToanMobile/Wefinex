import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:objectbox/objectbox.dart';
import 'package:wefinex/objectbox.g.dart';

class StorageService extends GetxService {
  Future<bool> init() async {
    getApplicationDocumentsDirectory().then((Directory dir) {
      Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
    });
    return await GetStorage.init();
  }
}
