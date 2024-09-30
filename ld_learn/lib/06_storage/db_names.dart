// Constants que representen els noms dels camps
// de les taules de la base de dades SQFLite.
// createdAt: 24/07/24 dc. JIQ

// Camps de capçalera dels diferents tipus de taules.
String standardHeader = '''
    $fldIdLocal   $dbtIntID,
    $fldId        $dbtIntNotNullUnique,
    $fldCreatedBy $dbtIntNotNull REFERENCES $tnUsrUser($fldId),
    $fldCreatedAt $dbtDateTimeNotNull,
    $fldUpdatedBy $dbtInt REFERENCES $tnUsrUser($fldId),
    $fldUpdatedAt $dbtDateTime
''';

// TABLE / ENTITY NAMES ===============
// a_user
// ------
// USRMOD...
const String tnUsrUser = "USR_USER";
const String enUsrUser = "UsrUser";
const String tnUsrDevice = "USR_DEVICE";
const String enUsrDevice = "UsrDevice";
const String tnUsrFcmHistory = "USR_FCM_HISTORY";
const String enUsrFcmHistory = "UsrFcmHistory";

// b_definitions
// -------------
// DISMOD...
const String tnDisDsmV = "DIS_DSM_V";
const String enDisDsmV = "DisDsmV";
const String tnDisDisease = "DIS_DISEASE";
const String enDisDisease = "DisDisease";
const String tnDisPhase = "DIS_PHASE";
const String enDisPhase = "DisPhase";
const String tnDisGoal = "DIS_GOAL";
const String enDisGoal = "DisGoal";

// EMOMOD...
const String tnEmoEmotion = "EMO_EMOTION";
const String enEmoEmotion = "EmoEmotion";
const String tnEmoMood = "EMO_MOOD";
const String enEmoMood = "EmoMood";

// RSCMOD...
const String tnRscResource = "RSC_RESOURCE";
const String enRscResource = "RscResource";
const String tnRscPhaseResource = "RSC_PHASE_RESOURCE";
const String enRscPhaseResource = "RscPhaseResource";

// TCKMOD...
const String tnTckTracking = "TCK_TRACKING";
const String enTckTracking = "TckTracking";
const String tnTckTrackingColumn = "TCK_TRACKING_COLUMN";
const String enTckTrackingColumn = "TckTrackingColumn";
const String tnTckPhaseTracking = "TCK_PHASE_TRACKING";
const String enTckPhaseTracking = "TckPhaseTracking";

// TSTMOD...
const String tnTstTest = "TST_TEST";
const String enTstTest = "TstTest";
const String tnTstTestCategory = "TST_CATEGORY";
const String enTstTestCategory = "TstCategory";
const String tnTstQuestion = "TST_QUESTION";
const String enTstQuestion = "TstQuestion";

// DGNMOD...
const String tnDgnDiagnosis = "DGN_DIAGNOSIS";
const String enDgnDiagnosis = "DgnDiagnosis";
const String tnDgnDiagnosisPhase = "DGN_DIAGNOSIS_PHASE";
const String enDgnDiagnosisPhase = "DgnDiagnosisPhase";
const String tnDgnAchievement = "DGN_ACHIEVEMENT";
const String enDgnAchievement = "DgnAchievement";

// c_working
// ---------
// MATMOD...
const String tnMatMaterial = "MAT_MATERIAL";
const String enMatMaterial = "MatMaterial";
const String tnMatPhaseMaterial = "MAT_PHASE_MATERIAL";
const String enMatPhaseMaterial = "MatPhaseMaterial";

// REGMOD...
const String tnRegRegister = "REG_REGISTER";
const String enRegRegister = "RegRegister";
const String tnRegRegisterColumn = "REG_REGISTER_COLUMN";
const String enRegRegisterColumn = "RegRegisterColumn";

// RESMOD...
const String tnResPatientTest = "PATIENT_TEST";
const String enResPatientTest = "ResPatientTest";
const String tnResAnswer = "ANSWER";
const String enResAnswer = "ResAnswer";

// VISMOD...
const String tnVisVisit = "VIS_VISIT";
const String enVisVisit = "VisVisit";

// NTFMOD...
const String tnNtfNotification = "NTF_NOTIFICATION";
const String enNtfNotification = "NtfNotification";

