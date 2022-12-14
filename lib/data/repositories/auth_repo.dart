import 'package:eeese_hackathon/data/models/user.dart' as usr;
import 'package:eeese_hackathon/routes/app_router.dart';
import 'package:eeese_hackathon/utils/constants.dart';
import 'package:eeese_hackathon/view/widgets/show_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class AuthRepository {
  Future<Map<String, String>> getUserInfo();
  Future<void> signUp(usr.User user, String password);
  Future<void> signIn({required String email, required String password});
  Future<void> signOut();
}

class FirebaseAuthRepository extends AuthRepository {
  @override
  Future<Map<String, String>> getUserInfo() async {
    final String uid = auth.currentUser!.uid;
    var snap = await firestore.collection("users").doc(uid).get();
    var snapshot = snap.data();
    return {
      'username': snapshot!['username'],
      'email': snapshot['email'],
      'uniNumber': snapshot['uniNumber'],
    };
  }

  @override
  Future<void> signUp(usr.User user, String password) async {
    try {
      // Firebase Create User
      showLoading();

      await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      // Create user document
      final uuid = auth.currentUser!.uid;
      await firestoreUserRefrence.doc(uuid).get().then((userDoc) {
        user.id = uuid;

        firestoreUserRefrence.doc(uuid).set(user.toMap());

        Get.offAllNamed(AppRouter.getHome());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.back();
        showSnackBar(
            title: 'Error', message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.back();

        showSnackBar(
            title: 'Error',
            message: 'The account already exists for that email.');
      }
    } catch (e) {
      Get.back();

      showSnackBar(title: 'Error', message: 'Something went wrong!');
    }
  }

  // Sign In

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      showLoading();

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(AppRouter.getHome());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.back();

        showSnackBar(title: 'Error', message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.back();

        showSnackBar(
            title: 'Error', message: 'Wrong password provided for that user.');
      }
    }
  }

  // Sign Out

  @override
  Future<void> signOut() async {
    showLoading();
    await auth.signOut();
    Get.offAllNamed('/login');
  }
}
