import 'package:flutter/material.dart';

import 'bootstrap.dart';
import 'core/config/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  bootstrap(() => const MyApp());
}
