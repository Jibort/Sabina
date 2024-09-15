// Eines per a la gestió d'elements al·leatoris.
// createdAt: 24/07/25 dj. JIQ

// ignore_for_file: avoid_init_to_null

import 'dart:math';
import 'dart:typed_data';

import 'package:ld_learn/09_tools/index.dart';
import 'package:pointycastle/export.dart';

// Motor de generació de nombres aleatoris.
FortunaRandom? _random = null;
FortunaRandom get random {
  if (isNull(_random)) {
    _random = FortunaRandom();
    final seedSource = Random.secure();
    final seeds = <int>[];
    for (int i = 0; i < 32; i++) {
      seeds.add(seedSource.nextInt(255));
    }
    _random!.seed(KeyParameter(Uint8List.fromList(seeds)));
  }
  return _random!;
}

// Genera una llista de bytes amb una longitud específica.
Uint8List randomInt(int pLength) => random.nextBytes(pLength);

// Genera una llista de caràcters ASCII amb una longitud específica.
//              0         1         2         3         4         5         6         7         8         9       10       11       12       13       14       15       16       17       18       19       20       21       22       23       24       25       26       27       28       29       30       31
//              0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
const _chars =
    'ijkdefNOPQlmnopqrstuvwxyzABCDEFGÍïòÒóHIJKLMUVRSTghZ123456€&¬/(öÖùÙúWXYabcÚü)¿?¿¡!+-*<>{}[]àÀáÁäÄèÈéÉëËì7890@·#~%ÌíÓÜ'
    'tuvwST5678FGHIJKjklmLMabcdefghiUVWXYZíÍïòÒóNOìÌéÉënopqrsÓöÖùPQR90@·\\\$¬/()¿xyzABCDE?¿¡!+-*<>{}[]àÀáÁäÄèÈ1234ËÙúÚüÜ#~%€&'
    'wxyzABCÒóHIJKLMUVRS123456€&¬/(öÖùMabcdefghiUVW';
String randomString(int length) => String.fromCharCodes(
    Iterable.generate(length, (_) => _chars.codeUnitAt(randomBetween(0, _chars.length - 1))));

// String randomString(int pLength) {
//   var bytes = randomInt(pLength * 2);
//   return utf8.decode(bytes, allowMalformed: false).toString();
// }

String newPassword(String pBase, int pLength) {
  StringBuffer sb = StringBuffer();

  var last = pBase.length - 1;
  for (int idx = 0; idx < pLength; idx += 1) {
    var cid = randomBetween(0, last);
    sb.write(pBase[cid]);
  }

  return sb.toString();
}

// Genera un nombre aleatori entre dos valors.
int randomBetween(int pBottom, int pUp) {
  final range = pUp - pBottom + 1;
  final biRange = BigInt.from(range);
  final bytesNeeded = (32 ~/ 8) + ((range.bitLength + 7) ~/ 8);
  final maxRandomValue = BigInt.from(2).pow(bytesNeeded * 8);
  final maxAcceptableValue = (maxRandomValue ~/ biRange) * biRange;

  BigInt randomValue;
  do {
    randomValue = random.nextBigInteger(bytesNeeded * 8);
  } while (randomValue >= maxAcceptableValue);

  return pBottom + (randomValue % biRange).toInt();
}
