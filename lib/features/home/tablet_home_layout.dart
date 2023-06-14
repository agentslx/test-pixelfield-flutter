import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_assets.dart';
import '../../config/color_styles.dart';
import '../../widgets/tab_indicator.dart';
import '../project/ui/project_screen.dart';

class TabletHomeLayout extends StatefulWidget {
  final int selectedTab;
  final Function(int) onTabSelected;

  const TabletHomeLayout(
      {super.key, required this.selectedTab, required this.onTabSelected});

  @override
  State<TabletHomeLayout> createState() => _TabletHomeLayoutState();
}

class _TabletHomeLayoutState extends State<TabletHomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildNavRail(),
          Expanded(
            child: Builder(
              builder: (context) {
                switch (widget.selectedTab) {
                  case 0:
                    return const Text('Home');
                  case 1:
                    return const Text('Calendar');
                  case 2:
                    return const ProjectScreen();
                  default:
                    return const Text('Home');
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNavRail() {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.primaryGradientRev,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(color: Colors.black.withOpacity(0.7)),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: NavigationRail(
              backgroundColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              onDestinationSelected: widget.onTabSelected,
              destinations: [
                NavigationRailDestination(
                  icon: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: SvgPicture.asset(
                        AppAssets.iconMaps,
                        colorFilter: const ColorFilter.mode(
                            AppColors.lightSurface500, BlendMode.srcIn),
                      )),
                  selectedIcon: Column(
                    children: [
                      SvgPicture.asset(
                        AppAssets.iconMaps,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const CommonTabIndicator(
                        width: 40,
                      )
                    ],
                  ),
                  label: const Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: SvgPicture.asset(
                        AppAssets.iconCalendar,
                        colorFilter: const ColorFilter.mode(
                            AppColors.lightSurface500, BlendMode.srcIn),
                      )),
                  selectedIcon: Column(
                    children: [
                      SvgPicture.asset(
                        AppAssets.iconCalendar,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const CommonTabIndicator(
                        width: 40,
                      )
                    ],
                  ),
                  label: const Text('Calendar'),
                ),
                NavigationRailDestination(
                  icon: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: SvgPicture.asset(
                        AppAssets.iconProjects,
                        colorFilter: const ColorFilter.mode(
                            AppColors.lightSurface500, BlendMode.srcIn),
                      )),
                  selectedIcon: Column(
                    children: [
                      SvgPicture.asset(
                        AppAssets.iconProjects,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const CommonTabIndicator(
                        width: 40,
                      )
                    ],
                  ),
                  label: const Text('Calendar'),
                ),
              ], selectedIndex: widget.selectedTab),
        ),
      ],
    );
  }
}
