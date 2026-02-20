import 'package:go_router/go_router.dart';

class PageRouter {
  PageRouter._internal();

  static final PageRouter _instance = PageRouter._internal();

  static PageRouter get instance => _instance;

  factory PageRouter() => _instance;

  GoRouter? _router;

  GoRouter? get router => _router;

  void initRouter(String initRoute, List<RouteBase> routes) {
    _router = GoRouter(initialLocation: initRoute, routes: routes);
  }
}
