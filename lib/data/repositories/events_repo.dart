import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eeese_hackathon/data/models/event.dart';
import 'package:eeese_hackathon/utils/constants.dart';
import 'package:uuid/uuid.dart';

abstract class EventsRepo {
  Stream<QuerySnapshot<Map<String, dynamic>>> getEventsByCategory(
      String category);
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

//adds an event to firestore
  @override
  Future<void> addEvent(Event event) async {
    firestoreUserRefrence.doc(Uuid().v4()).set(event.toMap());
  }
}
