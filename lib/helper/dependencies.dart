import 'package:eeese_hackathon/controllers/auth_controller.dart';
import 'package:eeese_hackathon/data/repositories/auth_repo.dart';
import 'package:eeese_hackathon/data/repositories/storage_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../data/repositories/events_repo.dart';

late FirebaseStorageRepository storageRepository;
late FirebaseAuthRepository authRepository;
late FirebaseEventsRepo eventsRepo;

// used to initilize needed controllers and repos
Future<void> init() async {
  await Firebase.initializeApp();
  storageRepository = FirebaseStorageRepository();
  authRepository = FirebaseAuthRepository();
  eventsRepo = FirebaseEventsRepo();
  Get.lazyPut(() => AuthController());
}
