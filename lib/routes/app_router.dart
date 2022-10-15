import 'package:eeese_hackathon/view/screens/auth/auth.dart';
import 'package:eeese_hackathon/view/screens/auth/login.dart';
import 'package:eeese_hackathon/view/screens/auth/profile_pic.dart';
import 'package:eeese_hackathon/view/screens/auth/signup.dart';
import 'package:eeese_hackathon/view/screens/home/home.dart';
import 'package:get/get.dart';

class AppRouter {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String profilepic = '/profile_picture';

  static String getLogin() => login;
  static String getSignup() => signup;
  static String getAuth() => auth;
  static String getHome() => home;
  static String getProfilePic() => profilepic;

  static List<GetPage> routs = [
    GetPage(name: login, page: (() => const LoginScreen())),
    GetPage(name: signup, page: (() => SignUpScreen())),
    GetPage(name: home, page: (() => HomeScreen())),
    GetPage(name: auth, page: (() => const AuthScreen())),
    GetPage(name: profilepic, page: (() => ProfilePictureScreen())),
  ];
}
