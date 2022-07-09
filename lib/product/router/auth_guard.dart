import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:managementexample/product/router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final credential = FirebaseAuth.instance.currentUser;

    if (credential != null) {
      print('User is signed in!');
      resolver.next(true);
    } else {
      print('User is currently signed out!');
      router.push(const LoginRoute());
    }
  }
}
