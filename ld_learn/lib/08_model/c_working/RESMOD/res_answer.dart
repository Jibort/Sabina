// Representació d'una entrada en el DsmV.
// createdAt: 24/08/13 dt. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/07_services/index.dart';
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/e_localization/index.dart';
import 'package:ld_learn/09_tools/index.dart';

// Representació d'una entrada en el DsmV.
class ResAnswer extends ModelEntity {
  static final _version = Version.parse("0.7.2");
  static Version get version => _version;

  // MEMBRES --------------------------
  TstTest? _test; // NOT NULL
  TstQuestion? _question; // NOT NULL
  String? _answer;
  LstOptionList? _list;
  EmoEmotion? _emotion;
  EmoMood? _mood;
  DateTime? _completedAt;
  UsrUser? _evaluatedBy;
  DateTime? _evaluatedAt;
  String? _evaluation;

  // CONSTRUCTORS ---------------------
  ResAnswer(
      {required super.pCore,
      TstTest? pTest,
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
    _answer = pAnswer;
    _list = pList;
    _emotion = pEmotion;
    _mood = pMood;
    _completedAt = pCompletedAt;
    _evaluatedBy = pEvaluatedBy;
    _evaluatedAt = pEvaluatedAt;
    _evaluation = pEvaluation;
  }

  ResAnswer.empty()
      : this(
            pCore: CoreEntity.empty(),
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
    _answer = pMap[fldAnswer];
    _list = pMap[fldList];
    _emotion = pMap[fldEmotion];
    _mood = pMap[fldMood];
    _completedAt = pMap[fldCompletedAt];
    _evaluatedBy = pMap[fldEvaluatedBy];
    _evaluatedAt = pMap[fldEvaluatedAt];
    _evaluation = pMap[fldEvaluation];
  }

  ResAnswer.bySQLMap(BaseController<DeepDo> pCtrl, Map<String, dynamic> pMap)
      : super.bySQLMap(ResAnswer, pMap) {
    var dbs = DatabaseService.to;
    Exception? exc;

    _answer = pMap[fldAnswer];
    _completedAt = pMap[fldCompletedAt];
    _evaluatedAt = pMap[fldEvaluatedAt];
    _evaluation = pMap[fldEvaluation];

    // Carreguem el test.
    Future<Exception?> stTest(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
      try {
        _test = await dbs.byKey(pCtrl, TstTest, pKey: pMap[fldTest]);

        // Carreguem la pregunta.
        Future<Exception?> stQuestion(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
          try {
            _question = await dbs.byKey(pCtrl, TstQuestion, pKey: pArgs.first);

            // Carreguem la llista d'opcions.
            Future<Exception?> stList(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
              try {
                _list = await dbs.byKey(pCtrl, LstOptionList, pKey: pArgs.first);

                // Carreguem l'emoció.
                Future<Exception?> stEmotion(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                  try {
                    _emotion = await dbs.byKey(pCtrl, EmoEmotion, pKey: pArgs.first);

                    // Carreguem l'estat d'ànim.
                    Future<Exception?> stMood(FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                      try {
                        _mood = await dbs.byKey(pCtrl, EmoMood, pKey: pArgs.first);

                        // Carreguem el terapeuta avaluador.
                        Future<Exception?> stEvalBy(
                            FiFo<dynamic> pQueue, List<dynamic> pArgs) async {
                          try {
                            _evaluatedBy = await dbs.byKey(pCtrl, UsrUser, pKey: pArgs.first);

                            // Carrega createdBy i updatedBy.
                            super.core.completeStandard(pCtrl, pMap);
                          } on Exception catch (pExc) {
                            exc = pExc;
                          }
                          return exc;
                        }

                        pCtrl.state.sneakFn(stEvalBy, pArgs: [pMap[fldEvaluatedBy]]);
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

            pCtrl.state.sneakFn(stList, pArgs: [pMap[fldList]]);
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
      fldAnswer: _answer,
      fldList: _list,
      fldEmotion: _emotion,
      fldMood: _mood,
      fldCompletedAt: _completedAt,
      fldEvaluatedBy: _evaluatedBy,
      fldEvaluatedAt: _evaluatedAt,
      fldEvaluation: _evaluation,
    });

  @override
  Map<String, dynamic> toSQLMap() => super.toSQLMap()
    ..addAll({
      fldTest: _test!.serverId,
      fldQuestionId: _question!.serverId,
      fldAnswer: _answer,
      fldList: _list?.serverId,
      fldEmotion: _emotion?.serverId,
      fldMood: _mood?.serverId,
      fldCompletedAt: dTimeToSql(_completedAt),
      fldEvaluatedBy: _evaluatedBy?.serverId,
      fldEvaluatedAt: dTimeToSql(_evaluatedAt),
      fldEvaluation: _evaluation,
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
      
      $fldTest        $dbtIntNotNull REFERENCES $tnTstTest($fldId),
      $fldQuestionId  $dbtIntNotNull REFERENCES $tnTstQuestion($fldId),
      $fldAnswer      $dbtText,
      $fldList        $dbtIntNotNull REFERENCES $tnLstOptionList($fldId),
      $fldEmotion     $dbtIntNotNull REFERENCES $tnEmoEmotion($fldId),
      $fldMood        $dbtIntNotNull REFERENCES $tnEmoMood($fldId),
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
    return (isNotNull(super.core.createdBy) &&
        isNotNull(super.core.createdAt) &&
        isNotNull(_test) &&
        isNotNull(_question));
  }
}
