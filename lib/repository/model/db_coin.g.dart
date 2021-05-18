// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_coin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DbCoinAdapter extends TypeAdapter<DbCoin> {
  @override
  final int typeId = 0;

  @override
  DbCoin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DbCoin(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DbCoin obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbCoinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
