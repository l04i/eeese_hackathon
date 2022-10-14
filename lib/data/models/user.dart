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
  bool isAdmin;
  String uniNumber;
  String location;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.department,
    required this.batch,
    required this.profilePic,
    required this.isAdmin,
    required this.uniNumber,
    required this.location,
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
      'uniNumber': uniNumber,
      'location': location,
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
      isAdmin: map['isAdmin'] ?? false,
      uniNumber: map['uniNumber'],
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
