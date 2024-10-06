//
//  Generated code. Do not modify.
//  source: locmod/loc_services.proto
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

import 'loc_requests.pb.dart' as $0;

export 'loc_services.pb.dart';

@$pb.GrpcServiceName('proto.LanguageService')
class LanguageServiceClient extends $grpc.Client {
  static final _$translate = $grpc.ClientMethod<$0.LocReqtTranslate, $0.LocRespTranslate>(
      '/proto.LanguageService/Translate',
      ($0.LocReqtTranslate value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LocRespTranslate.fromBuffer(value));

  LanguageServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.LocRespTranslate> translate($0.LocReqtTranslate request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$translate, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.LanguageService')
abstract class LanguageServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.LanguageService';

  LanguageServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LocReqtTranslate, $0.LocRespTranslate>(
        'Translate',
        translate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LocReqtTranslate.fromBuffer(value),
        ($0.LocRespTranslate value) => value.writeToBuffer()));
  }

  $async.Future<$0.LocRespTranslate> translate_Pre($grpc.ServiceCall call, $async.Future<$0.LocReqtTranslate> request) async {
    return translate(call, await request);
  }

  $async.Future<$0.LocRespTranslate> translate($grpc.ServiceCall call, $0.LocReqtTranslate request);
}
