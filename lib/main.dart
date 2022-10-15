import 'package:eeese_hackathon/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eeese_hackathon/helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Quicksandmed'),
      getPages: AppRouter.routs,
      initialRoute: AppRouter.getAuth(),
    );
  }
}
