// Classe per a la gestió de cues LiFo.
// createdAt: 24/07/19 dv. JIQ

// ignore_for_file: unused_field

class LiFo<T> {
  // MEMBRES --------------------------
  final List<T> _list = <T>[];
  // CONSTRUCTORS ---------------------
  LiFo();

  // GESTIÓ DE LA CUA -----------------
  void push(T pItem) => _list.add(pItem);
  T? pop() => (_list.isEmpty) ? null : _list.removeLast();

  void sneak(T pItem) => _list.insert(0, pItem);
  T? heap() => _list.removeAt(0);
}
