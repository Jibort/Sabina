// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/e_localization/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Enumeració dels tipus de columna de tracking.
enum TrackingColumnType {
  unspecified,
  plainText,
  boolean,
  list,
  emotion,
  mood,
  date,
  time,
  dateTime,
}

// Representació d'una entrada en el DsmV.
class TckTrackingColumn extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  TckTracking? _tracking;
  LstOptionList? _list;
  String? _titleKey;
  String? _title;
  TrackingColumnType _type = TrackingColumnType.unspecified;
  bool _mandatory = false;
  bool _custom = false;

  // CONSTRUCTORS ---------------------
  TckTrackingColumn(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      TckTracking? pTracking,
      LstOptionList? pList,
      String? pTitleKey,
      String? pTitle,
      TrackingColumnType pType = TrackingColumnType.unspecified,
      bool pMandatory = false,
      bool pCustom = false}) {
    _tracking = pTracking;
    _list = pList;
    _title = pTitle;
    _type = pType;
    _mandatory = pMandatory;
    _custom = pCustom;
  }

  TckTrackingColumn.empty()
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
            pTracking: null,
            pList: null,
            pTitleKey: null,
            pTitle: null,
            pType: TrackingColumnType.unspecified,
            pMandatory: false,
            pCustom: false);

  TckTrackingColumn.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _tracking = pMap[fldTracking];
    _list = pMap[fldList];
    _titleKey = pMap[fldTitleKey];
    _title = pMap[fldTitle];
    _type = pMap[fldTrackingColumnType];
    _mandatory = pMap[fldMandatory];
    _custom = pMap[fldCustom];
  }

  TckTrackingColumn.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(TckTrackingColumn, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _type = trackingColumnTypeTypeById(pMap[fldTrackingColumnType]);
    _mandatory = (pMap[fldMandatory] == 1);
    _custom = (pMap[fldCustom] == 1);

    // Traduïm el títol.
    Future<Exception?> stTitle(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _titleKey = pArgs.first;
        _title = await dbs.trans(pCtrl, pTKey: _titleKey);

        // Carreguem el tracking.
        Future<Exception?> stTracking(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _tracking = await dbs.byKey(pCtrl, TckTracking, pKey: pArgs.first);

            // Carreguem la llista.
            Future<Exception?> stList(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _list = await dbs.byKey(pCtrl, LstOptionList, pKey: pArgs.first);

                // Carrega createdBy i updatedBy.
                super.completeStandard(pCtrl, pMap);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stList, pArgs: [pMap[fldList]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stTracking, pArgs: [pMap[fldTracking]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stTitle, pArgs: [pMap[fldTitle]]);
  }

  // GETTERS i SETTERS ----------------
  TckTracking? get tracking => _tracking;
  void setTracking(TckTracking? pTracking) {
    if (isNull(pTracking)) {
      throw errorFieldNotNullable("$enTckTracking.set", fldTrackingColumn);
    }
    var old = _tracking;
    _tracking = pTracking;
    super.isUpdated = (!super.isNew) && (old != _tracking);
  }

  LstOptionList? get list => _list;
  void setList(LstOptionList? pList) {
    var old = _list;
    _list = pList;
    super.isUpdated = (!super.isNew) && (old != _list);
  }

  String? get titleKey => _titleKey;
  String? get title => _title;
  void setTitle(String? pKey, String? pTitle) {
    if (isNull(pKey) || isNull(pTitle)) {
      throw errorFieldNotNullable("$enTckTrackingColumn.set", fldTitle);
    }
    var oldKey = _titleKey;
    _titleKey = pKey;
    _title = pTitle;
    super.isUpdated = (!super.isNew) && (oldKey != _titleKey);
  }

  TrackingColumnType get type => _type;
  void setType(TrackingColumnType pType) {
    var old = _type;
    _type = pType;
    super.isUpdated = (!super.isNew) && (old != _type);
  }

  bool get isMandatory => _mandatory;
  void setMandatory(bool pMandatory) => _mandatory = pMandatory;

  bool get isCustom => _custom;
  void setCustom(bool pCustom) => _custom = pCustom;

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldTracking: _tracking,
      fldList: _list,
      fldTitleKey: _titleKey,
      fldTitle: _title,
      fldTrackingColumnType: _type,
      fldMandatory: _mandatory,
      fldCustom: _custom,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTracking: _tracking!.id,
      fldList: _list?.id,
      fldTitleKey: _titleKey,
      fldTrackingColumnType: _type.id,
      fldMandatory: _mandatory,
      fldCustom: _custom,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldTracking,
        fldList,
        fldTitleKey,
        fldTrackingColumnType,
        fldMandatory,
        fldCustom,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnTckTrackingColumn (
      $standardHeader,
      
      $fldTracking           $dbtIntNotNull REFERENCES $tnTckTracking($fldId),
      $fldList               $dbtInt REFERENCES $tnLstOptionList($fldId),
      $fldTitleKey           $dbtTextNotNull,
      $fldTrackingColumnType $dbtIntNotNull,
      $fldMandatory          $dbtBooleanNotNull,
      $fldCustom             $dbtBooleanNotNull
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldTracking, $fldList, $fldTitleKey, $fldTrackingColumnType,
           $fldMandatory, $fldCustom
    FROM   $tnTckTrackingColumn
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnTckTrackingColumn
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnTckTrackingColumn (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldTracking, $fldList, $fldTitleKey, $fldTrackingColumnType,
      $fldMandatory, $fldCustom)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?,  ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnTckTrackingColumn
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldTracking = ?,
        $fldList = ?,
        $fldTitleKey = ?,
        $fldTrackingColumnType = ?,
        $fldMandatory = ?,
        $fldCustom = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_tracking) &&
        isNotNull(_titleKey) &&
        isNotNull(_type));
  }
}

// EXTENSIONS =========================
extension TrackingColumnIdx on TrackingColumnType {
  // Retorna l'Id del tipus de columna de tracking.
  int get id {
    switch (this) {
      case TrackingColumnType.unspecified:
        return 0;
      case TrackingColumnType.plainText:
        return 1;
      case TrackingColumnType.boolean:
        return 2;
      case TrackingColumnType.list:
        return 3;
      case TrackingColumnType.emotion:
        return 4;
      case TrackingColumnType.mood:
        return 5;
      case TrackingColumnType.date:
        return 6;
      case TrackingColumnType.time:
        return 7;
      case TrackingColumnType.dateTime:
        return 8;
    }
  }
}

// Retorna el tipus del tipus de columna de tracking a partir del seu Id.
TrackingColumnType trackingColumnTypeTypeById(int pId) {
  switch (pId) {
    case 0:
      return TrackingColumnType.unspecified;
    case 1:
      return TrackingColumnType.plainText;
    case 2:
      return TrackingColumnType.boolean;
    case 3:
      return TrackingColumnType.list;
    case 4:
      return TrackingColumnType.emotion;
    case 5:
      return TrackingColumnType.mood;
    case 6:
      return TrackingColumnType.date;
    case 7:
      return TrackingColumnType.time;
    case 8:
      return TrackingColumnType.dateTime;
    default:
      throw 'Invalid TrackingColumnType.id: $pId';
  }
}

// Retorna el tipus de columna de tracking a partir d'un dynamic.
TrackingColumnType dyn2TrackingColumnType(dynamic pType) {
  switch (pType) {
    case TrackingColumnType type:
      return type;
    case int value:
      return trackingColumnTypeTypeById(value);
    default:
      throw errorUnknownType("TrackingColumnType.set", fldTrackingColumnType, pType.runtimeType);
  }
}
