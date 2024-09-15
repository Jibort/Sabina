// Definició de les diferents excepcions de l'aplicació.
// createdAt: 24/07/24 dc. JIQ

import 'package:get/get.dart';
import 'package:ld_learn/06_storage/index.dart';
import 'package:ld_learn/10_localization/index.dart';

Exception unsupportedStmtWithoutId(String pCtxt, String pTable) {
  return Exception("[$pCtxt] Unsupported '$pTable' statement without ID!");
}

Exception dereferenceNullField(String pCtxt, String pField) {
  return Exception("[$pCtxt] Cannot dereference null field '$pField'!");
}

Exception unknownKeyType(String pCtxt, String pKeyType) {
  return Exception("[$pCtxt] Unknown key type '$pKeyType'");
}

Exception errorEntityNullKey(String pCtxt, String pEntitName) {
  return Exception("[$pCtxt] Entity '$pEntitName' null key!");
}

Exception errorUnknownKey(String pCtxt, String pKey) {
  return Exception("[$pCtxt] Unknown key '$pKey'");
}

Exception errorFieldNotNullable(String pCtxt, String pFieldName) {
  return Exception("[$pCtxt] Field '$pFieldName' not nullable!");
}

Exception errorArgumentNotNullable(String pCtxt, String pArgument) {
  return Exception("[$pCtxt] Argument '$pArgument' not nullable!");
}

Exception unkownEntity(String pCtxt, Type pEntity) {
  return Exception("[$pCtxt] Unknown entity: '${pEntity.runtimeType}'!");
}

Exception deviceRootOrJailbreak(String pCtxt) {
  return Exception("[$pCtxt] Device rooted or jailbroken!");
}

Exception serviceUnavailable(String pCtxt, String pService) {
  return Exception("[$pCtxt] Service '$pService' is unavailable!");
}

Exception errorNoInternetConnection(String pCtxt) {
  return NoInternetConnection(pCtxt);
}

class NoInternetConnection implements Exception, UnsupportedError {
  final String _ctxt;
  @override
  String? get message => "[$_ctxt] ${L.noInternetConnection.tr}";
  @override
  StackTrace? get stackTrace => null;
  @pragma("vm:entry-point")
  const NoInternetConnection(String pCtxt) : _ctxt = pCtxt;
  @override
  String toString() => L.noInternetConnection.up;
}

Exception errorNoModelEntityType(String pCtxt, Type pType) {
  return Exception("[$pCtxt] Type '${pType.toString()}' is not a model entity!");
}

Exception errorUnknownType(String pCtxt, String pField, Type pType) {
  return Exception("[$pCtxt] Field '$pField' Type '${pType.toString()}' is not a model entity!");
}

Exception errorUnknownEntityKeyType(String pCtxt, EntityKeyType pKeyType) {
  return Exception("[$pCtxt] Unknown Entity Type '$pKeyType'!");
}

Exception errorUnknownException(String pCtxt, Exception pExc) {
  return Exception("[$pCtxt] Exception '${pExc.runtimeType}' is unknown!");
}

Exception errorDbNotOpen(String pCtxt) {
  return Exception("[$pCtxt] Local Database is not opened!");
}
