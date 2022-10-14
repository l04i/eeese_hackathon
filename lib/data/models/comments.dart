import 'dart:convert';

class Comment {
  String id;
  String userId;
  String text;
  Comment({
    required this.id,
    required this.userId,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'text': text,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'],
      userId: map['userId'],
      text: map['text'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));
}
