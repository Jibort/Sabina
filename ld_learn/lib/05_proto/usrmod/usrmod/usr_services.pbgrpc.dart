//
//  Generated code. Do not modify.
//  source: usrmod/usr_services.proto
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

import '../gbl_global.pb.dart' as $2;
import 'usr_flows.pb.dart' as $0;
import 'usr_requests.pb.dart' as $3;
import 'usr_user.pb.dart' as $1;

export 'usr_services.pb.dart';

@$pb.GrpcServiceName('proto.UsrService')
class UsrServiceClient extends $grpc.Client {
  static final _$createNewUser = $grpc.ClientMethod<$0.UsrFlowCreateUser, $1.UsrUser>(
      '/proto.UsrService/CreateNewUser',
      ($0.UsrFlowCreateUser value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.UsrUser.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$0.UsrFlowUpdateUser, $1.UsrUser>(
      '/proto.UsrService/UpdateUser',
      ($0.UsrFlowUpdateUser value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.UsrUser.fromBuffer(value));
  static final _$findUserById = $grpc.ClientMethod<$2.GbReqtInstanceById, $1.UsrUser>(
      '/proto.UsrService/FindUserById',
      ($2.GbReqtInstanceById value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.UsrUser.fromBuffer(value));
  static final _$userAction = $grpc.ClientMethod<$3.UsrReqtUserAction, $3.UsrRespUserAction>(
      '/proto.UsrService/UserAction',
      ($3.UsrReqtUserAction value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.UsrRespUserAction.fromBuffer(value));

  UsrServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.UsrUser> createNewUser($0.UsrFlowCreateUser request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createNewUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.UsrUser> updateUser($0.UsrFlowUpdateUser request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.UsrUser> findUserById($2.GbReqtInstanceById request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findUserById, request, options: options);
  }

  $grpc.ResponseFuture<$3.UsrRespUserAction> userAction($3.UsrReqtUserAction request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userAction, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.UsrService')
abstract class UsrServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.UsrService';

  UsrServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UsrFlowCreateUser, $1.UsrUser>(
        'CreateNewUser',
        createNewUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UsrFlowCreateUser.fromBuffer(value),
        ($1.UsrUser value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UsrFlowUpdateUser, $1.UsrUser>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UsrFlowUpdateUser.fromBuffer(value),
        ($1.UsrUser value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GbReqtInstanceById, $1.UsrUser>(
        'FindUserById',
        findUserById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GbReqtInstanceById.fromBuffer(value),
        ($1.UsrUser value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UsrReqtUserAction, $3.UsrRespUserAction>(
        'UserAction',
        userAction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UsrReqtUserAction.fromBuffer(value),
        ($3.UsrRespUserAction value) => value.writeToBuffer()));
  }

  $async.Future<$1.UsrUser> createNewUser_Pre($grpc.ServiceCall call, $async.Future<$0.UsrFlowCreateUser> request) async {
    return createNewUser(call, await request);
  }

  $async.Future<$1.UsrUser> updateUser_Pre($grpc.ServiceCall call, $async.Future<$0.UsrFlowUpdateUser> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$1.UsrUser> findUserById_Pre($grpc.ServiceCall call, $async.Future<$2.GbReqtInstanceById> request) async {
    return findUserById(call, await request);
  }

  $async.Future<$3.UsrRespUserAction> userAction_Pre($grpc.ServiceCall call, $async.Future<$3.UsrReqtUserAction> request) async {
    return userAction(call, await request);
  }

  $async.Future<$1.UsrUser> createNewUser($grpc.ServiceCall call, $0.UsrFlowCreateUser request);
  $async.Future<$1.UsrUser> updateUser($grpc.ServiceCall call, $0.UsrFlowUpdateUser request);
  $async.Future<$1.UsrUser> findUserById($grpc.ServiceCall call, $2.GbReqtInstanceById request);
  $async.Future<$3.UsrRespUserAction> userAction($grpc.ServiceCall call, $3.UsrReqtUserAction request);
}
