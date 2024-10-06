// Eines de conversió des de / cap a la base de dades.
// createdAt: 24-08-07 dc. JIQ

import 'package:fixnum/fixnum.dart';
import 'package:ld_learn/05_proto/gbl_timestamp.pb.dart';

DateTime? tStampToDTime(Timestamp? pTStamp) {
  if (pTStamp == null) { return null; }

  int micros = (pTStamp.seconds * 1000000 + pTStamp.nanos / 1000) as int;
  return DateTime.fromMicrosecondsSinceEpoch(micros, isUtc: true);
}

Timestamp? dTtimeToTStamp(DateTime? pDTime) {
  if (pDTime == null) { return null; }

  return Timestamp()
    ..seconds = (pDTime.millisecondsSinceEpoch / 1000) as Int64
    ..nanos = (pDTime.millisecondsSinceEpoch % 1000 * 1000000).round();
}
