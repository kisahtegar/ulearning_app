import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/base_text_widget.dart';

/// Showing app bar for settings page.
AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: reuseableText('Settings'),
    ),
  );
}

/// Used to display settings button (Logout button for now).
GestureDetector settingsButton(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm logout'),
            content: const Text('Confirm logout'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: func,
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            'assets/icons/Logout.png',
          ),
        ),
      ),
    ),
  );
}
