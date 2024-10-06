// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/c_working/index.dart';
import 'package:ld_learn/08_model/e_localization/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class ResAnswer extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  ResPatientTest? _test; 
  TstQuestion? _question;
  String? __answer;
  LstOptionEntry? __option;
  EmoEmotion? __emotion;
  EmoMood? __mood;
  DateTime? __completedAt;
  UsrUser? __evaluatedBy;
  DateTime? __evaluatedAt;
  String? __evaluation;

  // CONSTRUCTORS ---------------------
  ResAnswer(
      {required super.pLocalId,
      required super.pId,
      required super.pCreatedBy,
      required super.pCreatedAt,
      required super.pUpdatedBy,
      required super.pUpdatedAt,
      super.pIsNew,
      super.pIsUpdated,
      super.pIsDeleted,
      ResPatientTest? pTest,
      TstQuestion? pQuestion,
      String? pAnswer,
      LstOptionList? pList,
      EmoEmotion? pEmotion,
      EmoMood? pMood,
      DateTime? pCompletedAt,
      UsrUser? pEvaluatedBy,
      DateTime? pEvaluatedAt,
      String? pEvaluation}) {
    _test = pTest;
    _question = pQuestion;
    __answer = pAnswer;
    __option = pList;
    __emotion = pEmotion;
    __mood = pMood;
    __completedAt = pCompletedAt;
    __evaluatedBy = pEvaluatedBy;
    __evaluatedAt = pEvaluatedAt;
    __evaluation = pEvaluation;
  }

  ResAnswer.empty()
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
            pQuestion: null,
            pAnswer: null,
            pList: null,
            pEmotion: null,
            pMood: null,
            pCompletedAt: null,
            pEvaluatedBy: null,
            pEvaluatedAt: null,
            pEvaluation: null);

  ResAnswer.byMap(Map<String, dynamic> pMap) : super.byMap(pMap) {
    _test = pMap[fldTest];
    _question = pMap[fldQuestion];
    __answer = pMap[fldAnswer];
    __option = pMap[fldOptionEntry];
    __emotion = pMap[fldEmotion];
    __mood = pMap[fldMood];
    __completedAt = pMap[fldCompletedAt];
    __evaluatedBy = pMap[fldEvaluatedBy];
    __evaluatedAt = pMap[fldEvaluatedAt];
    __evaluation = pMap[fldEvaluation];
  }

  ResAnswer.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(ResAnswer, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    __answer = pMap[fldAnswer];
    __completedAt = pMap[fldCompletedAt];
    __evaluatedAt = pMap[fldEvaluatedAt];
    __evaluation = pMap[fldEvaluation];

    // Carreguem el test.
    Future<Exception?> stTest(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _test = await dbs.byKey(pCtrl, TstTest, pKey: pMap[fldTest]);

        // Carreguem la pregunta.
        Future<Exception?> stQuestion(
            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _question = await dbs.byKey(pCtrl, TstQuestion, pKey: pArgs.first);

            // Carreguem l'opcions.
            Future<Exception?> stOptionEntry(
                FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                __option =
                    await dbs.byKey(pCtrl, LstOptionEntry, pKey: pArgs.first);

                // Carreguem l'emoció.
                Future<Exception?> stEmotion(
                    FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                  try {
                    __emotion =
                        await dbs.byKey(pCtrl, EmoEmotion, pKey: pArgs.first);

                    // Carreguem l'estat d'ànim.
                    Future<Exception?> stMood(
                        FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                      try {
                        __mood =
                            await dbs.byKey(pCtrl, EmoMood, pKey: pArgs.first);

                        // Carreguem el terapeuta avaluador.
                        Future<Exception?> stEvalBy(
                            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                          try {
                            __evaluatedBy = await dbs.byKey(pCtrl, UsrUser,
                                pKey: pArgs.first);

                            // Carrega createdBy i updatedBy.
                            super.completeStandard(pCtrl, pMap);
                          } on Exception catch (pExc) {
                            exc = pExc;
                          }
                          return exc;
                        }

                        pCtrl.state
                            .sneakFn(stEvalBy, pArgs: [pMap[fldEvaluatedBy]]);
                      } on Exception catch (pExc) {
                        exc = pExc;
                      }
                      return exc;
                    }

                    pCtrl.state.sneakFn(stMood, pArgs: [pMap[fldMood]]);
                  } on Exception catch (pExc) {
                    exc = pExc;
                  }
                  return exc;
                }

                pCtrl.state.sneakFn(stEmotion, pArgs: [pMap[fldEmotion]]);
              } on Exception catch (pExc) {
                exc = pExc;
              }
              return exc;
            }

            pCtrl.state.sneakFn(stOptionEntry, pArgs: [pMap[fldOptionEntry]]);
          } on Exception catch (pExc) {
            exc = pExc;
          }
          return exc;
        }

        pCtrl.state.sneakFn(stQuestion, pArgs: [pMap[fldQuestionId]]);
      } on Exception catch (pExc) {
        exc = pExc;
      }
      return exc;
    }

    pCtrl.state.sneakFn(stTest, pArgs: [pMap[fldTest]]);
  }

  // GETTERS i SETTERS ----------------

  // CONVERSION TO MAPs ---------------
  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      fldTest: _test,
      fldQuestionId: _question,
      fldAnswer: __answer,
      fldOptionEntry: __option,
      fldEmotion: __emotion,
      fldMood: __mood,
      fldCompletedAt: __completedAt,
      fldEvaluatedBy: __evaluatedBy,
      fldEvaluatedAt: __evaluatedAt,
      fldEvaluation: __evaluation,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTest: _test!.id,
      fldQuestionId: _question!.id,
      fldAnswer: __answer,
      fldOptionEntry: __option?.id,
      fldEmotion: __emotion?.id,
      fldMood: __mood?.id,
      fldCompletedAt: dTimeToSql(__completedAt),
      fldEvaluatedBy: __evaluatedBy?.id,
      fldEvaluatedAt: dTimeToSql(__evaluatedAt),
      fldEvaluation: __evaluation,
    });

  // STATICS --------------------------
  static final List<String> tableFields = EntityKeyType.standard.mainFields +
      [
        fldTest,
        fldQuestionId,
        fldAnswer,
        fldList,
        fldEmotion,
        fldMood,
        fldCompletedAt,
        fldEvaluatedBy,
        fldEvaluatedAt,
        fldEvaluation,
      ];

  static String get stmtCreateTable => '''
    CREATE TABLE $tnResAnswer (
      $standardHeader,
      
      $fldPatientTest $dbtIntNotNull REFERENCES $tnResPatientTest($fldId),
      $fldQuestionId  $dbtIntNotNull REFERENCES $tnTstQuestion($fldId),
      $fldAnswer      $dbtText,
      $fldOptionEntry $dbtInt REFERENCES $tnLstOptionEntry($fldId),
      $fldEmotion     $dbtInt REFERENCES $tnEmoEmotion($fldId),
      $fldMood        $dbtInt REFERENCES $tnEmoMood($fldId),
      $fldCompletedAt $dbtDateTime,
      $fldEvaluatedBy $dbtInt REFERENCES $tnUsrUser($fldId),
      $fldEvaluatedAt $dbtDateTime,
      $fldEvaluation  $dbtText
      );
  ''';

  static List<String> get stmtAuxCreate => [];

  static String get stmtSelect => '''
    SELECT $fldIdLocal, $fldId, $fldCreatedBy, $fldCreatedAt, 
           $fldUpdatedBy, $fldUpdatedAt,

           $fldTest,
           $fldQuestionId,
           $fldAnswer,
           $fldList,
           $fldEmotion,
           $fldMood,
           $fldCompletedAt,
           $fldEvaluatedBy,
           $fldEvaluatedAt,
           $fldEvaluation
    FROM   $tnResAnswer
    WHERE  $fldId = ?;
  ''';

  static String get stmtDelete => '''
    DELETE FROM $tnResAnswer
    WHERE  $fldIdLocal = ?;
  ''';

  static String get stmtInsert => '''
    INSERT INTO $tnResAnswer (
      $fldId, $fldCreatedBy, $fldCreatedAt, $fldUpdatedBy, $fldUpdatedAt,

      $fldTest, $fldQuestionId, $fldAnswer, $fldList,
      $fldEmotion, $fldMood, $fldCompletedAt,
      $fldEvaluatedBy, $fldEvaluatedAt, $fldEvaluation)
    VALUES (?, ?, ?, ?, ?,   ?, ?, ?, ?,   ?, ?, ?,   ?, ?, ?);
  ''';

  static String get stmtUpdate => '''
    UPDATE $tnResAnswer
    SET $fldId = ?,
        $fldCreatedBy = ?, $fldCreatedAt = ?,
        $fldUpdatedBy = ?, $fldUpdatedAt = ?,

        $fldTest = ?,
        $fldQuestionId = ?,
        $fldAnswer = ?,
        $fldList = ?,
        $fldEmotion = ?,
        $fldMood = ?,
        $fldCompletedAt = ?,
        $fldEvaluatedBy = ?,
        $fldEvaluatedAt = ?,
        $fldEvaluation = ?
    WHERE $fldIdLocal = ?;  
  ''';

  // OVERRIDES ------------------------
  @override
  bool isCompleted() {
    return (super.isCompleted() &&
        isNotNull(_test) &&
        isNotNull(_question));
  }
}
