import 'dart:io';
import 'package:eeese_hackathon/utils/constants.dart';
import 'package:eeese_hackathon/view/widgets/show_loading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

abstract class StorageRepository {
  Future<String> uploadImageToStorage(
      {required String childName, required File file, required bool isEvent});
}

class FirebaseStorageRepository extends StorageRepository {
  //upload a picture to the sotarage works for both profile and events pages
  @override
  Future<String> uploadImageToStorage(
      {required String childName,
      required File file,
      required bool isEvent}) async {
    try {
      showLoading();
      Reference ref = FirebaseStorage.instance
          .ref()
          .child(childName)
          .child(auth.currentUser!.uid);

      if (isEvent) {
        String id = const Uuid().v1();

        ref = ref.child(id);
      }

      UploadTask uploadTask = ref.putFile(file);
      await uploadTask;
      Get.back();
      return await ref.getDownloadURL();
    } catch (e) {
      Get.back();

      showSnackBar(
          title: 'Something went Wrong!', message: "Couldn't upload picture");

      return "";
    }
  }
}
