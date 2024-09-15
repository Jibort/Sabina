// Representació genèrica de la clau primària d'una entitat de dades.
// @createdAt: 2024-06-22 ds: JIQ

// Tipus de claus primària de l'aplicació.

import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/e_localization/LOCMOD/loc_translation.dart';
import 'package:ld_learn/09_tools/index.dart';

enum EntityKeyType {
  unknown,
  standard,
  stringA,
  stringAB,
}

extension MainTableFields on EntityKeyType {
  List<String> get mainFields {
    switch (this) {
      case EntityKeyType.standard:
        return <String>[
          fldIdLocal,
          fldId,
          fldCreatedBy,
          fldCreatedAt,
          fldUpdatedBy,
          fldUpdatedAt,
        ];
      case EntityKeyType.stringA:
        return <String>[
          fldIdLocal,
          fldId,
          fldCreatedBy,
          fldCreatedAt,
          fldUpdatedBy,
          fldUpdatedAt,
        ];
      case EntityKeyType.stringAB:
        return <String>[
          fldIdLocal,
          fldId,
          fldIdB,
          fldCreatedBy,
          fldCreatedAt,
          fldUpdatedBy,
          fldUpdatedAt,
        ];
      default:
        throw errorUnknownEntityKeyType("EntityKeyType.mainFields", this);
    }
  }
}

class EntityKey {
  // MEMBRES --------------------------
  late EntityKeyType _ekType;
  late dynamic _pkey;
  late dynamic _pkeyB;

  EntityKeyType _type({int? pInt, String? pStrA, String? pStrB}) {
    EntityKeyType ekt = EntityKeyType.unknown;

    if (isNotNull(pInt) && isNull(pStrA) && isNull(pStrB)) {
      ekt = EntityKeyType.standard;
    } else if (isNull(pInt) && isNotNull(pStrA) && isNull(pStrB)) {
      ekt = EntityKeyType.stringA;
    } else if (isNull(pInt) && isNotNull(pStrA) && isNotNull(pStrB)) {
      ekt = EntityKeyType.stringAB;
    } else {
      throw Exception(
          "EntityKey._type(): Tipus de clau desconegut! (pInt: '$pInt', pStrA: '$pStrA', pStrB: '$pStrB')!");
    }
    return ekt;
  }

  // CONSTRUCTORS ---------------------
  EntityKey({int? pInt, String? pStrA, String? pStrB}) {
    _ekType = _type(pInt: pInt, pStrA: pStrA, pStrB: pStrB);
    switch (_ekType) {
      case EntityKeyType.stringA:
        _pkey = pStrA;
        _pkeyB = null;

      case EntityKeyType.stringAB:
        _pkey = pStrA;
        _pkeyB = pStrB;

      default:
        _pkey = pInt;
        _pkeyB = null;
    }
  }

  EntityKey.empty(EntityKeyType pType) {
    _ekType = pType;
    _pkey = null;
    _pkeyB = null;
  }

  EntityKey.byType({required Type pType, required Map<String, dynamic> pMap}) {
    switch (pType) {
      // Entitats tipus 'standard'.
      case UsrUser _:
      case UsrDevice _:
      case UsrFcmHistory _:
      case EmoEmotion _:
        _ekType = EntityKeyType.standard;
        _pkey = pMap[fldId];
        _pkeyB = null;
        break;

      // Entitats tipus 'stringA'.

      // Entitats tipus 'stringAB'.
      case LocTranslation _:
        _ekType = EntityKeyType.standard;
        _pkey = pMap[fldTextKey];
        _pkeyB = pMap[fldLocaleCode];
        break;

      // Entitat desconeguda!.
      default:
        throw unkownEntity("EntityKey.byType", pType);
    }
  }

