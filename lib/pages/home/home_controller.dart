import 'package:flutter/material.dart';

import '../../common/entities/entities.dart';
import '../../global.dart';

/// Implement Home controller class.
class HomeController {
  final BuildContext context;
  HomeController({required this.context});
  // Getting user profile from local storage data.
  UserItem? userProfile = Global.storageService.getUserProfile();

  /// Initialize our home controller.
  void init() {
    debugPrint('...Home controller init method...');
  }
}
