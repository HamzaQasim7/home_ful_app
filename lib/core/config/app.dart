import 'package:flutter/material.dart';
import 'package:home_ful/modules/auth/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider/auth_provider.dart';
import '../constants/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        title: Strings.appName,
        theme: getApplicationTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        // home: const SignUpScreen(),
      ),
    );
  }
}
