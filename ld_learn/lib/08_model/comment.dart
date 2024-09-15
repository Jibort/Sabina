// Representació d'un comentari descarregat d'Internet.
// createdAt. 24/07/18 dv. JIQ

// Representació del comentari d'un àlbum.
class Comment {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  Comment.empty() {
    postId = null;
    id = null;
    name = null;
    email = null;
    body = null;
  }

  @override
  String toString() {
    return "COMMENT = id: $id, postId: $postId, name: '$name'"; // , email: '$email', body: '$body'";
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'postId': int postId,
        'id': int id,
        'name': String name,
        'email': String email,
        'body': String body,
      } =>
        Comment(
          postId: postId,
          id: id,
          name: name,
          email: email,
          body: body,
        ),
      _ => throw const FormatException('Failed to load comment.'),
    };
  }
}
