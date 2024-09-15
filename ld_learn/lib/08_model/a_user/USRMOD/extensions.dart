// // ignore_for_file: implementation_imports

// import 'package:fixnum/src/int64.dart';
// import 'package:ui_repository/layers/03_storage/db/index.dart' as ents;
// import 'package:ui_repository/layers/04_synchronization/index.dart' as prts;
// import 'package:ui_repository/layers/06_cryptography/certificate_tools.dart';
// import 'package:ui_repository/tools/index.dart';

// extension ProtoUser on prts.UsrUser {
//   void fromModel(ents.UsrUser pModel) {
//     clear();
//     baseEntity = (pModel.toProto() as prts.UsrUser).baseEntity;

//     userType = prts.UsrUserType.valueOf(pModel.uType.index)!;
//     state = prts.UsrUserState.valueOf(pModel.state.index)!;
//     permissions = pModel.permissions as Int64;
//     if (isNotNull(pModel.alias)) alias = pModel.alias!;
//     if (isNotNull(pModel.certificate)) {
//       certificate = getListPEMFromCertificate(pModel.certificate!);
//     }
//     if (isNotNull(pModel.birthDate)) {
//       birthDate = dateTime2Timestamp(pModel.birthDate!)!;
//     }
//     if (isNotNull(pModel.firstConn)) {
//       firstConnAt = dateTime2Timestamp(pModel.firstConn!)!;
//     }
//     if (isNotNull(pModel.device)) {
//       device = pModel.device!.toProto() as prts.UsrDevice;
//     }
//     if (isNotNull(pModel.therapist)) {
//       therapistId = (pModel.therapist!.localKey ?? 0) as int;
//     }
//     if (isNotNull(pModel.locale)) {
//       locale = pModel.locale!.toProto() as prts.LocLocale;
//     }
//   }

//   ents.UsrUser toModel(IncrFuture? pToDo) {
//     return ents.UsrUser.byProto(this, pToDo);
//   }
// }

// extension ProtoDevice on prts.UsrDevice {
//   void fromModel(ents.UsrDevice pModel) {
//     clear();
//     baseEntity = (pModel.toProto() as prts.UsrDevice).baseEntity;

//     type = prts.UsrDeviceType.valueOf(pModel.dType.index)!;
//     state = prts.UsrDeviceState.valueOf(pModel.state.index)!;
//     if (pModel.fcmToken)) token = pModel.fcmToken!;
//     if (pModel.owner)) owner = (pModel.owner!.localKey ?? 0) as int;
//   }

//   ents.UsrDevice toModel(IncrFuture? pToDo) {
//     return ents.UsrDevice.byProto(this, pToDo);
//   }
// }

// extension ProtoFcmHistory on prts.UsrFcmHistory {
//   void fromModel(ents.UsrFcmHistory pModel) {
//     clear();
//     baseEntity = (pModel.toProto() as prts.UsrFcmHistory).baseEntity;

//     if (pModel.fcmToken)) token = pModel.fcmToken!;
//     if (pModel.device)) {
//       device = pModel.device!.toProto() as prts.UsrDevice;
//     }
//     if (pModel.owner)) {
//       owner = pModel.owner!.toProto() as prts.UsrUser;
//     }
//     if (pModel.since)) {
//       since = dateTime2Timestamp(pModel.since!)!;
//     }
//     isCurrent = pModel.isCurrent;
//   }

//   ents.UsrFcmHistory toModel(IncrFuture? pToDo) {
//     return ents.UsrFcmHistory.byProto(this, pToDo);
//   }
// }
