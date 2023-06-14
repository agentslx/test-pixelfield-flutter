import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_pixelfield_flutter/config/app_assets.dart';
import 'package:test_pixelfield_flutter/config/color_styles.dart';
import 'package:test_pixelfield_flutter/features/project/ui/project_screen.dart';
import 'package:test_pixelfield_flutter/widgets/tab_indicator.dart';

class MobileHomeLayout extends StatefulWidget {
  final int selectedTab;
  final Function(int) onTabSelected;

  const MobileHomeLayout(
      {super.key, required this.selectedTab, required this.onTabSelected});

  @override
  State<MobileHomeLayout> createState() => _MobileHomeLayoutState();
}

class _MobileHomeLayoutState extends State<MobileHomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
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
      bottomNavigationBar: Stack(
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
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: SvgPicture.asset(
                        AppAssets.iconMaps,
                        colorFilter: const ColorFilter.mode(
                            AppColors.lightSurface500, BlendMode.srcIn),
                      )),
                  activeIcon: Column(
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
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: SvgPicture.asset(
                        AppAssets.iconCalendar,
                        colorFilter: const ColorFilter.mode(
                            AppColors.lightSurface500, BlendMode.srcIn),
                      )),
                  activeIcon: Column(
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
                  label: "Calendar"),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: SvgPicture.asset(
                    AppAssets.iconProjects,
                    colorFilter: const ColorFilter.mode(
                        AppColors.lightSurface500, BlendMode.srcIn),
                  ),
                ),
                activeIcon: Column(
                  children: [
                    SvgPicture.asset(
                      AppAssets.iconProjects,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const CommonTabIndicator(
                      width: 40,
                    )
                  ],
                ),
                label: "Project",
              ),
            ],
            currentIndex: widget.selectedTab,
            selectedItemColor: Colors.white,
            unselectedItemColor: AppColors.lightSurface500,
            onTap: widget.onTabSelected,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ],
      ),
    );
  }
}
