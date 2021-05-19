// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFlutterDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder databaseBuilder(String name) =>
      _$FlutterDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FlutterDatabaseBuilder(null);
}

class _$FlutterDatabaseBuilder {
  _$FlutterDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FlutterDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FlutterDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FlutterDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FlutterDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FlutterDatabase extends FlutterDatabase {
  _$FlutterDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CoinDao? _coinDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `coinEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `marketCapRank` TEXT, `diminutive` TEXT, `price` TEXT, `change` TEXT, `changeValue` TEXT, `logoUrl` TEXT, `marketCap` TEXT, `totalVolume` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CoinDao get coinDao {
    return _coinDaoInstance ??= _$CoinDao(database, changeListener);
  }
}

class _$CoinDao extends CoinDao {
  _$CoinDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _coinEntityInsertionAdapter = InsertionAdapter(
            database,
            'coinEntity',
            (CoinEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'marketCapRank': item.marketCapRank,
                  'diminutive': item.diminutive,
                  'price': item.price,
                  'change': item.change,
                  'changeValue': item.changeValue,
                  'logoUrl': item.logoUrl,
                  'marketCap': item.marketCap,
                  'totalVolume': item.totalVolume
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CoinEntity> _coinEntityInsertionAdapter;

  @override
  Future<CoinEntity?> findCoinByName(String name) async {
    return _queryAdapter.query('SELECT * FROM coinEntity WHERE name = ?1',
        mapper: (Map<String, Object?> row) => CoinEntity(
            id: row['id'] as int?,
            marketCapRank: row['marketCapRank'] as String?,
            name: row['name'] as String?,
            diminutive: row['diminutive'] as String?,
            price: row['price'] as String?,
            change: row['change'] as String?,
            changeValue: row['changeValue'] as String?,
            logoUrl: row['logoUrl'] as String?,
            marketCap: row['marketCap'] as String?,
            totalVolume: row['totalVolume'] as String?),
        arguments: [name]);
  }

  @override
  Future<List<CoinEntity>> findAllFavouriteCoins() async {
    return _queryAdapter.queryList('SELECT * FROM coinEntity',
        mapper: (Map<String, Object?> row) => CoinEntity(
            id: row['id'] as int?,
            marketCapRank: row['marketCapRank'] as String?,
            name: row['name'] as String?,
            diminutive: row['diminutive'] as String?,
            price: row['price'] as String?,
            change: row['change'] as String?,
            changeValue: row['changeValue'] as String?,
            logoUrl: row['logoUrl'] as String?,
            marketCap: row['marketCap'] as String?,
            totalVolume: row['totalVolume'] as String?));
  }

  @override
  Future<int?> hasCoin(String name) async {
    await _queryAdapter.queryNoReturn(
        'SELECT COUNT(*) FROM coinEntity WHERE name = ?1)',
        arguments: [name]);
  }

  @override
  Future<void> deleteCoin(String name) async {
    await _queryAdapter.queryNoReturn('DELETE FROM coinEntity WHERE name = ?1',
        arguments: [name]);
  }

  @override
  Future<void> insertCoin(CoinEntity coinEntity) async {
    await _coinEntityInsertionAdapter.insert(
        coinEntity, OnConflictStrategy.replace);
  }
}
