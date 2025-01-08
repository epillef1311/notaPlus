import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:nota_mais/di/core_di.dart';


class ApiRoute {
  ApiRoute({
    required this.path,
    required this.builder,
    this.name,
    this.children,
  });

  final String? name;
  final String path;
  final Widget Function(GoRouterState state) builder;
  final List<ApiRoute>? children;
}

class ApiRouter {
  ApiRouter({
    required this.routes,
    required this.shellRoutes,
    required this.initialLocation,
    required this.shellWrapper,
  });

  final List<ApiRoute> routes;
  final List<ApiRoute> shellRoutes;
  final Widget Function(Widget child) shellWrapper;
  final String initialLocation;
  final _shellNavigatorKey = CoreDi.getIt<NavigationKeys>().shellKey;
  final _rootNavigatorKey = CoreDi.getIt<NavigationKeys>().rootKey;

  late final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initialLocation,
    routes: _routes,
  );

  GoRouter get router => _router;

  late final List<RouteBase> _routes = [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (_, __, child) => shellWrapper(child),
      routes: [
        ...shellRoutes.map(
          (route) => _mapRoute(route, _shellNavigatorKey),
        ),
      ],
    ),
    ...routes.map(
      (route) => _mapRoute(route, _rootNavigatorKey),
    ),
  ];

  RouteBase _mapRoute(ApiRoute route, GlobalKey<NavigatorState> navKey) =>
      GoRoute(
        name: route.name,
        path: route.path,
        builder: (_, state) => route.builder(state),
        parentNavigatorKey: navKey,
        routes: route.children != null
            ? route.children!.map((route) => _mapRoute(route, navKey)).toList()
            : [],
      );
}
