import 'package:flutter/material.dart';
import 'package:test_pixelfield_flutter/features/home/mobile_home_layout.dart';

import '../../utils/device_utils.dart';
import 'tablet_home_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 2; // Default to Projects tab

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (DeviceUtils.isMobile(context)) {
        // Mobile
        return MobileHomeLayout(
          selectedTab: selectedTab,
          onTabSelected: (tab) {
            setState(() {
              selectedTab = tab;
            });
          },
        );
      }
      // Tablet
      return TabletHomeLayout(
        selectedTab: selectedTab,
        onTabSelected: (tab) {
          setState(() {
            selectedTab = tab;
          });
        },
      );
    });
  }
}
