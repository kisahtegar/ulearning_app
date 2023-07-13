import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding;

import 'common/service/storage_service.dart';
import 'firebase_options.dart';

class Global {
  static late StorageService storageService;

  /// Initialize firebase, widgets and storage service.
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    storageService = await StorageService().init();
  }
}
