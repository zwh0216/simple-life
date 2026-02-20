import 'package:go_router/go_router.dart';
import 'package:simple_life/core/router/router.dart';
import 'package:simple_life/features/home/routes.dart';

void registryAllModuleRoutes() {
  final List<RouteBase> routes = [...HomeModuleRoutes().routes];

  PageRouter.instance.initRouter('/home', routes);
}