// TSKMOD...
const String tnTskTask = "TSK_TASK";
const String enTskTask = "TskTask";

// e_localization
// --------------
// LOCMOD...
const String tnLocTranslation = "LOC_TRANSLATION";
const String enLocTranslation = "LocTranslation";

// LSTMOD...
const String tnLstListCategory = "LST_LIST_CATEGORY";
const String enLstListCategory = "LstListCategory";
const String tnLstOptionList = "LST_OPTION_LIST";
const String enLstOptionList = "LstOptionList";
const String tnLstOptionEntry = "LST_OPTION_ENTRY";
const String enLstOptionEntry = "LstOptionEntry";

// TIPUS DE CAMP ======================
// INT --------------------------------
String dbtInt = "INT";
String dbtIntUnique = "$dbtInt UNIQUE";
String dbtIntNotNull = "$dbtInt NOT NULL";
String dbtIntNotNullUnique = "$dbtIntNotNull UNIQUE";
String dbtIntAuto = "$dbtInt AUTOINCREMENT";
String dbtIntID = "$dbtIntNotNull AUTOINCREMENT";

// TEXT -------------------------------
String dbtText = "TEXT";
String dbtTextNotNull = "$dbtText NOT NULL";
String dbtTextNotNullUnique = "$dbtTextNotNull UNIQUE";

// FLOAT -----------------------------
String dbtFloat = "FLOAT";
String dbtFloatNotNull = "$dbtFloat NOT NULL";

// DATETIME ----------------------------
String dbtDateTime = dbtInt;
String dbtDateTimeNotNull = "$dbtInt NOT NULL";

// BOOLEAN ----------------------------
String dbtBoolean = "BOOLEAN";
String dbtBooleanNotNull = "$dbtBoolean NOT NULL";

// CORE_ENTITY ========================
const String fldEntityKey = "ENTITY_KEY";

// Codi d'iteració/versió.
const String fldIteration = "ITERATION";

// ID Local: Clau local dels registres.
const String fldIdLocal = "ID_LOCAL";

// ID: Clau o primera part de la clau primària d'un registre de la taula.
const String fldId = "ID";

// ID_B: Segona part de la clau primària d'un registre de la taula.
const String fldIdB = "ID_B";

// Identificador de l'usuari que ha creat el registre.
const String fldCreatedBy = "CREATED_BY";

// Data de creació del registre.
const String fldCreatedAt = "CREATED_AT";

// Identificador de l'usuari que ha actualitzat el registre.
// Valor nul quan el registre està creat a la base de dades
// però encara no ha estat actualitzat.
const String fldUpdatedBy = "UPDATED_BY";

// Data d'actualització del registre.
// Valor nul quan el registre està creat a la base de dades
// però encara no ha estat actualitzat.
const String fldUpdatedAt = "UPDATED_AT";

const String fldIsNew = "ISNEW";
const String fldIsUpdated = "ISUPDATED";
const String fldIsDeleted = "ISDELETED";

// USRMOD =============================
// UsrUser...
const String fldPermissions = "PERMISSIONS";
const String fldAlias = "ALIAS";
const String fldCertificate = "CERTIFICATE";
const String fldBirthDate = "BIRTH_DATE";
const String fldFirstConnKey = "FIRST_CONN_KEY";
const String fldFirstConnAt = "FIRST_CONN_AT";
const String fldDevice = "DEVICE";

// Tipus...
const String fldDeviceType = "DEVICE_TYPE";
const String fldTrackingColumnType = "TRACKING_COLUMN_TYPE";
const String fldUserType = "USER_TYPE";
const String fldQuestionType = "QUESTION_TYPE";
const String fldTaskType = "TASK_TYPE";
const String fldVisitType = "VISIT_TYPE";
const String fldVisitState = "VISIT_STATE";
const String fldNotificationType = "NTF_TYPE";
const String fldNotificationState = "NTF_STATE";

// Estats....
const String fldUserState = "USER_STATE";
const String fldDeviceState = "DEVICE_STATE";
const String fldDiagnosisState = "DIAGNOSIS_STATE";
const String fldDiagnosisPhaseState = "DIAGNOSIS_PHASE_STATE";
const String fldAchievementState = "ACHIEVEMENT_STATE";
const String fldRegisterState = "REGISTER_STATE";
const String fldTaskState = "TASK_STATE";

