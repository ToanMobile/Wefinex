import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:wefinex/repository/db/coin_dao.dart';
import 'package:wefinex/repository/model/crypto.dart';

part 'database.g.dart';

@Database(version: 1, entities: [CoinEntity])
abstract class FlutterDatabase extends FloorDatabase {
  CoinDao get coinDao;
}
