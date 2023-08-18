import 'package:firebase_auth/firebase_auth.dart';

class AuthParamsApi {
  AuthParamsApi({this.email, this.password, this.phonenumber});
  String? email;
  String? password;
  String? phonenumber;
}

class FirebaseAuthentication {
  static Future<bool> loginGmail(AuthParamsApi? paramsApi) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: paramsApi!.email!, password: paramsApi.password!);
      if (credential.user != null) {
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }
}
