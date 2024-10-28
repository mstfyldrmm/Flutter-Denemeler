import 'package:firebase/news_turkish/service/auth/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService with ChangeNotifier implements IAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password); 
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message as Object);
    }
  }

  @override
  Future<User?> signUp(String email, String password) async {
    // TODO: implement signUp
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password); 
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message as Object);
    }
  }

  Future<User?> signWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;
      final credential = GoogleAuthProvider.credential(accessToken: gAuth.accessToken, idToken: gAuth.idToken);
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user; 

    } on FirebaseAuthException catch (e) {
      return Future.error(e.message as Object);
    }
  }
}