import 'package:flutter/material.dart';

class ThemeUtils {
  static Color getShimmerColor(BuildContext context, Color defaultColor) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? defaultColor
        : defaultColor.withOpacity(0.3);
  }

  static Color getHighlightColor(BuildContext context, Color defaultColor) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? defaultColor
        : defaultColor.withOpacity(0.5);
  }

  static Color getBackgroundColor(BuildContext context, Color defaultColor) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? defaultColor
        : defaultColor.withOpacity(0.2);
  }
}
