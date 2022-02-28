import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final _auth = FirebaseAuth.instance;

  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;
}
