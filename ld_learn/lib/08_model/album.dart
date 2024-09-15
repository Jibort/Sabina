// Representació d'un Àlbum descarregat d'Internet.
// createdAt: 24/07/19 dv. JIQ

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ld_learn/01_ui/load_steps.dart';

import 'package:ld_learn/08_model/comment.dart';
import 'package:ld_learn/01_ui/widgets/index.dart';
import 'package:ld_learn/09_tools/index.dart';

const String httpAlbum = 'https://jsonplaceholder.typicode.com/albums';
const String httpComments = 'https://jsonplaceholder.typicode.com/comments';

class Album {
  // MEMBERS --------------------------
  int? userId;
  int? id;
  String? title;
  Comment? comment;

  // CONSTRUCTORS ---------------------
  Album({
    required this.userId,
    required this.id,
    required this.title,
    required this.comment,
  });

  Album.empty() {
    userId = null;
    id = null;
    title = null;
    comment = null;
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
        // 'comment': Comment comment,
      } =>
        Album(
          userId: userId,
          id: id,
          title: title,
          comment: null,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }

  // REPREENTACIÓ EN STRING -----------
  @override
  String toString() {
    return "ALBUM = id: $id, userId: $userId, title: '$title' comment: '${comment?.body}'";
  }

  // CARREGA DEL COMENTARI DE L'ÀLBUM -
  void loadComment({required BaseController pCtrl, required DeepDo pData}) {
    LoadStep step;

    // Encua la càrrega del HTTP Comentari associat .....
    step = LoadStep(pIdx: "03.$id.02.01.", pTitle: "Càrrega del HTTP Comentari associat");
    pData.sneakFn((FiFo pQueue, List<dynamic> pArgs, {int? loadCommentHttp}) async {
      if (pArgs.isEmpty) throw "Falta un paràmetre per a la crida!!";
      var alb = pArgs.first as Album;
      var hresp = await http.get(Uri.parse('$httpComments/${alb.id}'));

      // Encua la interpretació de la resposta Http .....
      LoadStep step2 = LoadStep(
          pIdx: "03.$id.02.02.", pTitle: "Interpretació de la resposta HttpComentari associat");
      pData.sneakFn((FiFo pQueue, List<dynamic> pArgs, {int? buildCommentMap}) async {
        if (pArgs.isEmpty) throw "Falta un paràmetre per a la crida!!";
        var hresp = pArgs.first as http.Response;
        Map<String, dynamic> map = jsonDecode(hresp.body);

        // Encua la creació del comentari i assignació a l'àlbum .....
        LoadStep step3 =
            LoadStep(pIdx: "03.$id.02.03.", pTitle: "Creació del comentari i assignació a l'àlbum");

        pData.sneakFn((FiFo pQueue, List<dynamic> pArgs, {int? buildComment}) async {
          if (pArgs.isEmpty) throw "Falta un paràmetre per a la crida!!";
          var map = pArgs.first as Map<String, dynamic>;
          comment = Comment.fromJson(map);
          pCtrl.notify();
          return null;
        }, pArgs: [map], pLoadStep: step3);
        pCtrl.notify();
        return null;
      }, pArgs: [hresp], pLoadStep: step2);
      pCtrl.notify();
      return null;
    }, pArgs: [this], pLoadStep: step);
    pCtrl.notify();
  }
}
