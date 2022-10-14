import 'dart:convert';

class Committee {
  String name;
  String picUrl;
  String text;
  Committee({
    required this.name,
    required this.picUrl,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'picUrl': picUrl,
      'text': text,
    };
  }

  factory Committee.fromMap(Map<String, dynamic> map) {
    return Committee(
      name: map['name'],
      picUrl: map['picUrl'],
      text: map['text'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Committee.fromJson(String source) =>
      Committee.fromMap(json.decode(source));
}
