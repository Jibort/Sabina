//
//  Generated code. Do not modify.
//  source: emomod/emo_services.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../locmod/loc_services.pb.dart' as $3;
import 'emo_entities.pb.dart' as $2;
import 'emo_services.pb.dart' as $1;

export 'emo_services.pb.dart';

@$pb.GrpcServiceName('proto.EmoSyncService')
class EmoSyncServiceClient extends $grpc.Client {
  static final _$checkEmoMod = $grpc.ClientMethod<$1.GbSyncEmoMod, $2.EmoModuleLists>(
      '/proto.EmoSyncService/CheckEmoMod',
      ($1.GbSyncEmoMod value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.EmoModuleLists.fromBuffer(value));
  static final _$translateIt = $grpc.ClientMethod<$3.PrtDownloadTranslation, $3.PrtTranslation>(
      '/proto.EmoSyncService/TranslateIt',
      ($3.PrtDownloadTranslation value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.PrtTranslation.fromBuffer(value));

  EmoSyncServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.EmoModuleLists> checkEmoMod($1.GbSyncEmoMod request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkEmoMod, request, options: options);
  }

  $grpc.ResponseFuture<$3.PrtTranslation> translateIt($3.PrtDownloadTranslation request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$translateIt, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.EmoSyncService')
abstract class EmoSyncServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.EmoSyncService';

  EmoSyncServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.GbSyncEmoMod, $2.EmoModuleLists>(
        'CheckEmoMod',
        checkEmoMod_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GbSyncEmoMod.fromBuffer(value),
        ($2.EmoModuleLists value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.PrtDownloadTranslation, $3.PrtTranslation>(
        'TranslateIt',
        translateIt_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.PrtDownloadTranslation.fromBuffer(value),
        ($3.PrtTranslation value) => value.writeToBuffer()));
  }

  $async.Future<$2.EmoModuleLists> checkEmoMod_Pre($grpc.ServiceCall call, $async.Future<$1.GbSyncEmoMod> request) async {
    return checkEmoMod(call, await request);
  }

  $async.Future<$3.PrtTranslation> translateIt_Pre($grpc.ServiceCall call, $async.Future<$3.PrtDownloadTranslation> request) async {
    return translateIt(call, await request);
  }

  $async.Future<$2.EmoModuleLists> checkEmoMod($grpc.ServiceCall call, $1.GbSyncEmoMod request);
  $async.Future<$3.PrtTranslation> translateIt($grpc.ServiceCall call, $3.PrtDownloadTranslation request);
}
