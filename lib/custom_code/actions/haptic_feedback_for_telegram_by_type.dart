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

Future hapticFeedbackForTelegramByType(String type) async {
  final hapticFeedback = TelegramWebApp.instance.hapticFeedback;

  switch (type.toLowerCase()) {
    case 'impact_light':
      hapticFeedback.impactOccurred(HapticFeedbackImpact.light);
      break;
    case 'impact_medium':
      hapticFeedback.impactOccurred(HapticFeedbackImpact.medium);
      break;
    case 'impact_heavy':
      hapticFeedback.impactOccurred(HapticFeedbackImpact.heavy);
      break;
    case 'impact_rigid':
      hapticFeedback.impactOccurred(HapticFeedbackImpact.rigid);
      break;
    case 'impact_soft':
      hapticFeedback.impactOccurred(HapticFeedbackImpact.soft);
      break;
    case 'notification_error':
      hapticFeedback.notificationOccurred(HapticFeedbackNotificationType.error);
      break;
    case 'notification_success':
      hapticFeedback
          .notificationOccurred(HapticFeedbackNotificationType.success);
      break;
    case 'notification_warning':
      hapticFeedback
          .notificationOccurred(HapticFeedbackNotificationType.warning);
      break;
    case 'selection':
      hapticFeedback.selectionChanged();
      break;
    default:
      debugPrint('Unknown haptic feedback type: $type');
  }
}
