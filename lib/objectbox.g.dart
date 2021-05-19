// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'repository/model/crypto.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 4604518750926524758),
      name: 'CoinEntity',
      lastPropertyId: const IdUid(10, 4983799782174350807),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5347128561310709075),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3582025043361087105),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7624935226829100435),
            name: 'marketCapRank',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2515759174341585827),
            name: 'diminutive',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1108753912648057479),
            name: 'price',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8951471773983559319),
            name: 'change',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4535254924590055020),
            name: 'changeValue',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 3320461284015607141),
            name: 'logoUrl',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 8632655845346635766),
            name: 'marketCap',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 4983799782174350807),
            name: 'totalVolume',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 4604518750926524758),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    CoinEntity: EntityDefinition<CoinEntity>(
        model: _entities[0],
        toOneRelations: (CoinEntity object) => [],
        toManyRelations: (CoinEntity object) => {},
        getId: (CoinEntity object) => object.id,
        setId: (CoinEntity object, int id) {
          object.id = id;
        },
        objectToFB: (CoinEntity object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final marketCapRankOffset = object.marketCapRank == null
              ? null
              : fbb.writeString(object.marketCapRank!);
          final diminutiveOffset = object.diminutive == null
              ? null
              : fbb.writeString(object.diminutive!);
          final priceOffset =
              object.price == null ? null : fbb.writeString(object.price!);
          final changeOffset =
              object.change == null ? null : fbb.writeString(object.change!);
          final changeValueOffset = object.changeValue == null
              ? null
              : fbb.writeString(object.changeValue!);
          final logoUrlOffset =
              object.logoUrl == null ? null : fbb.writeString(object.logoUrl!);
          final marketCapOffset = object.marketCap == null
              ? null
              : fbb.writeString(object.marketCap!);
          final totalVolumeOffset = object.totalVolume == null
              ? null
              : fbb.writeString(object.totalVolume!);
          fbb.startTable(11);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, marketCapRankOffset);
          fbb.addOffset(3, diminutiveOffset);
          fbb.addOffset(4, priceOffset);
          fbb.addOffset(5, changeOffset);
          fbb.addOffset(6, changeValueOffset);
          fbb.addOffset(7, logoUrlOffset);
          fbb.addOffset(8, marketCapOffset);
          fbb.addOffset(9, totalVolumeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = CoinEntity(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              marketCapRank: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              name: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              diminutive: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              price: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 12),
              change: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 14),
              changeValue: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 16),
              logoUrl: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 18),
              marketCap: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 20),
              totalVolume: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 22));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [CoinEntity] entity fields to define ObjectBox queries.
class CoinEntity_ {
  /// see [CoinEntity.id]
  static final id =
      QueryIntegerProperty<CoinEntity>(_entities[0].properties[0]);

  /// see [CoinEntity.name]
  static final name =
      QueryStringProperty<CoinEntity>(_entities[0].properties[1]);

  /// see [CoinEntity.marketCapRank]
  static final marketCapRank =
      QueryStringProperty<CoinEntity>(_entities[0].properties[2]);

  /// see [CoinEntity.diminutive]
  static final diminutive =
      QueryStringProperty<CoinEntity>(_entities[0].properties[3]);

  /// see [CoinEntity.price]
  static final price =
      QueryStringProperty<CoinEntity>(_entities[0].properties[4]);

  /// see [CoinEntity.change]
  static final change =
      QueryStringProperty<CoinEntity>(_entities[0].properties[5]);

  /// see [CoinEntity.changeValue]
  static final changeValue =
      QueryStringProperty<CoinEntity>(_entities[0].properties[6]);

  /// see [CoinEntity.logoUrl]
  static final logoUrl =
      QueryStringProperty<CoinEntity>(_entities[0].properties[7]);

  /// see [CoinEntity.marketCap]
  static final marketCap =
      QueryStringProperty<CoinEntity>(_entities[0].properties[8]);

  /// see [CoinEntity.totalVolume]
  static final totalVolume =
      QueryStringProperty<CoinEntity>(_entities[0].properties[9]);
}
