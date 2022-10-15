import 'dart:convert';

class Event {
  String name;
  DateTime dateTime;
  String description;
  String maxAttendance;
  String currentAttendance;
  String category;
  String picUrl;
  bool isUpcoming;
  String department;
  Event({
    required this.name,
    required this.dateTime,
    required this.description,
    required this.maxAttendance,
    required this.currentAttendance,
    required this.category,
    required this.picUrl,
    required this.isUpcoming,
    required this.department,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'description': description,
      'maxAttendance': maxAttendance,
      'currentAttendance': currentAttendance,
      'category': category,
      'picUrl': picUrl,
      'isUpcoming': isUpcoming,
      'department': department,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      name: map['name'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      description: map['description'],
      maxAttendance: map['maxAttendance'],
      currentAttendance: map['currentAttendance'],
      category: map['category'],
      picUrl: map['picUrl'],
      isUpcoming: map['isUpcoming'] ?? false,
      department: map['department'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));
}
