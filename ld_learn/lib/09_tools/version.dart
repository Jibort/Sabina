// Representació d'un codi de versió format  [major.minor.bug].
// createdAt: 24/08/07 dc. JIQ

import 'package:ld_learn/09_tools/index.dart';

class Version {
  // Members --------------------------
  int _major = 0;
  int _minor = 0;
  int _bugs = 0;

  // Builders -------------------------
  Version({required int pMajor, required int pMinor, int pBugs = 0})
      : _major = pMajor,
        _minor = pMinor,
        _bugs = pBugs;

  Version.parse(String pVers) {
    List<String> parts = pVers.split("\\.");
    int len = parts.length;

    _major = len > 0 ? int.tryParse(parts[0]) ?? -1 : 0;
    _minor = len > 1 ? int.tryParse(parts[1]) ?? -1 : 0;
    _bugs = len > 2 ? int.tryParse(parts[2]) ?? -1 : 0;
  }

  // Getters --------------------------
  int get major => _major;
  int get minor => _minor;
  int get bugs => _bugs;

  // Striger --------------------------
  @override
  String toString() {
    var res = "$major.$minor";
    if (bugs != 0) {
      res += ".$bugs";
    }
    return res;
  }

  // Operators ------------------------
  @override
  int get hashCode => toString().hashCode;

  @override
  bool operator ==(covariant Version other) {
    if (identical(this, other)) return true;
    return major == other.major && minor == other.minor && bugs == other.bugs;
  }

  bool operator >(covariant Version? other) {
    return isNull(other) ||
        major > other!.major ||
        (major == other.major && minor > other.minor) ||
        (major == other.major && minor == other.minor && bugs > other.bugs);
  }

  bool operator >=(covariant Version? other) {
    return isNull(other) ||
        major >= other!.major ||
        (major == other.major && minor >= other.minor) ||
        (major == other.major && minor == other.minor && bugs >= other.bugs);
  }

  bool operator <(covariant Version? other) {
    if (isNull(other)) return false;
    return major < other!.major ||
        (major == other.major && minor < other.minor) ||
        (major == other.major && minor == other.minor && bugs < other.bugs);
  }

  bool operator <=(covariant Version? other) {
    if (isNull(other)) return false;
    return major <= other!.major ||
        (major == other.major && minor <= other.minor) ||
        (major == other.major && minor == other.minor && bugs <= other.bugs);
  }
}
