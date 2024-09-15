// Extensió de la classe String per a completar isNull.
// 24/09/02 dl. JIQ

// Comprovació de nul.
import 'package:ld_learn/08_model/a_user/index.dart';
import 'package:ld_learn/08_model/b_definitions/index.dart';
import 'package:ld_learn/08_model/c_working/index.dart';
import 'package:ld_learn/08_model/d_administration/index.dart';

bool isNull(dynamic pInst) {
  if (isNull(pInst)) return true;
  switch (pInst) {
    case String str:
      return str.trim().isEmpty;
    case UserType usrType:
      return usrType == UserType.unspecified;
    case UserState usrState:
      return usrState == UserState.unspecified;
    case DeviceType devType:
      return devType == DeviceType.unspecified;
    case DeviceState devState:
      return devState == DeviceState.unspecified;
    case ResourceType resType:
      return resType == ResourceType.unspecified;
    case TrackingColumnType trkColType:
      return trkColType == TrackingColumnType.unspecified;
    case QuestionType qstType:
      return qstType == QuestionType.unspecified;
    case AchievementState achState:
      return achState == AchievementState.unspecified;
    case DiagnosisPhaseState diagState:
      return diagState == DiagnosisPhaseState.unspecified;
    case DiagnosisState diagState:
      return diagState == DiagnosisState.unspecified;
    case RegisterState regState:
      return regState == RegisterState.unspecified;
    case NotificationType notifType:
      return notifType == NotificationType.unspecified;
    case NotificationState notifState:
      return notifState == NotificationState.unspecified;
    case TaskType taskType:
      return taskType == TaskType.unspecified;
    case TaskState taskState:
      return taskState == TaskState.unspecified;
    case VisitType visitType:
      return visitType == VisitType.unspecified;
    case VisitState visitState:
      return visitState == VisitState.unspecified;
    default:
      return false;
  }
}

// Comprovació de no nul.
bool isNotNull(dynamic pInst) {
  return !isNull(pInst);
}
