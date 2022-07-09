import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginService {
  Future<bool> postLogin({required userName, required password});
}

class LoginService extends ILoginService {
  @override
  Future<bool> postLogin({required userName, required password}) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: '$userName@testapartmentmanagement.com', password: password);
      if (result.user != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }
}
