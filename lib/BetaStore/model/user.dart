import 'package:firebase_auth/firebase_auth.dart'; // Import this

class UserModel {
  String uid;
  String email;
  String username;
  String profilePicUrl;

  UserModel(
      {required this.uid,
      required this.email,
      required this.username,
      this.profilePicUrl = ''});

  // Convert Firebase user data into UserModel
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      username: '', // Additional information to be added later
    );
  }

  // Convert UserModel to map for saving to Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'profilePicUrl': profilePicUrl,
    };
  }
}