  // GETTERS i SETTERS ------------------
  EntityKeyType get keyType => _ekType;
  (int?, String?, String?) get getKey {
    switch (_ekType) {
      case EntityKeyType.standard:
        return (_pkey as int?, null, null);
      case EntityKeyType.stringA:
        return (null, _pkey as String?, _pkeyB as String?);
      case EntityKeyType.stringAB:
        return (_pkey as int?, null, null);
      default:
        throw Exception("EntityKey.keyType: Tipus incorrecte de clau ('$_ekType')!");
    }
  }

  EntityKey setKey({int? pInt, String? pStrA, String? pStrB}) {
    var ntype = _type(pInt: pInt, pStrA: pStrA, pStrB: pStrB);
    if (_ekType != ntype) {
      throw Exception(
          "EntityKey.set(): Els tipus de clau no coincideixen (${_ekType.name} => $ntype)!");
    }

    switch (_ekType) {
      case EntityKeyType.stringA:
        _pkey = pStrA;
        _pkeyB = null;

      case EntityKeyType.stringAB:
        _pkey = pStrA;
        _pkeyB = pStrB;

      default:
        _pkey = pInt;
        _pkeyB = null;
    }

    return this;
  }

  // CONVERSIONS ----------------------
  int? get asInt => (isNotNull(_pkey)) ? _pkey as int : null;

  static String asKey(Type pType, dynamic pKey, String? pKeyB) {
    String skey;

    switch (pType) {
      // a_user
      // ------
      // USRMOD...
      case UsrUser _:
      case UsrDevice _:
      case UsrFcmHistory _:
        skey = "${pType.toString()}:${pKey ?? "_"}";
        break;

      // b_definitions
      // -------------
      // EMOMOD...
      case EmoEmotion _:
        skey = "${pType.toString()}:${pKey ?? "_"}";
        break;

      // e_localization
      // --------------
      // LOCMOD...
      case LocTranslation _:
        skey = "${pType.toString()}:${pKey ?? "_"}|${pKeyB ?? "_"}";
      default:
        throw unkownEntity("st EntityKey.asKey()", pType);
    }

    return skey;
  }

  String? asStr() {
    String? skey;

    switch (_ekType) {
      case EntityKeyType.stringA:
        var strKey = _pkey as String?;
        skey = (isNotNull(strKey)) ? "($strKey)" : null;

      case EntityKeyType.stringAB:
        var strAKey = _pkey as String?;
        var strBKey = _pkeyB as String?;

        if (isNotNull(strAKey) && isNotNull(strBKey)) {
          skey = "~$strAKey|$strBKey~";
        } else if (isNotNull(strAKey) && isNull(strBKey)) {
          skey = "~$strAKey|_~";
        } else if (isNull(strAKey) && isNotNull(strBKey)) {
          skey = "~_|$strBKey~";
        } else {
          skey = null;
        }

      default:
        var intKey = _pkey as int?;
        skey = (isNotNull(intKey)) ? "$intKey" : null;
    }

    return skey;
  }

  // ESTÀTICS -------------------------
  // (TableName?, intKey?, StrKeyA?, StrKeyB?) parts.
  static (String?, int?, String?, String?) parts(String? pEntKey) {
    String? tableName;
    int? intKey;
    String part2;
    String? strKeyA, strKeyB;

    if (isNull(pEntKey)) return (null, null, null, null);

    // Extraiem les diferents parts de la clau.
    var parts = pEntKey!.split(':');
    var len = parts.length;
    if (len != 2) throw errorUnknownKey("EntityKey.parts()", pEntKey);
    tableName = parts[0];
    part2 = parts[1];
    if (part2.startsWith("~")) {
      intKey = null;
      part2 = part2.replaceAll('~', '');
      if (part2.contains("|")) {
        var parts2 = part2.split('|');
        len = parts2.length;
        if (len != 2) throw errorUnknownKey("EntityKey.parts()", pEntKey);
        strKeyA = parts2[0];
        strKeyB = parts2[1];
      } else {
        strKeyA = part2;
        strKeyB = null;
      }
    } else {
      intKey = int.tryParse(part2) ?? 0;
      strKeyA = null;
      strKeyB = null;
    }

    return (tableName, intKey, strKeyA, strKeyB);
  }
}
