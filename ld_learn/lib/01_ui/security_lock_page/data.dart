// createdAt: 24/07/18 dj. JIQ

// ignore_for_file: unnecessary_getters_setters

import 'package:ld_learn/08_model/album.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/09_tools/index.dart';

class SecurityLockPageData extends DeepDo {
  // MEMBRES --------------------------
  int? _counter;
  final _albums = <Album>[];

  // CONSTRUCTORS ---------------------
  SecurityLockPageData({Function(FiFo pQueue)? pOnAltered}) : super(pOnAltered);

  // GETTERS i SETTERS ----------------
  int? get counter => _counter;
  set counter(int? value) => _counter = value;

  List<Album> get albums => _albums;
  set addAlbum(Album pAlbum) => _albums.add(pAlbum);
}
