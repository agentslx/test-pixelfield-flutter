

import 'package:flutter/material.dart';

class DeviceUtils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }
}