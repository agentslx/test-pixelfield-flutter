

// GoRouter configuration
import 'package:go_router/go_router.dart';

import 'features/home/home_screen.dart';


class Routes {
  Routes._();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
