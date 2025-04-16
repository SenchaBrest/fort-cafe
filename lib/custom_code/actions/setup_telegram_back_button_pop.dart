// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:telegram_web_app/telegram_web_app.dart';

Future setupTelegramBackButtonPop(BuildContext context) async {
  final backButton = TelegramWebApp.instance.backButton;

  backButton.show();

  backButton.onClick(() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    final route = ModalRoute.of(context);
    if (route == null || !route.isCurrent) {
      backButton.hide();
    }
  });
}
