import 'dart:convert';
import 'dart:core';

class User {
  String id;
  String username;
  String email;
  String department;
  String year;
  String profilePic;
  bool isAdmin;
  String uniNumber;
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.department,
    required this.year,
    required this.profilePic,
    required this.isAdmin,
    required this.uniNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'department': department,
      'batch': year,
      'profilePic': profilePic,
      'isAdmin': isAdmin,
      'uniNumber': uniNumber,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      department: map['department'],
      year: map['batch'],
      profilePic: map['profilePic'],
      isAdmin: map['isAdmin'] ?? false,
      uniNumber: map['uniNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
