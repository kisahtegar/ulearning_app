import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding;

import 'common/routes/bloc_observer.dart';
import 'common/service/storage_service.dart';
import 'firebase_options.dart';

/// A class containing global configurations and services used by the Ulearning App.
class Global {
  /// A reference to the storage service used for data persistence.
  static late StorageService storageService;

  /// Initializes Firebase, Flutter widgets, and the storage service.
  ///
  /// This method ensures that Firebase is initialized, sets up a custom Bloc observer,
  /// and initializes the storage service for data persistence.
  ///
  /// It should be called at the beginning of the app's execution.
  static Future<void> init() async {
    // Ensure that Flutter widgets are initialized.
    WidgetsFlutterBinding.ensureInitialized();

    // Set a custom Bloc observer for logging Bloc state transitions.
    Bloc.observer = MyGlobalObserver();

    // Initialize Firebase with the default options for the current platform.
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Initialize the storage service and assign it to the storageService variable.
    storageService = await StorageService().init();
  }
}
