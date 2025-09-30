import 'package:go_router/go_router.dart';
import 'package:simple_life/page/myself/myself.dart';
import '../page/home/home.dart';

final routes = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => Home()
    ),
    GoRoute(
        path: '/myself',
        name: 'myself',
        builder: (context, state) => Myself()
    )
  ]
);