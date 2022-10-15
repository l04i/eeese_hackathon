import 'package:eeese_hackathon/view/screens/auth/auth.dart';
import 'package:eeese_hackathon/view/screens/auth/login.dart';
import 'package:eeese_hackathon/view/screens/auth/profile_pic.dart';
import 'package:eeese_hackathon/view/screens/auth/signup.dart';
import 'package:eeese_hackathon/view/screens/events/events_screens.dart';
import 'package:eeese_hackathon/view/screens/onboarding_screen.dart';
import 'package:get/get.dart';

class AppRouter {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String auth = '/auth';
  static const String profilepic = '/profile_picture';
  static const String events = '/events';
  static const String onboarding = '/onboarding';

  static String getLogin() => login;
  static String getSignup() => signup;
  static String getAuth() => auth;
  static String getProfilePic() => profilepic;
  static String getEvents() => events;
  static String getOnboarding() => onboarding;

  static List<GetPage> routs = [
    GetPage(name: login, page: (() => const LoginScreen())),
    GetPage(name: signup, page: (() => SignUpScreen())),
    GetPage(name: auth, page: (() => const AuthScreen())),
    GetPage(name: profilepic, page: (() => const ProfilePictureScreen())),
    GetPage(name: events, page: (() => const EventsScreen())),
    GetPage(name: onboarding, page: (() => const OnboardingScreen())),
  ];
}
