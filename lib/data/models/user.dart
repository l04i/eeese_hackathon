import 'dart:convert';
import 'dart:core';

class User {
  String id;
  String name;
  String username;
  String email;
  String department;
  String batch;
  String profilePic;
  bool? isAdmin;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.department,
    required this.batch,
    required this.profilePic,
    this.isAdmin,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'department': department,
      'batch': batch,
      'profilePic': profilePic,
      'isAdmin': isAdmin,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      department: map['department'],
      batch: map['batch'],
      profilePic: map['profilePic'],
      isAdmin: map['isAdmin'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
