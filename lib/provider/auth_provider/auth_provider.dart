import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;
  String? _userId;
  bool _isOtpSent = false;
  EmailOTP myAuth = EmailOTP();

  bool get isLoading => _isLoading;

  bool get isOtpSent => _isOtpSent;

  String? get userId => _userId;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setOtpSent(bool value) {
    _isOtpSent = value;
    notifyListeners();
  }

  // Sign up with Email and send OTP
  Future<bool> signUp(String email) async {
    try {
      _setLoading(true);

      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: generateTemporaryPassword(),
      );
      _userId = result.user?.uid;

      // Configure EmailOTP instance
      EmailOTP.config(
          appName: 'FoodSter',
          otpType: OTPType.numeric,
          // expiry: 30000,
          emailTheme: EmailTheme.v6,
          appEmail: 'jerrykhan940@gmail.com',
          otpLength: 6);

      bool sent = await EmailOTP.sendOTP(email: email);
      _setOtpSent(sent);
      _setLoading(false);

      return sent;
    } catch (e) {
      print("Error during sign up: $e");
      _setLoading(false);
      return false;
    }
  }

  // Verify OTP
  Future<bool> verifyOTP(String code, String email) async {
    try {
      _setLoading(true);

      bool isVerified = await EmailOTP.verifyOTP(otp: code);
      if (isVerified && _userId != null) {
        await _firestore.collection('users').doc(_userId).set({
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      _setLoading(false);

      return isVerified;
    } catch (e) {
      print("Error during OTP verification: $e");
      _setLoading(false);
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      _setLoading(true);
      print("Attempting Sign out...");
      await _auth.signOut();
    } catch (e) {
      print("Error during sign out: $e");
    } finally {
      _setLoading(false);
    }
  }

  // Generate temporary password
  String generateTemporaryPassword() {
    const String chars =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    return List.generate(
        12, (index) => chars[Random.secure().nextInt(chars.length)]).join();
  }
}
