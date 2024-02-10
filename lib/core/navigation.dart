import 'package:binary_app/presentation/businesses_feed_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const BusinessesFeedScreen();
      },
    ),
  ],
);
