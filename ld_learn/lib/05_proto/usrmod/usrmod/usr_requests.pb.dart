//
//  Generated code. Do not modify.
//  source: usrmod/usr_requests.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../gbl_enumerations.pbenum.dart' as $2;
import '../gbl_global.pb.dart' as $1;
import 'usr_user.pb.dart' as $0;

/// Petició per a la creació/modificació/eliminació d'un usuari.
class UsrReqtUserAction extends $pb.GeneratedMessage {
  factory UsrReqtUserAction({
    $2.GbEntityAction? action,
    $0.UsrUser? user,
  }) {
    final $result = create();
    if (action != null) {
      $result.action = action;
    }
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  UsrReqtUserAction._() : super();
  factory UsrReqtUserAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrReqtUserAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrReqtUserAction', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..e<$2.GbEntityAction>(1, _omitFieldNames ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: $2.GbEntityAction.GB_ENTITY_ACTION_UNSPECIFIED, valueOf: $2.GbEntityAction.valueOf, enumValues: $2.GbEntityAction.values)
    ..aOM<$0.UsrUser>(2, _omitFieldNames ? '' : 'user', subBuilder: $0.UsrUser.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrReqtUserAction clone() => UsrReqtUserAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrReqtUserAction copyWith(void Function(UsrReqtUserAction) updates) => super.copyWith((message) => updates(message as UsrReqtUserAction)) as UsrReqtUserAction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrReqtUserAction create() => UsrReqtUserAction._();
  UsrReqtUserAction createEmptyInstance() => create();
  static $pb.PbList<UsrReqtUserAction> createRepeated() => $pb.PbList<UsrReqtUserAction>();
  @$core.pragma('dart2js:noInline')
  static UsrReqtUserAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrReqtUserAction>(create);
  static UsrReqtUserAction? _defaultInstance;

  @$pb.TagNumber(1)
  $2.GbEntityAction get action => $_getN(0);
  @$pb.TagNumber(1)
  set action($2.GbEntityAction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  @$pb.TagNumber(2)
  $0.UsrUser get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($0.UsrUser v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  $0.UsrUser ensureUser() => $_ensure(1);
}

/// Resposta a la creació/modificació/eliminació d'un usuari.
class UsrRespUserAction extends $pb.GeneratedMessage {
  factory UsrRespUserAction({
    $0.UsrUser? user,
    $1.GbError? error,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  UsrRespUserAction._() : super();
  factory UsrRespUserAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrRespUserAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrRespUserAction', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.UsrUser>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.UsrUser.create)
    ..aOM<$1.GbError>(2, _omitFieldNames ? '' : 'error', subBuilder: $1.GbError.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrRespUserAction clone() => UsrRespUserAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrRespUserAction copyWith(void Function(UsrRespUserAction) updates) => super.copyWith((message) => updates(message as UsrRespUserAction)) as UsrRespUserAction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrRespUserAction create() => UsrRespUserAction._();
  UsrRespUserAction createEmptyInstance() => create();
  static $pb.PbList<UsrRespUserAction> createRepeated() => $pb.PbList<UsrRespUserAction>();
  @$core.pragma('dart2js:noInline')
  static UsrRespUserAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrRespUserAction>(create);
  static UsrRespUserAction? _defaultInstance;

  @$pb.TagNumber(1)
  $0.UsrUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.UsrUser v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $0.UsrUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.GbError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($1.GbError v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
  @$pb.TagNumber(2)
  $1.GbError ensureError() => $_ensure(1);
}

/// Petició de sincronització de les dades d'un usuari.
class UsrReqtSyncUser extends $pb.GeneratedMessage {
  factory UsrReqtSyncUser({
    $0.UsrUser? user,
    $2.GbSyncAction? sync,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    if (sync != null) {
      $result.sync = sync;
    }
    return $result;
  }
  UsrReqtSyncUser._() : super();
  factory UsrReqtSyncUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrReqtSyncUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrReqtSyncUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.UsrUser>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.UsrUser.create)
    ..e<$2.GbSyncAction>(2, _omitFieldNames ? '' : 'sync', $pb.PbFieldType.OE, defaultOrMaker: $2.GbSyncAction.GB_SYNC_ACTION_SYNC_UNSPECIFIED, valueOf: $2.GbSyncAction.valueOf, enumValues: $2.GbSyncAction.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrReqtSyncUser clone() => UsrReqtSyncUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrReqtSyncUser copyWith(void Function(UsrReqtSyncUser) updates) => super.copyWith((message) => updates(message as UsrReqtSyncUser)) as UsrReqtSyncUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrReqtSyncUser create() => UsrReqtSyncUser._();
  UsrReqtSyncUser createEmptyInstance() => create();
  static $pb.PbList<UsrReqtSyncUser> createRepeated() => $pb.PbList<UsrReqtSyncUser>();
  @$core.pragma('dart2js:noInline')
  static UsrReqtSyncUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrReqtSyncUser>(create);
  static UsrReqtSyncUser? _defaultInstance;

  @$pb.TagNumber(1)
  $0.UsrUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.UsrUser v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $0.UsrUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.GbSyncAction get sync => $_getN(1);
  @$pb.TagNumber(2)
  set sync($2.GbSyncAction v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSync() => $_has(1);
  @$pb.TagNumber(2)
  void clearSync() => clearField(2);
}

/// Resposta a la petició de sincronització de les dades d'un usuari.
class UsrRespSyncUser extends $pb.GeneratedMessage {
  factory UsrRespSyncUser({
    $0.UsrUser? user,
    $1.GbError? error,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  UsrRespSyncUser._() : super();
  factory UsrRespSyncUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UsrRespSyncUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UsrRespSyncUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$0.UsrUser>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.UsrUser.create)
    ..aOM<$1.GbError>(2, _omitFieldNames ? '' : 'error', subBuilder: $1.GbError.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UsrRespSyncUser clone() => UsrRespSyncUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UsrRespSyncUser copyWith(void Function(UsrRespSyncUser) updates) => super.copyWith((message) => updates(message as UsrRespSyncUser)) as UsrRespSyncUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsrRespSyncUser create() => UsrRespSyncUser._();
  UsrRespSyncUser createEmptyInstance() => create();
  static $pb.PbList<UsrRespSyncUser> createRepeated() => $pb.PbList<UsrRespSyncUser>();
  @$core.pragma('dart2js:noInline')
  static UsrRespSyncUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsrRespSyncUser>(create);
  static UsrRespSyncUser? _defaultInstance;

  @$pb.TagNumber(1)
  $0.UsrUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.UsrUser v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $0.UsrUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.GbError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($1.GbError v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
  @$pb.TagNumber(2)
  $1.GbError ensureError() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
