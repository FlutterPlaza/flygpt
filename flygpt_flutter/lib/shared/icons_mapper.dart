import 'dart:math';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

extension PhosphorIconDataExtension on String {
//   // Method to deserialize a string to PhosphorIconData
//   PhosphorIconData get toPhosphorIconData {
//     final parts = split(':');
//     if (parts.length != 2) {
//       // Return null if the string is not in the correct format
//       return PhosphorIcons.questionMark();
//     }
//
//     try {
//       // Parse the codePoint from the first part (hexadecimal)
//       final int codePoint = int.parse(parts[0], radix: 16);
//       // The second part is the style
//       final String style = parts[1];
//
//       // Create and return the PhosphorIconData
//       return PhosphorIconData(codePoint, style);
//     } catch (e) {
//       // Return null if parsing fails
//       return PhosphorIcons.questionMark();
//     }
//   }
//
  IconData get toRandomPhosphorIconData {
    int value = int.tryParse(this) ?? 0;
    final icons = mdiIcons;
    return mdiIcons[value % icons.length];
  }
}

// extension IconDataExtension on PhosphorIconData {
//   // Method to serialize PhosphorIconData to a string
//   String serialize() {
//     return '${codePoint.toRadixString(16)}:${fontFamily!.replaceFirst('Phosphor', '')}';
//   }
// }

final mdiIcons = [
  Icons.ac_unit,
  Icons.access_alarm,
  Icons.access_time,
  Icons.account_circle,
  Icons.add,
  Icons.arrow_back,
  Icons.arrow_forward,
  Icons.assessment,
  Icons.bookmark,
  Icons.brightness_6,
  // Add any other icons you want to include
];
