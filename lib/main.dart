import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prof_ecommerce/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prof_ecommerce/data/repositories/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Add eodget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Getx local storage
  await GetStorage.init();

  // Await splash untill other item load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Intilize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}
