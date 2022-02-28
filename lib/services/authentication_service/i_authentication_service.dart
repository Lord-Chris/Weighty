import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthenticationService {
  Future<void> signInAnonymously();
  Future<void> logOut();
  User? get currentUser;
}
