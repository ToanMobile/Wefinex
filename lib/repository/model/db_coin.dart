import 'package:hive/hive.dart';

part 'db_coin.g.dart';

@HiveType(typeId: 0)
class DbCoin extends HiveObject {
  DbCoin({required this.name});

  @HiveField(0)
  String name;

  @override
  String toString() {
    return '$name';
  }
}
