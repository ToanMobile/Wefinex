import 'package:floor/floor.dart';
import 'package:wefinex/repository/model/crypto.dart';

@dao
abstract class CoinDao {
  @Query('SELECT * FROM coinEntity WHERE name = :name')
  Future<CoinEntity?> findCoinByName(String name);

  @Query('SELECT * FROM coinEntity')
  Future<List<CoinEntity>> findAllFavouriteCoins();

  @Query('SELECT COUNT(*) FROM coinEntity WHERE name = :name)')
  Future<int?> hasCoin(String name);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCoin(CoinEntity coinEntity);

  @Query('DELETE FROM coinEntity WHERE name = :name')
  Future<void> deleteCoin(String name);
}
