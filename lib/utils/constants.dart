import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// constants that used throughout the app

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference firestoreUserRefrence = firestore.collection('users');
FirebaseStorage fireStorage = FirebaseStorage.instance;
