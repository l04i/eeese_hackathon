import 'package:eeese_hackathon/view/screens/auth/auth.dart';
import 'package:eeese_hackathon/view/screens/auth/login.dart';
import 'package:eeese_hackathon/view/screens/auth/profile_pic.dart';
import 'package:eeese_hackathon/view/screens/auth/signup.dart';
import 'package:eeese_hackathon/view/screens/events/events_screens.dart';
import 'package:get/get.dart';

class AppRouter {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String auth = '/auth';
  static const String profilepic = '/profile_picture';
  static const String events = '/events';

  static String getLogin() => login;
  static String getSignup() => signup;
  static String getAuth() => auth;
  static String getProfilePic() => profilepic;
  static String getEvents() => events;

  static List<GetPage> routs = [
    GetPage(name: login, page: (() => const LoginScreen())),
    GetPage(name: signup, page: (() => SignUpScreen())),
    GetPage(name: auth, page: (() => const AuthScreen())),
    GetPage(name: profilepic, page: (() => ProfilePictureScreen())),
    GetPage(name: events, page: (() => const EventsScreen())),
  ];
}
