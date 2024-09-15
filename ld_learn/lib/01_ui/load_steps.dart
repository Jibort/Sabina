// Representació de les tasques a dur a terme abans de
// donar una pàgina per acabada.
// createdAt: 24/07/28 dg. JIQ

class LoadSteps {
  // MEMBRES --------------------------
  final _steps = <LoadStep>[];

  // CONSTRUCTORS ---------------------
  LoadSteps();

  // GETTERS i SETTERS ----------------
  LoadStep? get next => (_steps.isNotEmpty) ? _steps.removeAt(0) : null;
  LoadStep? byIndex(String pIndex) =>
      (_steps.where((LoadStep pStep) => pStep._index == pIndex).firstOrNull);
  void append(LoadStep pLoadStep) => _steps.add(pLoadStep);
}

// Definició d'un LoadStep.
class LoadStep {
  // MEMBRES -------------------------
  final String _index;
  final String _title;
  final String? _description;

  // CONSTRUCTORS --------------------
  LoadStep({required String pIdx, required String pTitle, String? pDesc})
      : _index = pIdx,
        _title = pTitle,
        _description = pDesc;

  // GETTERS i SETTERS ---------------
  String get index => _index;
  String get title => _title;
  String? get description => _description;
}
