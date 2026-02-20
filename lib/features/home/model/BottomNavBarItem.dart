import 'package:flutter/material.dart';

// 底部导航栏model
class BottomNavBarItemModel {
  const BottomNavBarItemModel({
    required this.title,
    required this.navBarItem,
    required this.page,
  });

  // 标题
  final String title;

  // 底部导航栏组件
  final BottomNavigationBarItem navBarItem;

  // 底部导航栏对应展示的页面
  final Widget page;
}
