import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:managementexample/core/constants/application_constants.dart';
import 'package:managementexample/firebase_options.dart';
import 'package:managementexample/product/router/app_router.dart';
import 'package:managementexample/product/service/locator.dart';

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
}

Future<void> main() async {
  await _init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = getIt<AppRouter>();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: ApplicationConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
