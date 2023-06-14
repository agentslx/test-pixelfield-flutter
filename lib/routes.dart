// GoRouter configuration
import 'package:go_router/go_router.dart';

import 'entities/project.dart';
import 'features/home/home_screen.dart';
import 'features/project/ui/project_routes.dart';
import 'features/project/ui/widget/edit_project_fragment.dart';
import 'features/project/ui/widget/list_project_fragment.dart';
import 'features/project/ui/widget/view_project_fragment.dart';

class Routes {
  Routes._();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: ProjectRoutes.list,
        name: ProjectRoutes.list,
        builder: (context, state) => const ListProjectFragment(),
      ),
      GoRoute(
        path: ProjectRoutes.create,
        name: ProjectRoutes.create,
        builder: (context, state) => const EditProjectFragment(),
      ),
      GoRoute(
        path: ProjectRoutes.view,
        name: ProjectRoutes.view,
        builder: (context, state) =>
            ViewProjectFragment(project: state.extra as ProjectEntity),
      ),
    ],
  );
}

// case ProjectRoutes.list:
// return MaterialPageRoute(
// builder: (context) => const ListProjectFragment(
// subNavigatorKey: null,
// ),
// );
// case ProjectRoutes.create:
// return MaterialPageRoute(
// builder: (context) => const EditProjectFragment(),
// );
// case ProjectRoutes.view:
// return MaterialPageRoute(
// builder: (context) => ViewProjectFragment(
// project: settings.arguments as ProjectEntity),
// );
