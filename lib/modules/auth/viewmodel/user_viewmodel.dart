import 'package:flutter/material.dart';
import '../../../models/user.dart';

class UserViewmodel extends ChangeNotifier {
  User? user;
  bool isLoading = true;

  Future<User?> getUserById(String id) async {
    // user = await instance<UserService>().getUserById(id);
    isLoading = false;
    notifyListeners();
    return user;
  }

  Future<User?> updateUser(String id, String name) async {
    user = user!.copyWith(username: name);
    // await instance<UserService>().update(id, user!);
    notifyListeners();
    return user;
  }

  Future<int> deleteUser() async {
    // int result = await instance<AuthService>().deleteUserAccount();
    // if (result == 1) {
    //   user = null;
    //   notifyListeners();
    //   return 1;
    // } else if (result == 2) {
    //   return 2;
    // } else {
    //   return 0;
    // }
    return 0;
  }
}
