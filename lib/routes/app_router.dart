import 'package:eeese_hackathon/controllers/auth_controller.dart';
import 'package:eeese_hackathon/view/screens/auth/auth.dart';
import 'package:eeese_hackathon/view/screens/auth/login.dart';
import 'package:eeese_hackathon/view/screens/auth/profile_pic.dart';
import 'package:eeese_hackathon/view/screens/auth/signup.dart';
import 'package:eeese_hackathon/view/screens/committees_screen.dart';
import 'package:eeese_hackathon/view/screens/events/add_event_screen.dart';
import 'package:eeese_hackathon/view/screens/events/events_screens.dart';
import 'package:eeese_hackathon/view/screens/onboarding_screen.dart';
import 'package:eeese_hackathon/view/screens/home/home.dart';
import 'package:eeese_hackathon/view/screens/splash_screen.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class AppRouter {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String profilepic = '/profile_picture';
  static const String events = '/events';
  static const String onboarding = '/onboarding';
  static const String committees = '/committees';
  static const String splash = '/splash';
  static const String addEvent = '/add_event';

  static String getLogin() => login;
  static String getSignup() => signup;
  static String getAuth() => auth;
  static String getHome() => home;
  static String getProfilePic() => profilepic;
  static String getEvents() => events;
  static String getOnboarding() => onboarding;
  static String getCommittees() => committees;
  static String getSplash() => splash;
  static String getAddEvent() => addEvent;

  static List<GetPage> routs = [
    GetPage(
        name: login,
        binding: AuthScreensBinding(),
        page: (() => LoginScreen())),
    GetPage(
        name: signup,
        binding: AuthScreensBinding(),
        page: (() => SignUpScreen())),
    GetPage(
        name: home,
        binding: HomeControllerBinding(),
        page: (() => const HomeScreen())),
    GetPage(name: auth, page: (() => const AuthScreen())),
    GetPage(
        name: profilepic,
        binding: AuthScreensBinding(),
        page: (() => const ProfilePictureScreen())),
    GetPage(name: onboarding, page: (() => const OnboardingScreen())),
    GetPage(name: committees, page: (() => const CommitteesScreen())),
    GetPage(name: splash, page: (() => const SplashScreen())),
    GetPage(name: addEvent, page: (() => const AddEventScreen())),
  ];
}
