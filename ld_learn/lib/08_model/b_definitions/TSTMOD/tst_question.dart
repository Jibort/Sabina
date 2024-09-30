// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters, unused_field, prefer_final_fields

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Enumeració dels tipus de preguntes de test.
enum QuestionType {
  unspecified,
  plainText,
  boolean,
  list,
  emotion,
  mood,
  date,
  dateTime,
}

// Representació d'una entrada en el DsmV.
class TstQuestion extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  TstTest? _test;
  QuestionType _type = QuestionType.unspecified;
  TstQuestion? __block;
  String? _questionKey;
  String? _question;
  String? __helpKey;
  String? __help;
  bool _mandatory = true;
  bool _custom = false;

  // CONSTRUCTORS ---------------------
  TstQuestion(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      TstTest? pTest,
      QuestionType pType = QuestionType.unspecified,
      TstQuestion? pBlock,
      String? pQuestionKey,
      String? pQuestion,
      String? pHelpKey,
      String? pHelp,
      bool pMandatory = false,
      bool pCustom = false}) {
    _test = pTest;
    _type = pType;
    __block = pBlock;
    _questionKey = pQuestionKey;
    _question = pQuestion;
    __helpKey = pHelpKey;
    __help = pHelp;
    _mandatory = pMandatory;
    _custom = pCustom;
  }

  TstQuestion.empty()
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
          pTest: null,
          pType: QuestionType.unspecified,
          pBlock: null,
          pQuestionKey: null,
          pQuestion: null,
          pHelpKey: null,
          pHelp: null,
          pMandatory: false,
          pCustom: false,
        );

  TstQuestion.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _test = pMap[fldTest];
    _type = pMap[fldQuestionType];
    __block = pMap[fldBlock];
    _questionKey = pMap[fldQuestionKey];
    _question = pMap[fldQuestion];
    __helpKey = pMap[fldHelpKey];
    __help = pMap[fldHelp];
    _mandatory = pMap[fldMandatory];
    _custom = pMap[fldCustom];
  }

  TstQuestion.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(TstQuestion, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _mandatory = (pMap[fldMandatory] == 1);
    _custom = (pMap[fldCustom] == 1);

    // Traduïm el question key.
    Future<Exception?> stQuestion(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _questionKey = pArgs.first;
        _question = await dbs.trans(pCtrl, pTKey: _questionKey);

        // Traduïm el help key.
        Future<Exception?> stHelp(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            __helpKey = pArgs.first;
            __help = await dbs.trans(pCtrl, pTKey: __helpKey);

            // Carreguem el test.
            Future<Exception?> stTest(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _test = await dbs.byKey(pCtrl, TstTest, pKey: pArgs.first);

                // Carreguem el question block.
                Future<Exception?> stBlock(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                  try {
                    __block = await dbs.byKey(pCtrl, TstQuestion, pKey: pArgs.first);

                    // Carrega createdBy i updatedBy.
                    super.completeStandard(pCtrl, pMap);
                  } on Exception catch (pExc) {
                    exc = pExc;
                  }
                  return exc;
                }

                pCtrl.state.sneakFn(stBlock, pArgs: [pMap[fldTest]]);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stTest, pArgs: [pMap[fldBlock]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stHelp, pArgs: [pMap[fldHelpKey]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stQuestion, pArgs: [pMap[fldQuestionKey]]);
  }

  // GETTERS i SETTERS ----------------
  TstTest? get test => _test;
  void setTest(TstTest? pTest) {
    if (isNull(pTest)) {
      throw errorFieldNotNullable("$enTstQuestion.set", fldTest);
    }
    var old = _test;
    _test = pTest;
    super.isUpdated = (!super.isNew) && (old != _test);
  }

  QuestionType get type => _type;
  void setType(QuestionType pType) {
    if (isNull(pType)) {
      throw errorFieldNotNullable("$enTstQuestion.set", fldQuestionType);
    }
    var old = _type;
    _type = pType;
    super.isUpdated = (!super.isNew) && (old != _type);
  }

  TstQuestion? get block => __block;
  void setBlock(TstQuestion? pBlock) {
    var old = __block;
    __block = pBlock;
    super.isUpdated = (!super.isNew) && (old != __block);
  }

  String? get questionKey => _questionKey;
  String? get question => _question;
  void setQuestion(String? pQuestionKey, String? pQuestion) {
    if (isNull(pQuestionKey) || isNull(pQuestion)) {
      throw errorFieldNotNullable("$enTstQuestion.set", fldQuestion);
    }
    var old = _questionKey;
    _questionKey = pQuestionKey;
    _question = pQuestion;
    super.isUpdated = (!super.isNew) && (old != _questionKey);
  }

  String? get helpKey => __helpKey;
  String? get help => __help;
  void setHelp(String? pHelpKey, String? pHelp) {
    var old = __helpKey;
    __helpKey = pHelpKey;
    __help = pHelp;
    super.isUpdated = (!super.isNew) && (old != __helpKey);
  }

  bool get mandatory => _mandatory;
  void setMandatory(bool pMandatory) {
    var old = _mandatory;
    _mandatory = pMandatory;
    super.isUpdated = (!super.isNew) && (old != _mandatory);
  }

  bool get custom => _custom;
  void setCustom(bool pCustom) {
    var old = _custom;
    _custom = pCustom;
    super.isUpdated = (!super.isNew) && (old != _custom);
  }

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldTest: _test,
      fldQuestionType: _type,
      fldBlock: __block,
      fldQuestionKey: _questionKey,
      fldQuestion: _question,
      fldHelpKey: __helpKey,
      fldHelp: __help,
      fldMandatory: _mandatory,
      fldCustom: _custom,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTest: _test!.id,
      fldQuestionType: _type.id,
      fldBlock: __block?.id,
      fldQuestionKey: _questionKey,
      fldHelpKey: __helpKey,
      fldMandatory: _mandatory ? 1 : 0,
      fldCustom: _custom ? 1 : 0,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldTest,
        fldQuestionType,
        fldBlock,
        fldQuestionKey,
        fldHelpKey,
        fldMandatory,
        fldCustom,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnTstQuestion (
      $standardHeader,
      
      $fldTest         $dbtIntNotNull REFERENCES $tnTstTest($fldId),
      $fldQuestionType $dbtIntNotNull,
      $fldBlock        $dbtInt REFERENCES $tnTstTest($fldId),
      $fldQuestionKey  $dbtTextNotNull,
      $fldHelpKey      $dbtText,
      $fldMandatory    $dbtBooleanNotNull DEFAULT TRUE,
      $fldCustom       $dbtBooleanNotNull DEFAULT FALSE
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldTest, $fldQuestionType, $fldBlock,
           $fldQuestionKey, $fldHelpKey, $fldMandatory, $fldCustom
    FROM   $tnTstQuestion
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnTstQuestion
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnTstQuestion (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldTest, $fldQuestionType, $fldBlock,
      $fldQuestionKey, $fldHelpKey, $fldMandatory, $fldCustom)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?,  ?, ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnTstQuestion
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldTest = ?, 
        $fldQuestionType = ?,
        $fldBlock = ?,
        $fldQuestionKey = ?,
        $fldHelpKey = ?,
        $fldMandatory = ?, 
        $fldCustom = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_test) &&
        isNotNull(questionKey) &&
        isNotNull(question));
  }
}

// EXTENSIONS =========================
extension TestQuestionIdx on QuestionType {
  // Retorna l'Id del tipus de pregunta de tracking.
  int get id {
    switch (this) {
      case QuestionType.unspecified:
        return 0;
      case QuestionType.plainText:
        return 1;
      case QuestionType.boolean:
        return 2;
      case QuestionType.list:
        return 3;
      case QuestionType.emotion:
        return 4;
      case QuestionType.mood:
        return 5;
      case QuestionType.date:
        return 6;
      case QuestionType.dateTime:
        return 7;
    }
  }
}

// Retorna el tipus del tipus de columna de tracking a partir del seu Id.
QuestionType questionTypeTypeById(int pId) {
  switch (pId) {
    case 0:
      return QuestionType.unspecified;
    case 1:
      return QuestionType.plainText;
    case 2:
      return QuestionType.boolean;
    case 3:
      return QuestionType.list;
    case 4:
      return QuestionType.emotion;
    case 5:
      return QuestionType.mood;
    default:
      throw 'Invalid QuestionType.id: $pId';
  }
}

// Retorna el tipus de columna de tracking a partir d'un dynamic.
TrackingColumnType dyn2QuestionType(dynamic pType) {
  switch (pType) {
    case TrackingColumnType type:
      return type;
    case int value:
      return trackingColumnTypeTypeById(value);
    default:
      throw errorUnknownType("TrackingColumnType.set", fldTrackingColumnType, pType.runtimeType);
  }
}
