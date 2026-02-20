import 'package:go_router/go_router.dart';
import './pages/home.dart';

class HomeModuleRoutes {
  List<RouteBase> get routes => [
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const Home(),
    ),
  ];
}
