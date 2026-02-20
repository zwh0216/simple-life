import 'package:flutter/material.dart';
import 'package:simple_life/app/registry_app.dart';
import 'package:simple_life/core/router/router.dart';

void main() {
  // 初始化路由
  registryAllModuleRoutes();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This pages is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: PageRouter.instance.router);
  }
}

