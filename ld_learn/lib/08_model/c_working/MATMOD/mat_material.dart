// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters, prefer_final_fields

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class MatMaterial extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  String? _nameKey;
  String? _name;
  String? _descKey;
  String? _desc;
  RscResource? _resource;
  ResourceType _type = ResourceType.unspecified;
  String? _plainKey;
  String? _plain;
  String? _link;

  // CONSTRUCTORS ---------------------
  MatMaterial(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      String? pNameKey,
      String? pName,
      String? pDescKey,
      String? pDesc,
      RscResource? pResource,
      ResourceType pType = ResourceType.unspecified,
      String? pPlainKey,
      String? pPlain,
      String? pLink}) {
    _nameKey = pNameKey;
    _name = pName;
    _descKey = pDescKey;
    _desc = pDesc;
    _resource = pResource;
    _type = pType;
    _plainKey = pPlainKey;
    _plain = pPlain;
    _link = pLink;
  }

  MatMaterial.empty()
      : this(
            pLocalId: null,
            pId: null,
            pCreatedBy: null,
            pCreatedAt: null,
            pUpdatedBy: null,
            pUpdatedAt: null,
            pIsNew: true,
            pIsUpdated: false,
            pIsDeleted: false,
            pNameKey: null,
            pName: null,
            pDescKey: null,
            pDesc: null,
            pResource: null,
            pType: ResourceType.unspecified,
            pPlainKey: null,
            pPlain: null,
            pLink: null);

  MatMaterial.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _nameKey = pMap[fldNameKey];
    _name = pMap[fldName];
    _descKey = pMap[fldDescKey];
    _desc = pMap[fldDesc];
    _resource = pMap[fldResource];
    _type = pMap[fldResourceType];
    _plainKey = pMap[fldPlainKey];
    _plain = pMap[fldPlain];
    _link = pMap[fldLink];
  }

  MatMaterial.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(MatMaterial, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _type = dyn2ResourceType(pMap[fldResourceType]);
    _link = pMap[fldLink];

    // Tradueix el name key.
    Future<Exception?> stName(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _nameKey = pArgs.first;
        _name = await dbs.trans(pCtrl, pTKey: _nameKey);

        // Tradueix el desc key.
        Future<Exception?> stDesc(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _descKey = pArgs.first;
            _desc = await dbs.trans(pCtrl, pTKey: _descKey);

            // Tradueix el plain key.
            Future<Exception?> stPlain(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _plainKey = pArgs.first;
                _plain = await dbs.trans(pCtrl, pTKey: _plainKey);

                // Carrega el resource.
                Future<Exception?> stResource(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                  try {
                    _resource = await dbs.byKey(pCtrl, RscResource, pKey: pArgs.first);

                    // Carrega createdBy i updatedBy.
                    super.completeStandard(pCtrl, pMap);
                  } on Exception catch (pExc) {
                    exc = pExc;
                  }
                  return exc;
                }

                pCtrl.state.sneakFn(stResource, pArgs: [pMap[fldResource]]);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stPlain, pArgs: [pMap[fldPlainKey]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stDesc, pArgs: [pMap[fldDescKey]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stName, pArgs: [pMap[fldNameKey]]);
  }

  // GETTERS i SETTERS ----------------
  String? get nameKey => _nameKey;
  String? get name => _name;
  void setName(String? pNameKey, String? pName) {
    if (isNull(pNameKey) || isNull(pName)) {
      throw errorFieldNotNullable(enMatMaterial, fldName);
    }
    var old = _nameKey;
    _nameKey = pNameKey;
    _name = pName;
    super.isUpdated = (!super.isNew) && (old != _nameKey);
  }

  String? get descKey => _descKey;
  String? get desc => _desc;
  void setDesc(String? pDescKey, String? pDesc) {
    if (isNull(pDescKey) || isNull(pDesc)) {
      throw errorFieldNotNullable(enMatMaterial, fldDesc);
    }
    var old = _descKey;
    _descKey = pDescKey;
    _desc = pDesc;
    super.isUpdated = (!super.isNew) && (old != _descKey);
  }

  RscResource? get rscResource => _resource;
  void setRscResource(RscResource? pResource) {
    if (isNull(pResource)) {
      throw errorFieldNotNullable(enMatMaterial, fldResource);
    }
    var old = _resource;
    _resource = pResource;
    super.isUpdated = (!super.isNew) && (old != _resource);
  }

  ResourceType? get rscType => _type;
  void setRscType(ResourceType? pType) {
    if (isNull(pType)) {
      throw errorFieldNotNullable(enMatMaterial, fldResourceType);
    }
    var old = _type;
    _type = pType!;
    super.isUpdated = (!super.isNew) && (old != _type);
  }

  String? get plainKey => _plainKey;
  String? get plain => _plain;
  void setPlain(String? pPlainKey, String? pPlain) {
    if (isNull(pPlainKey) || isNull(pPlain)) {
      throw errorFieldNotNullable(enMatMaterial, fldPlain);
    }
    var old = _plainKey;
    _plainKey = pPlainKey;
    _plain = pPlain;
    super.isUpdated = (!super.isNew) && (old != _plainKey);
  }

  String? get link => _link;
  void setLink(String? pLink) {
    var old = _link;
    _link = pLink;
    super.isUpdated = (!super.isNew) && (old != _link);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldName: _name,
      fldDescKey: _descKey,
      fldDesc: _desc,
      fldResource: _resource,
      fldResourceType: _type,
      fldPlainKey: _plainKey,
      fldPlain: _plain,
      fldLink: _link,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldNameKey: _nameKey,
      fldDescKey: _descKey,
      fldResource: _resource!.id,
      fldResourceType: _type.id,
      fldPlainKey: _plainKey,
      fldLink: _link,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldNameKey,
        fldDescKey,
        fldResource,
        fldResourceType,
        fldPlainKey,
        fldLink,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnMatMaterial (
      $standardHeader,
      
      $fldNameKey      $dbtTextNotNullUnique,
      $fldDescKey      $dbtText,
      $fldResource     $dbtIntNotNull REFERENCES $tnRscResource($fldId),
      $fldResourceType $dbtIntNotNull DEFAULT 0,
      $fldPlainKey     $dbtText,
      $fldLink         $dbtText
    );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldNameKey,
           $fldDescKey,
           $fldResource,
           $fldResourceType,
           $fldPlainKey,
           $fldLink
    FROM   $tnMatMaterial
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnMatMaterial
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnMatMaterial (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldNameKey, $fldDescKey, $fldResource,
      $fldResourceType, $fldPlainKey, $fldLink)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?,  ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnMatMaterial
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldNameKey = ?,
        $fldDescKey = ?,
        $fldResource = ?,
        $fldResourceType = ?,
        $fldPlainKey = ?,
        $fldLink = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_nameKey) &&
        isNotNull(_name) &&
        isNotNull(_resource) &&
        isNotNull(_type));
  }
}
