import 'package:delente_assignment/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    signInOption: SignInOption.standard,
  );

  Future<UserModel?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) return null; // User cancelled the sign-in

      final googleSignInAuth = await account.authentication;

      // Create a new credential for Firebase authentication
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuth.accessToken,
        idToken: googleSignInAuth.idToken,
      );

      // Sign in to Firebase with the Google credentials
      final userCredential = await _auth.signInWithCredential(credential);
     //return getCurrentUser();
      final user = userCredential.user;
      if (user != null) {
        return UserModel(
          name: user.displayName ?? '',
          email: user.email ?? '',
          profilePicture: user.photoURL ?? '',
        );
      }
    } catch (e) {
      print('Google Sign-In Error: $e');
    }
    return null;
  }

  Future<UserModel?> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final credential =
            FacebookAuthProvider.credential(result.accessToken!.tokenString);
        final userCredential = await _auth.signInWithCredential(credential);

        final user = userCredential.user;
        if (user != null) {
          return UserModel(
            name: user.displayName ?? '',
            email: user.email ?? '',
            profilePicture: user.photoURL ?? '',
          );
        }
      }
    } catch (e) {
      print('Facebook Sign-In Error: $e');
    }
    return null;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
    await _auth.signOut();
  }
}
