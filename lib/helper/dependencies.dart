import 'package:eeese_hackathon/data/repositories/auth_repo.dart';
import 'package:eeese_hackathon/data/repositories/storage_repo.dart';
import 'package:firebase_core/firebase_core.dart';

late FirebaseStorageRepository storageRepository;
late FirebaseAuthRepository authRepository;

Future<void> init() async {
  await Firebase.initializeApp();
  storageRepository = FirebaseStorageRepository();
  authRepository = FirebaseAuthRepository();
}