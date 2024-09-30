// Catxè per a la base e dades.
// createdAt: 24/07/24 dc. JIQ

import 'package:ld_learn/06_storage/model_entity.dart';
import 'package:ld_learn/08_model/e_localization/index.dart';

class DbCacheService<T extends ModelEntity> {
  static late DbCacheService? _to;
  static DbCacheService get to {
    _to ??= DbCacheService();
    return _to!;
  }

  // MEMBRES --------------------------
  final instances = <String, T>{};

  // CONSTRUCTORS ---------------------
  DbCacheService() {
    _to = this;
  }

  // CERQUES i SALVAT -----------------
  T? byTypeKey(Type pType, {required dynamic pId, String? pIdB}) {
    return byKey(ModelEntity.keyByType(pType, pId, pIdB));
  }

  T? byKey(String pKey) {
    return instances[pKey];
  }

  void put(T pInst) {
    String sid;
    var tname = ModelEntity.stTableName(pInst.runtimeType);

    switch (pInst.runtimeType) {
      case LocTranslation _:
        var ltrans = pInst as LocTranslation;
        sid = "~${ltrans.textKey}|${ltrans.locale.languageCode}~";
      default:
        sid = "${pInst.localId}";
    }
    instances["$tname:$sid"] = pInst;
  }
}
