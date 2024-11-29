import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_ful/core/config/di.dart';
import 'package:home_ful/core/constants/constants.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Add cross-flavor configuration here

  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Palette.white,
      statusBarColor: Palette.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initLocator();
  runApp(await builder());
}
