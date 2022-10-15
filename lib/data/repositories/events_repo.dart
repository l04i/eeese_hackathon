import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eeese_hackathon/data/models/event.dart';
import 'package:eeese_hackathon/utils/constants.dart';

abstract class EventsRepo {
  Stream<QuerySnapshot<Map<String, dynamic>>> getEventsByCategory(
      String category);
  Stream<QuerySnapshot<Map<String, dynamic>>> getEventsByTime(
      {required bool isUpcoming});
  Future<void> addEvent(Event event);
}

class FirebaseEventsRepo extends EventsRepo {
  String collection = "events";
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getEventsByCategory(
      String category) {
    return firestore
        .collection(collection)
        .where('category', isEqualTo: category)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getEventsByTime(
      {required bool isUpcoming}) {
    return firestore
        .collection(collection)
        .where('isUpcoming', isEqualTo: isUpcoming)
        .snapshots();
  }

  @override
  Future<void> addEvent(Event event) async {}
}
