//
//  Generated code. Do not modify.
//  source: lstmod/lst_option_entry.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../model_entity.pb.dart' as $0;
import 'lst_option_list.pb.dart' as $1;

/// Definició dels elements de les llistes d'opcions.
class LstOptionEntry extends $pb.GeneratedMessage {
  factory LstOptionEntry({
    $0.ModelEntity? baseEntity,
    $1.LstOptionList? list,
    $core.int? index,
    $core.String? optionKey,
    $core.String? descKey,
  }) {
    final $result = create();
    if (baseEntity != null) {
      $result.baseEntity = baseEntity;
    }
    if (list != null) {
      $result.list = list;
    }
    if (index != null) {
      $result.index = index;
    }
    if (optionKey != null) {
      $result.optionKey = optionKey;
    }
    if (descKey != null) {
      $result.descKey = descKey;
    }
    return $result;
  }
  LstOptionEntry._() : super();
  factory LstOptionEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LstOptionEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LstOptionEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.ModelEntity>(1, _omitFieldNames ? '' : 'baseEntity', subBuilder: $0.ModelEntity.create)
    ..aOM<$1.LstOptionList>(2, _omitFieldNames ? '' : 'list', subBuilder: $1.LstOptionList.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'optionKey')
    ..aOS(5, _omitFieldNames ? '' : 'descKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LstOptionEntry clone() => LstOptionEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LstOptionEntry copyWith(void Function(LstOptionEntry) updates) => super.copyWith((message) => updates(message as LstOptionEntry)) as LstOptionEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LstOptionEntry create() => LstOptionEntry._();
  LstOptionEntry createEmptyInstance() => create();
  static $pb.PbList<LstOptionEntry> createRepeated() => $pb.PbList<LstOptionEntry>();
  @$core.pragma('dart2js:noInline')
  static LstOptionEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LstOptionEntry>(create);
  static LstOptionEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ModelEntity get baseEntity => $_getN(0);
  @$pb.TagNumber(1)
  set baseEntity($0.ModelEntity v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBaseEntity() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseEntity() => clearField(1);
  @$pb.TagNumber(1)
  $0.ModelEntity ensureBaseEntity() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.LstOptionList get list => $_getN(1);
  @$pb.TagNumber(2)
  set list($1.LstOptionList v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasList() => $_has(1);
  @$pb.TagNumber(2)
  void clearList() => clearField(2);
  @$pb.TagNumber(2)
  $1.LstOptionList ensureList() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(2);
  @$pb.TagNumber(3)
  set index($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get optionKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set optionKey($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOptionKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearOptionKey() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get descKey => $_getSZ(4);
  @$pb.TagNumber(5)
  set descKey($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescKey() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