// Pendents de catalogar...
const String fldToken = "TOKEN";
const String fldOwner = "OWNER";
const String fldMandatory = "MANDATORY";
const String fldCustom = "CUSTOMIZED";
const String fldSince = "SINCE";
const String fldLastOne = "LAST_ONE";
const String fldFirstDate = "FIRST_DATETIME";
const String fldLastDate = "LAST_DATETIME";
const String fldNotification = "NOTIFICATION";

// EMOMOD =============================
const String fldValue = "VALUE";

// LOCMOD =============================
// Identificador de dues lletres d'una llengua.
const String fldLocale = "LOCALE";
const String fldLocaleCode = "LOCALE_CODE";

// Clau del text a traduïr.
const String fldTextKey = "TEXTKEY";

// Text traduït.
const String fldLiteral = "LITERAL";

const String fldIcd10 = "CIE_10";

const String fldIdx = "IDX";

const String fldVersion = "VERSION";
const String fldResourceType = "RESOURCE_TYPE";
const String fldInlineText = "INLINE_TEXT";
const String fldLink = "LINK";

// Noms dels camps claus foranes.
const String fldUser = "USER_ID";
const String fldPatient = "PATIENT_ID";
const String fldParent = "PARENT_ID";
const String fldDisease = "DISEASE_ID";
const String fldDsmV = "DSM_V_ID";
const String fldList = "LIST_ID";
const String fldDiseasePhase = "DISEASE_PHASE_ID";
const String fldResource = "RESOURCE_ID";
const String fldRoot = "ROOT_ID";
const String fldTherapist = "THERAPIST_ID";
const String fldTracking = "TRACKING_ID";
const String fldTrackingColumn = "TRACKING_COLUMN_ID";
const String fldTest = "TEST_ID";
const String fldPatientTest = "PATIENT_TEST_ID";
const String fldTestCategory = "TEST_CATEGORY_ID";
const String fldDiagnosis = "DIAGNOSIS_ID";
const String fldDiagnosisPhase = "DIAGNOSIS_PHASE_ID";
const String fldBlock = "BLOCK_ID";
const String fldVisit = "VISIT_ID";
const String fldRelapse = "RELAPSE_ID";
const String fldGoal = "GOAL_ID";
const String fldPhaseResource = "PHASE_RESOURCE_ID";
const String fldRegister = "REGISTER_ID";
const String fldOptionEntry = "OPTION_ID";
const String fldEmotion = "EMOTION_ID";
const String fldMood = "MOOD_ID";
const String fldEvaluatedBy = "EVALUATED_BY";
const String fldQuestionId = "QUESTION_ID";
const String fldListCategory = "LIST_CATEGORY_ID";

// Camps de clau de traduccions.
const String fldNameKey = "NAME_KEY";
const String fldName = "NAME";
const String fldDescKey = "DESCRIPTION_KEY";
const String fldDesc = "DESC";
const String fldInstrKey = "INSTRS_KEY";
const String fldInstr = "INSTRS";
const String fldQuestionKey = "QUESTION_KEY";
const String fldQuestion = "QUESTION";
const String fldOptionKey = "OPTION_KEY";
const String fldOption = "OPTION";
const String fldTitleKey = "TITLE_KEY";
const String fldTitle = "TITLE";
const String fldHelpKey = "HELP_KEY";
const String fldHelp = "HELP";
const String fldPlainKey = "PLAIN_KEY";
const String fldPlain = "PLAIN";

const String fldAnnotations = "ANNOTATIONS";
const String fldEvaluation = "EVALUATION";
const String fldAnswer = "ANSWER";

// Dates...
const String fldDateTime = "DATE_TIME";
const String fldAssignedAt = "ASSIGNED_AT";
const String fldCompletedAt = "COMPLETED_AT";
const String fldEvaluatedAt = "EVALUATED_AT";
const String fldStartDate = "START_DATE";
const String fldEndDate = "END_DATE";

// Booleans...
const String fldIsFirst = "IS_FIRST";
const String fldIsAlpha = "IS_ALPHA";
