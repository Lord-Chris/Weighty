import 'package:firebase_auth/firebase_auth.dart';

import 'i_authentication_service.dart';

class AuthenticationService implements IAuthenticationService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> signInAnonymously() async {
    await _auth.signInAnonymously();
  }

  @override
  Future<void> logOut() async {
    await _auth.signOut();
  }

  @override
  User? get currentUser => _auth.currentUser;
}
