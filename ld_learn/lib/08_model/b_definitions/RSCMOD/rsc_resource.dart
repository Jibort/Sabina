// Representació d'un recurs.
// createdAt: 24/08/20 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'dart:ui';

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/09_tools/index.dart';
import 'package:ld_learn/consts.dart';

// Enumeració dels tipus de recurs.
enum ResourceType {
  unspecified,
  plainText,
  richText,
  image,
  audio,
  video,
}

// Representació d'un recurs.
class RscResource extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  String? _nameKey;
  String? _name;
  String? _descKey;
  String? _desc;
  int _vers = 0;
  RscResource? _root;
  Locale _locale = localeES;
  ResourceType _type = ResourceType.unspecified;
  String? _inlineText;
  String? _link;

  // CONSTRUCTORS ---------------------
  RscResource(
      {required super.pCore,
      String? pNameKey,
      String? pName,
      String? pDescKey,
      String? pDesc,
      int pVersion = 0,
      RscResource? pRoot,
      Locale? pLocale,
      ResourceType? pType,
      String? pInlineText,
      String? pLink}) {
    _nameKey = pNameKey;
    _name = pName;
    _descKey = pDescKey;
    _desc = pDesc;
    _vers = pVersion;
    _root = pRoot;
    _locale = pLocale ?? localeES;
    _type = pType ?? ResourceType.unspecified;
    _inlineText = pInlineText;
    _link = pLink;
  }

  RscResource.empty()
      : this(
            pCore: CoreEntity.empty(),
            pNameKey: null,
            pName: null,
            pDescKey: null,
            pDesc: null,
            pVersion: 0,
            pRoot: null,
            pLocale: localeES,
            pType: ResourceType.unspecified,
            pInlineText: null,
            pLink: null);

  RscResource.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _nameKey = pMap[fldNameKey];
    _name = pMap[fldName];
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _vers = pMap[fldVersion] ?? 0;
    _root = pMap[fldRoot];
    _locale = pMap[fldLocaleCode] ?? localeES;
    _type = pMap[fldResourceType] ?? ResourceType.unspecified;
    _inlineText = pMap[fldInlineText];
    _link = pMap[fldLink];
  }

  RscResource.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(RscResource, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _nameKey = pMap[fldNameKey];
    _descKey = pMap[fldDescKey];
    _vers = pMap[fldVersion];
    _locale = Locale(pMap[fldLocaleCode] ?? esCode);
    _type = resourceTypeById(pMap[fldResourceType]);
    _inlineText = pMap[fldInlineText];
    _link = pMap[fldLink];

    // Traduïm el name key.
    Future<Exception?> stName(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _name = await dbs.trans(pCtrl, pTKey: pArgs.first);

        // Traduïm el desc key.
        Future<Exception?> stDesc(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _desc = await dbs.trans(pCtrl, pTKey: pArgs.first);

            // Obtenim el recurs arrel.
            Future<Exception?> stRoot(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _root = await dbs.byKey(pCtrl, RscResource, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.core.completeStandard(pCtrl, pMap);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stRoot, pArgs: [pMap[fldRoot]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stDesc, pArgs: [_descKey]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stName, pArgs: [_nameKey]);
  }

  // GETTERS i SETTERS ----------------
  String? get nameKey => _nameKey;
  String? get name => _name;
  void setName(String? pKey, String? pName) {
    if (isNull(pKey) || isNull(pName)) {
      throw errorFieldNotNullable("$enRscResource.set", fldName);
    }
    var oldKey = _nameKey;
    _nameKey = pKey;
    _name = pName;
    core.isUpdated = (!core.isNew) && (oldKey != _nameKey);
  }

  String? get descKey => _descKey;
  String? get desc => _desc;
  void setDesc(String? pKey, String? pDesc) {
    var oldKey = _descKey;
    _descKey = pKey;
    _desc = pDesc;
    core.isUpdated = (!core.isNew) && (oldKey != _descKey);
  }

  int get vers => _vers;
  void setVers(int pVers) {
    var oldVers = _vers;
    _vers = pVers;
    core.isUpdated = (!core.isNew) && (oldVers != _vers);
  }

  RscResource? get root => _root;
  void setRoot(RscResource? pRoot) {
    if (isNull(pRoot)) {
      throw errorFieldNotNullable("$enRscResource.set", fldRoot);
    }
    var oldDisease = _root;
    _root = pRoot;
    core.isUpdated = (!core.isNew) && (oldDisease != _root);
  }

  Locale get locale => _locale;
  void setLocale(Locale pLocale) {
    if (isNull(pLocale)) {
      throw errorFieldNotNullable("$enRscResource.set", fldLocale);
    }
    var oldLocale = _locale;
    _locale = pLocale;
    core.isUpdated = (!core.isNew) && (oldLocale != _locale);
  }

  ResourceType get type => _type;
  void setType(dynamic pType) {
    if (isNull(pType)) {
      throw errorFieldNotNullable("$enRscResource.set", fldResourceType);
    }
    var oldType = _type;
    switch (pType) {
      case ResourceType type:
        _type = type;
        break;
      case int value:
        _type = resourceTypeById(value);
        break;
      default:
        throw errorUnknownType("$enRscResource.set", fldResourceType, pType.runtimeType);
    }
    core.isUpdated = (!core.isNew) && (oldType != _type);
  }

  String? get inlineText => _inlineText;
  void setInlineText(String? pText) {
    var oldText = _inlineText;
    _inlineText = pText;
    core.isUpdated = (!core.isNew) && (oldText != _inlineText);
  }

  String? get link => _link;
  void setLink(String? pLink) {
    var oldLink = _link;
    _link = pLink;
    core.isUpdated = (!core.isNew) && (oldLink != _link);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldName: _name,
      fldDescKey: _descKey,
      fldDesc: _desc,
      fldVersion: _vers,
      fldRoot: _root,
      fldLocaleCode: _locale,
      fldResourceType: _type,
      fldInlineText: _inlineText,
      fldLink: _link,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldDescKey: _descKey,
      fldVersion: _vers,
      fldRoot: _root?.serverId,
      fldLocaleCode: _locale.languageCode,
      fldResourceType: _type.id,
      fldInlineText: _inlineText,
      fldLink: _link,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldNameKey,
        fldDescKey,
        fldVersion,
        fldRoot,
        fldLocaleCode,
        fldResourceType,
        fldInlineText,
        fldLink,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnRscResource (
      $standardHeader,
      
      $fldNameKey      $dbtTextNotNull,
      $fldDescKey      $dbtTextNotNull,
      $fldVersion      $dbtIntNotNull,
      $fldRoot         $dbtInt REFERENCES $tnRscResource($fldId),
      $fldLocaleCode   $dbtTextNotNull,
      $fldResourceType $dbtIntNotNull,
      $fldInlineText   $dbtText,
      $fldLink         $dbtText
    );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldNameKey, $fldDescKey, $fldVersion, $fldRoot, 
           $fldLocaleCode, $fldResourceType, $fldInlineText, $fldLink
    FROM   $tnRscResource
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnRscResource
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnRscResource (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldNameKey, $fldDescKey, $fldVersion, $fldRoot, 
      $fldLocaleCode, $fldResourceType, $fldInlineText, $fldLink)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?,   ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnRscResource
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldNameKey = ?,
        $fldDescKey = ?,
        $fldVersion = ?,
        $fldRoot = ?, 
        $fldLocaleCode = ?,
        $fldResourceType = ?,
        $fldInlineText = ?,
        $fldLink = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_nameKey) &&
        isNotNull(_type));
  }
}

extension ResourceTypeIdx on ResourceType {
  // Retorna l'Id del tipus de dispositiu d'un usuari.
  int get id {
    switch (this) {
      case ResourceType.unspecified:
        return 0;
      case ResourceType.plainText:
        return 1;
      case ResourceType.richText:
        return 2;
      case ResourceType.image:
        return 3;
      case ResourceType.audio:
        return 4;
      case ResourceType.video:
        return 5;
    }
  }
}

// Retorna el tipus de recurs a partir del seu Id.
ResourceType resourceTypeById(int pId) {
  switch (pId) {
    case 0:
      return ResourceType.unspecified;
    case 1:
      return ResourceType.plainText;
    case 2:
      return ResourceType.richText;
    case 3:
      return ResourceType.image;
    case 4:
      return ResourceType.audio;
    case 5:
      return ResourceType.video;
    default:
      throw 'Invalid ResourceType.id: $pId';
  }
}

// Retorna el tipus de recurs a partir d'un dynamic.
ResourceType dyn2ResourceType(dynamic pType) {
  switch (pType) {
    case ResourceType type:
      return type;
    case int value:
      return resourceTypeById(value);
    default:
      throw errorUnknownType("$enRscResource.set", fldResourceType, pType.runtimeType);
  }
}
