import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum UserStatus { authenticated, unauthenticated, unknown }

class UserRepository {
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    ).signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    return FirebaseAuth.instance.currentUser;
  }

  Future<User> signOutWithGoogle() async {
    await FirebaseAuth.instance.signOut();

    return FirebaseAuth.instance.currentUser;
  }

  Future<bool> isSignedIn() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    print("UserRepository: $currentUser");

    return currentUser != null;
  }

  User getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<UserStatus> getUserStatus() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return UserStatus.unknown;
    } else {
      return UserStatus.authenticated;
    }
  }
}
