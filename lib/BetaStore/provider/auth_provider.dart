import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// FirebaseAuth instance provider
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// Authentication State provider (Tracks current logged-in user)
final authStateProvider = StreamProvider<User?>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return auth.authStateChanges(); // Firebase's stream to monitor auth changes
});

////////
// login function
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return AuthRepository(auth);
});

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

  // Sign in with email and password
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Login Error: $e');
      return null;
    }
  }

  // Register with email and password
  Future<User?> registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Registration Error: $e');
      return null;
    }
  }

// Returns the currently signed-in user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

// Get the current user's UID
  String? getUserUID() {
    return _firebaseAuth.currentUser?.uid;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
