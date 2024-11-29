import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/user_service.dart';
import 'package:home_ful/models/user.dart' as u;

class AuthViewModel extends ChangeNotifier {
  AuthViewModel();

  bool isLoading = false;
  String? email;
  String? password;
  String? username;
  DateTime? birthday;
  String? gender;
  String? profileImage;

  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  /// Setters for each step
  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }

  void setNameAndBirthday(String name, DateTime birthday, String gender) {
    this.username = name;
    this.birthday = birthday;
    this.gender = gender;
  }

  void setProfileImage(String profileImage) {
    this.profileImage = profileImage;
  }

  /// Final method to handle sign-up after all data is collected
  Future<User?> signUp() async {
    if (email == null ||
        password == null ||
        username == null ||
        birthday == null ||
        gender == null ||
        profileImage == null) {
      throw Exception("All fields must be filled before signing up");
    }

    isLoading = true;
    notifyListeners();

    try {
      User? firebaseUser =
          await _authService.signUpWithEmailAndPassword(email!, password!);

      if (firebaseUser != null) {
        // Create UserModel object
        u.User userData = u.User(
          username: username,
          email: email,
          birthday: birthday,
          gender: gender,
          profileImage: profileImage,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: firebaseUser.uid,
        );

        // Save additional data to Firestore
        await _userService.createUser(firebaseUser.uid, userData);
        isLoading = false;
        notifyListeners();
        return firebaseUser;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      throw Exception("Sign-up failed: $e");
    }

    isLoading = false;
    notifyListeners();
    return null;
  }

  Future<User?> signIn(String email, String pass) async {
    isLoading = true;
    notifyListeners();
    User? user = await _authService.signInWithEmailAndPassword(email, pass);
    isLoading = false;
    notifyListeners();
    return user;
  }

  Future<String?> resetPassword(String email) async {
    isLoading = true;
    notifyListeners();
    String? message = await _authService.sendPasswordResetEmail(email);
    isLoading = false;
    notifyListeners();
    return message;
  }

  void signOut() {
    _authService.signOut();
  }
}
