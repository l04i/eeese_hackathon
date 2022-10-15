import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eeese_hackathon/helper/dependencies.dart';
import 'package:get/get.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class HomeController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> getEvents(
          {required bool isUpcoming}) =>
      eventsRepo.getEventsByTime(isUpcoming: isUpcoming);
}
