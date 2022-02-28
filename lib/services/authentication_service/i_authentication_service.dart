import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthenticationService {
  /// [Future]<[void]> Signs in a user anonmously
  /// 
  /// Parameters: null
  Future<void> signInAnonymously();


  /// [Future]<[void]> Signs the currently logged in user out of the app
  /// 
  /// Parameters: null
  Future<void> logOut();

  // returns the details of the current user
  User? get currentUser;
}
