import 'package:go_router/go_router.dart';
import 'package:simple_life/page/home/home.dart';

final routes = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', name: 'home', builder: (context, state) => Home()),
    // GoRoute(
    //     path: '/account',
    //     name: 'account',
    //     builder: (context, state) => Myself()
    // )
  ],
);
