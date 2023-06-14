import 'package:flutter/material.dart';
import 'package:test_pixelfield_flutter/features/project/bloc/project_bloc.dart';
import 'package:test_pixelfield_flutter/features/project/ui/project_routes.dart';

import '../../../entities/project.dart';
import '../../../utils/device_utils.dart';
import 'widget/edit_project_fragment.dart';
import 'widget/list_project_fragment.dart';
import 'widget/view_project_fragment.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final GlobalKey<NavigatorState> _subNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_subNavigatorKey.currentState!.canPop()) {
          _subNavigatorKey.currentState!.pop();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        body: Builder(builder: (context) {
          if (DeviceUtils.isMobile(context)) {
            // Mobile
            return _buildMobileLayout();
          } else {
            return _buildTabletLayout();
          }
        }),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return const ListProjectFragment(
      subNavigatorKey: null,
    );
    // return Navigator(
    //   key: _subNavigatorKey,
    //   initialRoute: ProjectRoutes.list,
    //   onGenerateRoute: (settings) {
    //     switch (settings.name) {
    //       case ProjectRoutes.list:
    //         return MaterialPageRoute(
    //           builder: (context) => const ListProjectFragment(
    //             subNavigatorKey: null,
    //           ),
    //         );
    //       case ProjectRoutes.create:
    //         return MaterialPageRoute(
    //           builder: (context) => const EditProjectFragment(),
    //         );
    //       case ProjectRoutes.view:
    //         return MaterialPageRoute(
    //           builder: (context) => ViewProjectFragment(
    //               project: settings.arguments as ProjectEntity),
    //         );
    //     }
    //     return null;
    //   },
    // );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: ListProjectFragment(
              subNavigatorKey: _subNavigatorKey,
            )),
        Expanded(
            flex: 2,
            child: Navigator(
              key: _subNavigatorKey,
              initialRoute: ProjectRoutes.list,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case ProjectRoutes.list:
                    return MaterialPageRoute(
                      builder: (context) => const SizedBox.shrink(),
                    );
                  case ProjectRoutes.create:
                    return MaterialPageRoute(
                      builder: (context) => const EditProjectFragment(),
                    );
                  case ProjectRoutes.view:
                    return MaterialPageRoute(
                      builder: (context) => ViewProjectFragment(
                          project: settings.arguments as ProjectEntity),
                    );
                }
                return null;
              },
            )),
      ],
    );
  }
}
