// Eines de conversió des de / cap a la base de dades.
// createdAt: 24-08-07 dc. JIQ

import 'dart:convert';
import 'dart:typed_data';

import 'package:ld_learn/09_tools/index.dart';

DateTime? dTimeFromSql(int? pDTime) {
  return (isNull(pDTime)) ? null : DateTime.fromMillisecondsSinceEpoch(pDTime!);
}

int? dTimeToSql(DateTime? pDTime) {
  return (isNull(pDTime)) ? null : pDTime!.millisecondsSinceEpoch;
}

Uint8List? str64ToUList8(String? pStr64) => (isNotNull(pStr64)) ? base64Decode(pStr64!) : null;

String? str64FromUList8(Uint8List? pLst8) => (isNotNull(pLst8)) ? base64Encode(pLst8!) : null;
