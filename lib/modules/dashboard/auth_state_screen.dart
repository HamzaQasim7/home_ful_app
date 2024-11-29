import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/signin_screen.dart';
import '../auth/viewmodel/auth_viewmodel.dart';

class AuthStateScreen extends StatelessWidget {
  const AuthStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        // stream: instance<AuthService>().authStateChanges,
        stream: null,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null) {
            return Container();
          } else {
            return ChangeNotifierProvider(
                create: (_) => AuthViewModel(), child: const SigninScreen());
          }
        });
  }
}
